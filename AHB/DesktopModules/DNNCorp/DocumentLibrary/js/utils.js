/****************************************************************/
/* security permissions functions
/****************************************************************/
function viewCheck(oThis, sAddId, sEditId, sDeleteId, sTrackId, sChangeSecurityId, sModerateId, sAddDocId, sEditDocId, sTrackDocId) {
    if (!oThis.checked) {
        document.getElementById(sAddId).checked = false;
        document.getElementById(sEditId).checked = false;
        document.getElementById(sDeleteId).checked = false;
        document.getElementById(sChangeSecurityId).checked = false;
        if (document.getElementById(sTrackId) != null) document.getElementById(sTrackId).checked = false;
        if (document.getElementById(sModerateId) != null) document.getElementById(sModerateId).checked = false;
        if (document.getElementById(sAddDocId) != null) document.getElementById(sAddDocId).checked = false;
        if (document.getElementById(sEditDocId) != null) document.getElementById(sEditDocId).checked = false;
        if (document.getElementById(sTrackDocId) != null) document.getElementById(sTrackDocId).checked = false;
    }
}

function addCheck(oThis, sViewId, sAddDocId) {
    if (oThis.checked) {
        document.getElementById(sViewId).checked = true;
    }
    if (!oThis.checked) {
        if (document.getElementById(sAddDocId) != null) document.getElementById(sAddDocId).checked = false;
    }
}

function editCheck(oThis, sViewId, sChangeSecurityId) {
    if (oThis.checked) {
        document.getElementById(sViewId).checked = true;
    }
    if (!oThis.checked) {
        document.getElementById(sChangeSecurityId).checked = false;
    }
}

function deleteCheck(oThis, sViewId) {
    if (oThis.checked) {
        document.getElementById(sViewId).checked = true;
    }
}

function trackCheck(oThis, sViewId) {
    if (oThis.checked) {
        document.getElementById(sViewId).checked = true;
    }
}

function moderateCheck(oThis, sViewId) {
    if (oThis.checked) {
        document.getElementById(sViewId).checked = true;
    }
}

function changeSecurityCheck(oThis, sViewId, sEditId) {
    if (oThis.checked) {
        document.getElementById(sViewId).checked = true;
        document.getElementById(sEditId).checked = true;
    }
}

function addDocCheck(oThis, sViewId, sAddId, sEditDocId) {
    if (oThis.checked) {
        document.getElementById(sViewId).checked = true;
        document.getElementById(sAddId).checked = true;
        if (document.getElementById(sEditDocId) != null) document.getElementById(sEditDocId).checked = true;
    }
}

function editDocCheck(oThis, sViewId, sAddDocId) {
    if (oThis.checked) {
        document.getElementById(sViewId).checked = true;
    }
    if (!oThis.checked) {
        if (document.getElementById(sAddDocId) != null) document.getElementById(sAddDocId).checked = false;
    }
}

function trackDocCheck(oThis, sViewId) {
    if (oThis.checked) {
        document.getElementById(sViewId).checked = true;
    }
}

/****************************************************************/
/* popup functions
/****************************************************************/
function popUp(sUrl) {
    var oWin = window.open(sUrl, '', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=340,height=390,left=50,top=50');
    oWin.focus();
}

function popUp2(sUrl, sTitle) {
    var oWin = window.open(sUrl, sTitle, 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width=340,height=390,left=50,top=50');
    oWin.focus();
}

function popUp3(sUrl, sTitle) {
    var oWin = window.open(sUrl, sTitle, 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width=440,height=390,left=50,top=50');
    oWin.focus();
}

/****************************************************************/
/* iframe functions
/****************************************************************/

var g_sIFrameId = "";
var g_sWidthElementId = "";

function resizeIFrame() {
    var oIFrame = document.getElementById(g_sIFrameId);
    var oWidthElement = document.getElementById(g_sWidthElementId);
	oIFrame.style.display = "block";
    if (oIFrame && oWidthElement && !window.opera) {
        if (oIFrame.contentDocument && oIFrame.contentDocument.body.offsetHeight) {
            //ns6 syntax
            oIFrame.height = oIFrame.contentDocument.body.offsetHeight + 20;
            if (oIFrame.contentDocument.body.offsetWidth > 0) {
                oWidthElement.style.width = oIFrame.contentDocument.body.offsetWidth;
            }
        }
        else if (oIFrame.Document && oIFrame.Document.body.scrollHeight) {
            //ie5+ syntax
            oIFrame.height = oIFrame.Document.body.scrollHeight + 20;
            if (oIFrame.Document.body.scrollWidth > 0) {
                oWidthElement.style.width = oIFrame.Document.body.scrollWidth;
            }
        }
    }
}
