//global variables
var g_oSrc = null;
var g_oDest = null;
var g_sResponseError = null;
//
//gridDocument=0;editCategory=1;editFolder=2;editDocument=3;uploadDocument=4;documentLibrary=5;editDocumentVersions=6;
var g_oDetailPanes = new Array(7);
var g_oDetailPaneToDisplay = null;
var g_oDetailPaneDisplayed = null;
var g_iDetailPaneDefault = 5;

/****************************************************************/
/* functions called directly from anthem objects to update tree	*/
/****************************************************************/
function updateTreeNodeAfterEditCallback(sId, sParentId, sName, sXtra, bDirectView) {
    var oNode = t.getNodeById(sId);
    var oNodeParent = null;

    oNode.capt = sName;
    oNode.xtra = sXtra;

    var sIconPath = "";

    if (bDirectView) {
        if (g_bIsFolder)
            sIconPath = g_sImagesPath + "/tFolderLock.png";
        else
            sIconPath = g_sImagesPath + "/tCategoryLock.png";

        oNode.ic = new Array(sIconPath, '');
    }
    else {
        if (bDirectView != null) {
            if (g_bIsFolder)
                sIconPath = g_sImagesPath + "/tFolder.png";
            else
                sIconPath = g_sImagesPath + "/tCategory.png";

            oNode.ic = new Array(sIconPath, '');
        }
    }

    if (sParentId != 'FOL|-1' && sParentId != 'CAT|-1') {
        if (oNode.pr.orgId != sParentId) {
            oNodeParent = t.getNodeById(sParentId);
            var oNodeArray = new Array();
            oNodeArray.push(oNode);
            t.moveChild(oNodeArray, oNodeParent, 1);
        }
        t.reloadNode(sParentId);
    }
    else {
        t.reloadNode(sId);
    }
}

function updateTreeNodeAfterInsertCallback(sId, sParentId, sName, sXtra, bDirectView) {
    var sIconPath = "";
    if (bDirectView) {
        if (g_bIsFolder) sIconPath = g_sImagesPath + "/tFolderLock.png"; else sIconPath = g_sImagesPath + "/tCategoryLock.png";
    }
    else {
        if (g_bIsFolder) sIconPath = g_sImagesPath + "/tFolder.png"; else sIconPath = g_sImagesPath + "/tCategory.png";
    }

    if (g_bIsFolder) {
        if (sParentId.split('|')[0] == 'FOLNOROOT') {
            var oParentNode = t.getNodeById(sParentId);
            oParentNode.capt = 'Document Library';
            oParentNode.xtra = "NA";

            t.add(sId, sParentId, sName, "", sIconPath, false, false, sXtra);
            t.setNodeCtxMenu(sId, ctxFol0);
        }
        else if (sXtra != null) {
            t.add(sId, sParentId, sName, "", sIconPath, false, false, sXtra);
            t.setNodeCtxMenu(sId, ctxFol1);
        }
        else {
            t.add(sId, sParentId, sName, "", sIconPath, false, false, t.getNodeById(sParentId).xtra.replace('ROOT', ''));
            t.setNodeCtxMenu(sId, ctxFol1);
        }
    }
    else {
        if (sParentId.split('|')[0] == 'CATNOROOT') {
            var oParentNode = t.getNodeById(sParentId);
            oParentNode.capt = 'Document Library';
            oParentNode.xtra = "NA";

            t.add(sId, sParentId, sName, "", sIconPath, false, false, sXtra);
            t.setNodeCtxMenu(sId, ctxCat0);
        }
        else if (sXtra != null) {
            t.add(sId, sParentId, sName, "", sIconPath, false, false, sXtra);
            t.setNodeCtxMenu(sId, ctxCat1);
        }
        else {
            t.add(sId, sParentId, sName, "", sIconPath, false, false, t.getNodeById(sParentId).xtra.replace('ROOT', ''));
            t.setNodeCtxMenu(sId, ctxCat1);
        }
    }
    t.reloadNode(sParentId);
    t.expandNode(sParentId);
}

function updateTreeNodeAfterDeleteCallback(sId, sParentId) {
    t.remove(sId, false);
    t.reloadNode(sParentId);
    t.expandNode(sParentId);
}

/****************************************************************/
/* events & actions for node click								*/
/****************************************************************/
function noTree_ev_Click(id) {
    t.selectNodeById(id);
    ev_Click();
}

function ev_Click(e) {
    //alert('id=' + t.getSelNode().orgId + ' - ' + 'prId=' + t.getSelNode().pr.orgId + ' - ' + 'capt=' + t.getSelNode().capt + ' - ' + 'xtra=' + t.getSelNode().xtra);
    if (t.getSelNode().xtra.split('|')[0] == 'FOLNOROOT') {
        displayDetailPanes(2);
        Anthem_InvokeControlMethod(g_sEditFolderClientId, 'BindData', [-1, -1, 'A'], processCallback);
    }
    else if (t.getSelNode().xtra.split('|')[0] == 'CATNOROOT') {
        displayDetailPanes(1);
        Anthem_InvokeControlMethod(g_sEditCategoryClientId, 'BindData', [-1, -1, 'A'], processCallback);
    }
    else if (t.getSelNode().xtra.split('|')[0] != "NA") {
        displayDetailPanes(0);
        Anthem_InvokeControlMethod(g_sGridDocumentClientId, 'BindData', [t.getSelNode().orgId.split('|')[1], g_bIsFolder], processCallback);
    }
    else {
        displayDetailPanes(-1);
    }
}

/****************************************************************/
/* events & actions for node dblclick							*/
/****************************************************************/
function ev_DblClick(e) { return; }

/****************************************************************/
/* events & actions for node mouse down							*/
/****************************************************************/
//function ev_MouseDown(e) {
//	clearStatus();
//	clearContextActions();
//}

/****************************************************************/
/* events & actions for node mouse over							*/
/****************************************************************/
function ev_MouseOver(e, id) {
    if (e.ctrlKey) {
        t.expandNode(id);
    }
}

/****************************************************************/
/* events & actions for node drag								*/
/****************************************************************/
function ev_NodeDrag(e) {
    var oSrc = nlsddSession.srcData[0];
    if (oSrc.xtra) {
        if (
			(oSrc.xtra.split('|')[0] != 'FOLNOROOT' && oSrc.xtra.split('|')[0] != 'CATNOROOT' && oSrc.xtra.split('|')[0] != 'FOLROOT' && oSrc.xtra.split('|')[0] != 'CATROOT' && oSrc.xtra.split('|')[0] != 'NA')
			&&
			(oSrc.xtra.split('|')[3] == "1") //can be edited
		) {
            if (e.shiftKey) {
                nlsddSession.action = NlsDDAction.DD_INSERT;
            } else {
                nlsddSession.action = NlsDDAction.DD_APPEND;
            }
        }
        else {
            var g = NlsGetElementById('ddGesture');
            g.innerHTML = '';
            g.style.display = 'none';
        }
    }
    else {
        var g = NlsGetElementById('ddGesture');
        g.innerHTML = '';
        g.style.display = 'none';
    }
}

/****************************************************************/
/* events & actions for node drop							*/
/****************************************************************/
function ev_NodeDrop(e) {
    if (!nlsddSession) return;
    if (!nlsddSession.action) return;
    if (nlsddSession.destData == null) return;
    if (nlsddSession.destData.xtra.split('|')[2] == "0") return; /*cannot add fol or cat*/
    if (nlsddSession.srcObj.tId == nlsddSession.destObj.tId) {
        if (
			(nlsddSession.srcData[0].xtra.split('|')[0] == nlsddSession.destData.xtra.split('|')[0])
			||
			(nlsddSession.srcData[0].xtra.split('|')[0] == 'FOL' && nlsddSession.destData.xtra.split('|')[0] == 'FOLROOT')
			||
			(nlsddSession.srcData[0].xtra.split('|')[0] == 'CAT' && nlsddSession.destData.xtra.split('|')[0] == 'CATROOT')
			) {
            displayDetailPanes(-1);

            var oSrcTree = nlsddSession.srcObj;
            var oSrc = nlsddSession.srcData[0];
            var oSrcPr = nlsddSession.srcData[0].pr;
            var oDest = null;
            var bDropSuccess = true;

            switch (nlsddSession.action) {
                case NlsDDAction.DD_INSERT:
                    this.tree.moveChild(nlsddSession.srcData, nlsddSession.destData, 2);
                    resetNlsddSession(nlsddSession.srcData, nlsddSession.destData, 2);
                    break;
                case NlsDDAction.DD_APPEND:
                    if (!g_bShowDeleted) {
                        if (this.tree.moveChild(nlsddSession.srcData, nlsddSession.destData, 1) == false) {
                            bDropSuccess = false;
                        }
                    }
                    else {
                        /* ensure recycle bin always at bottom */
                        this.tree.moveChild(nlsddSession.srcData, nlsddSession.destData, 1);
                        //--this.tree.moveChild(t.getNodeById('RecycleBin'), t.rt, 1);
                    }

                    break;
            }

            /*folder or category move*/
            if (bDropSuccess) {
                if (nlsddSession.srcData[0].xtra.split('|')[0] == 'FOL' || nlsddSession.srcData[0].xtra.split('|')[0] == 'CAT') {
                    oDest = nlsddSession.destData;
                    var iOrder = 0;
                    var i = 0;
                    oSrcTree.loopTree(oDest, function (n) { if (oDest == t.rt && n.pr != null && n.pr.orgId == oDest.orgId) { i++; if (n.orgId == oSrc.orgId) { iOrder = i; } } else if (n.pr == null) return; else if (n.xtra == '') return; else if (n.pr.orgId == oDest.orgId) { i++; if (n.orgId == oSrc.orgId) { iOrder = i; } } });
                    if (oSrc.orgId != oDest.orgId) {
                        g_oSrc = oSrc;
                        g_oDest = oDest;
                        if (g_bIsFolder) {
                            Anthem_InvokeControlMethod(g_sEditFolderClientId, 'UpdateFolder', [oSrc.orgId.split('|')[1], oDest.orgId.split('|')[1], oSrc.capt, iOrder], processCallback);
                        }
                        else {
                            Anthem_InvokeControlMethod(g_sEditCategoryClientId, 'UpdateCategory', [oSrc.orgId.split('|')[1], oDest.orgId.split('|')[1], oSrc.capt, iOrder], processCallback);
                        }
                    }
                }
            }
        }
    }
}

function resetNlsddSession(src, dest, type) {
    if (!src || !dest) return;
    if (src.equals(dest)) return;
    var tmp = dest;
    while (tmp.pr) { if (tmp.equals(src)) return; tmp = tmp.pr; }
    switch (type) {
        case 2:
            if (dest.equals(nlsddSession.srcObj.rt)) return;
            nlsddSession.destData = dest.pr;
            break;
    }
}

/****************************************************************/
/* ctx menu custom for ctxFol menu 1							*/
/****************************************************************/
function ctxFolMenuCustom1(selNode) {
    this.hideItem(1, false);
    this.hideItem(2, false);
    this.hideItem(3, false);
    this.hideItem(4, false);

    var iCount = 0;

    if (selNode.xtra.split('|')[2] == 0) {
        //add folder
        this.hideItem(1, true);
        iCount = iCount + 1;
    }
    if (selNode.xtra.split('|')[3] == 0) {
        //edit folder
        this.hideItem(2, true);
        iCount = iCount + 1;
    }
    if (selNode.xtra.split('|')[4] == 0) {
        //delete folder
        this.hideItem(3, true);
        iCount = iCount + 1;
    }
    if (selNode.xtra.split('|')[8] == 0) {
        //add document
        this.hideItem(4, true);
        iCount = iCount + 1;
    }

    if (iCount == 4) {
        return false;
    }
}

/****************************************************************/
/* ctx menu for ctxFol menu 1									*/
/****************************************************************/
function ctxFolMenu1(selNode, menuId, itemId) {
    switch (itemId) {
        case '1':
            //add folder
            displayDetailPanes(2);
            Anthem_InvokeControlMethod(g_sEditFolderClientId, 'BindData', [-1, t.getSelNode().orgId.split('|')[1], 'A'], processCallback);
            break;
        case '2':
            //edit folder
            displayDetailPanes(2);
            Anthem_InvokeControlMethod(g_sEditFolderClientId, 'BindData', [t.getSelNode().orgId.split('|')[1], (t.getSelNode().pr != null) ? t.getSelNode().pr.orgId.split('|')[1] : -1, 'E'], processCallback);
            break;
        case '3':
            //delete folder
            displayDetailPanes(2);
            Anthem_InvokeControlMethod(g_sEditFolderClientId, 'BindData', [t.getSelNode().orgId.split('|')[1], (t.getSelNode().pr != null) ? t.getSelNode().pr.orgId.split('|')[1] : -1, 'D'], processCallback);
            break;
        case '4':
            //add document
            //displayDetailPanes(3);
            //Anthem_InvokeControlMethod(g_sEditDocumentClientId, 'BindData', [-1, 'A'], processCallback);
            displayDetailPanes(4);
            Anthem_InvokeControlMethod(g_sUploadDocumentClientId, 'BindData', [-1, t.getSelNode().orgId.split('|')[1]], processCallback);
            break;
    }
}

/****************************************************************/
/* file upload module actions									*/
/****************************************************************/
function fileUploaderExecuted(iDocumentId, sIsFolderModerated) {
    displayDetailPanes(3);
    var sActionType = 'EU';
    if (sIsFolderModerated == 'true') {
        sActionType = 'EUM'
    }
    Anthem_InvokeControlMethod(g_sEditDocumentClientId, 'BindData', [iDocumentId, sActionType], processCallback);
}

/****************************************************************/
/* file upload module actions	unzip							*/
/****************************************************************/
function fileUploaderExecutedUnzip(sDocumentsIds) {
    displayDetailPanes(-1);
    Anthem_InvokeControlMethod(g_sEditDocumentClientId, 'SendTrackMails', [sDocumentsIds], processCallback);
}

/****************************************************************/
/* ctx menu custom for ctxCat menu 1							*/
/****************************************************************/
function ctxCatMenuCustom1(selNode) {
    this.hideItem(1, false);
    this.hideItem(2, false);
    this.hideItem(3, false);

    var iCount = 0;

    if (selNode.xtra.split('|')[2] == 0) {
        //add category
        this.hideItem(1, true);
        iCount = iCount + 1;
    }
    if (selNode.xtra.split('|')[3] == 0) {
        //edit category
        this.hideItem(2, true);
        iCount = iCount + 1;
    }
    if (selNode.xtra.split('|')[4] == 0) {
        //delete category
        this.hideItem(3, true);
        iCount = iCount + 1;
    }

    if (iCount == 3) {
        return false;
    }
}

/****************************************************************/
/* ctx menu for ctxCat menu 1										*/
/****************************************************************/
function ctxCatMenu1(selNode, menuId, itemId) {
    switch (itemId) {
        case '1':
            //add category
            displayDetailPanes(1);
            Anthem_InvokeControlMethod(g_sEditCategoryClientId, 'BindData', [-1, t.getSelNode().orgId.split('|')[1], 'A'], processCallback);
            break;
        case '2':
            //edit category
            displayDetailPanes(1);
            Anthem_InvokeControlMethod(g_sEditCategoryClientId, 'BindData', [t.getSelNode().orgId.split('|')[1], (t.getSelNode().pr != null) ? t.getSelNode().pr.orgId.split('|')[1] : -1, 'E'], processCallback);
            break;
        case '3':
            //delete category
            displayDetailPanes(1);
            Anthem_InvokeControlMethod(g_sEditCategoryClientId, 'BindData', [t.getSelNode().orgId.split('|')[1], (t.getSelNode().pr != null) ? t.getSelNode().pr.orgId.split('|')[1] : -1, 'D'], processCallback);
            break;
    }
}

/****************************************************************/
/* utility functions											*/
/****************************************************************/

/**** 25/10/2006 ****/
function showErrorStatus(sErrorMessage) {
    var oStatus = document.getElementById(g_sLblStatusClientId);
    oStatus.innerHTML = '<font color=\'red\'>' + sErrorMessage + '</font>';
    alert('error - please see the status bar for details');
    return false;
}

function processRequest(sContextHeader) {
    clearStatus();
    var oProcessRequest = document.getElementById(g_sDivProcessRequestClientId);
    oProcessRequest.style.display = 'inline';

    if (sContextHeader != '') {
        document.getElementById('spanContextHeader_' + g_sClientId).innerHTML = sContextHeader;
    }

    if (self.treeDD) {
        treeDD.onNodeDrag = ev_DummyNodeDrag;
    }
    if (self.t) {
        t.selectNode = ev_Dummy;
        t.contextMenu = ev_Dummy;
    }
}

function processCallback(oResponse) {
    if (processResponseFromCallback(oResponse.error, false)) {
        window.location = "#dltop";
        setFocus(g_oDetailPaneToDisplay);
    }
}

function setFocus(oRootElement) {
    if (oRootElement) {
        var inputs = oRootElement.getElementsByTagName("input");
        if (inputs.length > 0) {
            for (var i = 0; i < inputs.length; i++) {
                if (!inputs[i].disabled) {
                    inputs[i].focus();
                    break;
                }
            }
        }
    }
}

function processResponseFromCallback(sResponseError, bShowMessageOnSuccess) {
    if (sResponseError != null) {
        g_sResponseError = sResponseError;
        return false;
    }
    else {
        var oDetailPaneDefault = document.getElementById(g_oDetailPanes[g_iDetailPaneDefault]);
        if (oDetailPaneDefault) {
            oDetailPaneDefault.style.display = "none";
        }

        if (g_oDetailPaneToDisplay) {
            for (var i = 0; i < g_oDetailPanes.length; i++) {
                var oDiv = document.getElementById(g_oDetailPanes[i]);
                if (oDiv != null) {
                    if (oDiv != g_oDetailPaneToDisplay) {
                        oDiv.style.display = 'none';
                    }
                }
            }
            g_oDetailPaneToDisplay.disabled = false;
            g_oDetailPaneToDisplay.style.display = "block";
            g_oDetailPaneDisplayed = g_oDetailPaneToDisplay;
        }
        else {
            if (oDetailPaneDefault) {
                oDetailPaneDefault.style.display = "block";
            }
        }
        return true;
    }
}

function processResponseAfterCallback() {
    var oProcessRequest = document.getElementById(g_sDivProcessRequestClientId);
    oProcessRequest.style.display = 'none';
    var oStatus = document.getElementById(g_sLblStatusClientId);
    if (g_sResponseError != null) {
        oStatus.innerHTML = '<font color=\'red\'>error - ' + g_sResponseError + '</font>';
        alert('error - please see the status bar for details');
    }
    else {
        /*	oStatus.innerHTML = '';*/
    }
    g_oResponseError = null;

    if (self.treeDD) {
        treeDD.onNodeDrag = ev_NodeDrag;
    }
    if (self.t) {
        t.selectNode = NlsTree.prototype.selectNode;
        t.contextMenu = NlsTree.prototype.contextMenu;
    }
}

function ev_DummyNodeDrag(e) {
    var g = NlsGetElementById('ddGesture');
    g.innerHTML = '';
    g.style.display = 'none';
}
function ev_Dummy(e) {
    return false;
}

function processResponse(oResponseError, bShowMessageOnSuccess) {
    var oProcessRequest = document.getElementById(g_sDivProcessRequestClientId);
    oProcessRequest.style.display = 'none';
    var oStatus = document.getElementById(g_sLblStatusClientId);
    if (oResponseError != null) {
        oStatus.innerHTML = '<font color=\'red\'>error - ' + oResponseError + '</font>';
        alert('error - please see the status bar for details');
        return false;
    }
    else {
        oStatus.innerHTML = (!bShowMessageOnSuccess) ? '' : '<font color=\'green\'>success</font>';
        return true;
    }
}

function processResponseAnonymous() {
    var oProcessRequest = document.getElementById(g_sDivProcessRequestClientId);
    oProcessRequest.style.display = 'none';
    var oStatus = document.getElementById(g_sLblStatusClientId);
    oStatus.innerHTML = '';
}

function clearStatus() {
    var oStatus = document.getElementById(g_sLblStatusClientId);
    oStatus.innerHTML = '';
}

function toggleContextAction(sImg, sDiv) {
    var oImg = document.getElementById(sImg);
    var oDiv = document.getElementById(sDiv);
    if (oDiv.style.display == 'none') {
        oDiv.style.display = 'block';
        oImg.src = g_sImagesPath + '\\minusnl.png';
    }
    else {
        oDiv.style.display = 'none';
        oImg.src = g_sImagesPath + '\\plusnl.png';
    }
}

function displayDetailPanes(iDisplay) {
    g_oDetailPaneToDisplay = document.getElementById(g_oDetailPanes[iDisplay]);

    if (g_oDetailPaneToDisplay) {
        if (g_oDetailPaneDisplayed) {
            if (dl_isIE()) {
                /*IE*/
                g_oDetailPaneDisplayed.disabled = true;
            }
            else {
                /* FF */
                var oDetailPaneDefault = document.getElementById(g_oDetailPanes[g_iDetailPaneDefault]);
                if (oDetailPaneDefault != null) {
                    if (iDisplay != 0) { /*except for grid pane*/
                        resetDetailPanesContent(oDetailPaneDefault);
                    }
                    document.getElementById(g_sLblMessageClientId).innerText = g_sLblMessageValue;
                    oDetailPaneDefault.style.display = 'block';
                }
                for (var i = 0; i < g_oDetailPanes.length; i++) {
                    if (i != g_iDetailPaneDefault) {
                        var oDiv = document.getElementById(g_oDetailPanes[i]);
                        if (oDiv != null) {
                            oDiv.style.display = 'none';
                        }
                    }
                }
            }
        }
        if (iDisplay != 0) { /*except for grid pane*/
            resetDetailPanesContent(g_oDetailPaneToDisplay);
        }
    }

    if (iDisplay == -1) {
        var oDivDefault = document.getElementById(g_oDetailPanes[g_iDetailPaneDefault]);
        if (oDivDefault != null) {
            resetDetailPanesContent(oDivDefault);
            document.getElementById(g_sLblMessageClientId).innerText = '';
            oDivDefault.style.display = 'block';
        }
        for (var i = 0; i < g_oDetailPanes.length; i++) {
            if (i != g_iDetailPaneDefault) {
                var oDiv = document.getElementById(g_oDetailPanes[i]);
                if (oDiv != null) {
                    oDiv.style.display = 'none';
                }
            }
        }
    }
}

function resetDetailPanesContent(oDiv) {
    var oInputs = oDiv.getElementsByTagName('input');
    for (var i = 0; i < oInputs.length; i++) {
        if (oInputs[i].type == 'radio' || oInputs[i].type == 'checkbox') {
            oInputs[i].checked = false;
        }
        else {
            oInputs[i].value = '';
        }
    }
    var oTextAreas = oDiv.getElementsByTagName('textarea');
    for (var i = 0; i < oTextAreas.length; i++) {
        oTextAreas[i].innerHTML = '';
    }
    var oSelects = oDiv.getElementsByTagName('select');
    for (var i = 0; i < oSelects.length; i++) {
        oSelects[i].selectedIndex = 0;
    }
}

function dl_isIE() {
    if (document.all)
        return true;
    else
        return false;
}
