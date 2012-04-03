<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_products_edit.ascx.cs"
    Inherits="DotNetNuke.Professional.Commerce.admin_products_edit" %>
    <%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<script type="text/javascript">
    var formdefs = {};
    
    var prodval = {
        "ProductName": {
            "required": true,
            "minlength": 1,
            "msg1": "[RESX:Product:Error:NameRequired]"
        },
        "ProductSKU": {
            "required": true,
            "minlength": 1,
            "msg1": "[RESX:Product:Error:SKURequired]"
        }
    };
     
    var currSamp = '<%=formatSample %>';
    formdefs.prod = prodval;
    var fileModalOptions = {
        "height":275,
        "width":500,
        "title": "[RESX:UploadFile]"
    };
    var groupEditModalOptions = {
        "height":175,
        "width":450,
        "title":"[RESX:ProductGroupEdit]"
    };
    var propEditModalOptions = {
        "height": 400,
        "width": 500,
        "title": "[RESX:PropertyEditor]"
    };
    function saveProduct() {
        var isValid = true;
        isValid = ap_Validate('prod_ProductName', formdefs.prod.ProductName, false);
        isValid = ap_Validate('prod_ProductSKU', formdefs.prod.ProductSKU, false);
        <%if (SupportsARB){ %>
         var opt = document.getElementById('prod_ProductType');
         
         if (opt.selectedIndex > 0) {
            var ptype = document.getElementById('prod_RecInterval');
            ptype = ptype.options[ptype.selectedIndex].value;
            var recInt = document.getElementById('prod_RecLength').value;
            if (recInt != '') {
                recInt = parseInt(recInt);
            } else {
                isValid = false;
            };
            if (recInt < 0) {
                isValid = false;
            };
            var recOcc = document.getElementById('prod_RecOccurances').value;
            if (recOcc !='') {
                recOcc = parseInt(recOcc);
            }else{
                isValid = false;
            }
            if (recOcc < 0) {
                isValid = false;
            };
            if (ptype == 'M') {
                if (recInt < 1 || recInt > 12) {
                    isValid = false;
                    alert('[RESX:Error:MonthUnits]');
                }
            }
            if (ptype == 'D') {
                if (recInt < 7 || recInt > 365) {
                    isValid = false;
                    alert('[RESX:Error:DayUnits]');
                }
            }
            
         }
        <%} %>
        var price = document.getElementById('prod_Price');
        if (dnn_comm.utils.Trim(price.value) == '') {
            price.value = 0;
        };
        if (dnn_comm.admin.CheckNumber(price.value, currSamp) == false){
            isValid = false;
            price.style.backgroundColor = '#fbc2c4';
            alert('[RESX:Error:InvalidCurrency]');
        }else{
            price.style.backgroundColor = '';
        };
        var cost = document.getElementById('prod_Cost');
        if (dnn_comm.utils.Trim(cost.value) == '') {
            cost.value = 0;
        };
        if (dnn_comm.admin.CheckNumber(cost.value, currSamp) == false){
            isValid = false;
            cost.style.backgroundColor = '#fbc2c4';
            alert('[RESX:Error:InvalidCurrency]');
        }else{
            cost.style.backgroundColor = '';
        };
        var shipFee = document.getElementById('prod_ShipFee');
        if (dnn_comm.utils.Trim(shipFee.value) == '') {
            shipFee.value = 0;
        };
        if (dnn_comm.admin.CheckNumber(shipFee.value, currSamp)==false){
            isValid = false;
            alert('[RESX:Error:InvalidCurrency]');
            shipFee.style.backgroundColor = '#fbc2c4';
        }else{
            shipFee.style.backgroundColor = '';
        };
        if (isValid) {
            var productNew = dnn_comm.form.PackageForm(product, 'prod_');
            
            dnn_comm.admin.ShowMsg('[RESX:PleaseWait]', 'loading');
            var params = dnn_comm.utils.ObjectToParams(productNew);
            params = 'cpview=admin_products_edit&action=save&' + params;

            dnn_comm.utils.Callback(params, '', saveProductComplete);
            
        }else{
            dnn_comm.admin.HideMsg();
        }

    };

   
    function saveProductComplete(result) {
        product = null;
        product = result;
        loadProduct();
        dnn_comm.admin.HideMsg(function () {
            dnn_comm.admin.ShowMsg('[RESX:SaveComplete]', 'positive');
            setTimeout(function () {
                dnn_comm.admin.HideMsg();
            }, 1600);
        });
    };
    function loadProduct() {
        if (typeof (product) != 'undefined') {
            product.PostOrderInstructions = unescape(product.PostOrderInstructions);
            product.ProductName = unescape(product.ProductName);
            product.ProductSKU = unescape(product.ProductSKU);
            dnn_comm.form.BindForm(product, 'prod_');
            currAddToRoles = product.AddToRoles;
            currAllowedRoles = product.AllowedRoles;
            
            document.getElementById('prod_ProductId').value = product.ProductId;
            document.getElementById('ObjectOwnerKey').value = product.ProductId;
            var upForm = document.getElementById('frmUP');
            if (upForm != null) {
                var upFormAction = '<%=Page.ResolveUrl("~/desktopmodules/dnncorp/commerce/handlers/up.ashx") %>?portalid=<%=PortalId %>&language=<%=sLanguage %>';
                upFormAction += '&prod=' + product.ProductId;
                upForm.setAttribute('action', upFormAction);
            }
            apadmin_getProperties(0, document.getElementById('prod_ProductId').value);
            ap_getFiles(document.getElementById('prod_ProductId').value);
            $('#prodTabs').dnnTabs({ disabled: [], selected:0 });
            <% if (SupportsARB) { %>
            if (product.ProductType == 0) {
                document.getElementById('recPaymentOptions').style.display = 'none';
            }else{
            document.getElementById('recPaymentOptions').style.display = 'block';
            };
            <%} %>
        };

    };

    function createUpload() {
        var p = document.getElementById('uploader');
        if (p.hasChildNodes()) {
            if (p.firstChild.tagName == 'FORM') {
                return;
            };
        };
        var f = document.createElement('form');
        f.setAttribute('method', 'post');
        f.setAttribute('enctype', 'multipart/form-data');
        f.setAttribute('name', 'frmUP');
        f.setAttribute('id', 'frmUP');
        f.setAttribute('action', '<%=Page.ResolveUrl("~/desktopmodules/dnncorp/commerce/handlers/up.ashx") %>?portalid=<%=PortalId %>&prod=<%=sProductId %>&language=<%=sLanguage %>');
        p.appendChild(f);
        $('#uploaderForm').appendTo('#frmUP');

    };
    function ap_upload() {
        
        var p = document.getElementById('uploader');
        var f = document.getElementById('frmUP');
        var inp = document.getElementById('tmpUpload');
        var title = document.getElementById('title');
        var dte = document.getElementById('purchasedate');
        var isValid = true;
        if (dnn_comm.utils.Trim(title.value) == '' || dnn_comm.utils.Trim(title.value).length < 1) {
            isValid = false;
        };
        if (dnn_comm.utils.Trim(dte.value) == '' || dnn_comm.utils.Trim(dte.value).length < 1) {
            isValid = false;
        };
        if (inp.value == '' || inp.value.length < 5) {
            isValid = false;
        };
        if (isValid) {
            dnn_comm.admin.ShowMsg('[RESX:PleaseWait]', 'loading');
            AIM.submit(f, { 'onStart': startCallback, 'onComplete': completeCallback });
            f.submit();
        };
        
    };
    function startCallback() {
        return true;
    };
    function completeCallback(response) {
        dnn_comm.admin.HideMsg();
        dnn_comm.admin.DialogClose('uploadFile');
        ap_getFiles(product.ProductId);
    };
    function ap_getFiles(pid) {
        if (typeof (pid) != 'string') {
            pid = '<%=sProductId %>';
        }
        if (pid != '') {
            var tmp = {};
            tmp.action = 33;
            tmp.prod = pid;
            ap_callback(JSON.stringify(tmp), ap_getFilesComplete);
        };
    };
    function ap_getFilesComplete(result) {
        var ul = document.getElementById('ul-filelist');
        dnn_comm.utils.RemoveChildNodes('ul-filelist');
        if (result.length > 0) {
            var row = {};
            for (var i = 0; i < result.length; i++) {
                row = result[i];
                var li = document.createElement('li');
                li.setAttribute('id', i);
                var spanExp = document.createElement('span');
                spanExp.className = 'dnn-modcp-sprite16 dnn-modcp-delete12';
                spanExp.setAttribute('style', 'float:left;');
                spanExp.setAttribute('id', row.FileId);
                spanExp.onclick = function () { ap_fileDelete(this.id); };
                li.appendChild(spanExp);
                var span = document.createElement('b');
                
                span.appendChild(document.createTextNode(row.Title + ' '));
                li.appendChild(span);
                var spanlng = document.createElement('span');
                spanlng.appendChild(document.createTextNode(row.FileName));
        
                li.appendChild(spanlng)
                ul.appendChild(li);

            };
        };
    };
    function ap_fileDelete(fid) {
        if (confirm('[RESX:Confirm:Delete]')) {
            var tmp = {};
            tmp.action = 34;
            tmp.fid = fid;
            ap_callback(JSON.stringify(tmp), ap_getFiles);
        }
    };
    function deleteProduct() {
        if (confirm('[RESX:Confirm:Delete]')) {
            var tmp = {};
            tmp.action = 16;
            tmp.ProductId = '<%=sProductId %>';
            dnn_comm.admin.ShowMsg('[RESX:PleaseWait]', 'loading');
            var result = ap_callback_synch(JSON.stringify(tmp));
            dnn_comm.admin.HideMsg(function () {
                LoadView('admin_products_list');    
            });
            
            
            
            
        };
  
    };
    function ap_fieldaccess(obj) {
        var prefix = obj.id.substring(0, obj.id.indexOf('_'));
        var val = { 'required': false };

        if (typeof (formdefs[prefix]) != 'undefined') {
            var k = obj.id.replace(prefix + '_', '');
            if (typeof (formdefs[prefix][k]) != 'undefined') {
                val = formdefs[prefix][k];
            };
        };

        //if (val.required == true) {
        obj.setAttribute('isdirty', true);
        $(obj).parent().removeClass('form-valid');
        //};

    };
    function ap_Validate(obj, def, onlyDirty) {
        if (typeof (obj) == 'string') {
            obj = document.getElementById(obj);
        }
        var val = { 'required': false };
        var isdirty = false;
        var prefix = obj.id.substring(0, obj.id.indexOf('_'));
        if (typeof (obj.getAttribute('isdirty')) != 'undefined') {
            isdirty = obj.getAttribute('isdirty');
        };
        if (typeof (onlyDirty) == 'undefined') {
            onlyDirty = true;
        };
        if ((isdirty && onlyDirty) || !onlyDirty) {
            if (typeof (def) == 'undefined') {
                if (typeof (formdefs[prefix]) != 'undefined') {
                    var k = obj.id.replace(prefix + '_', '');
                    val = formdefs[prefix][k]
                };
            } else {
                val = def;
            };
            $(obj).parent().removeClass('form-valid');
            if (dnn_comm.form.Validate(obj.id, val)) {
                $(obj).parent().addClass('form-valid').removeClass('form-required');
                obj.setAttribute('isdirty', 'false');
                return true;
            } else {
            
                $(obj).parent().addClass('form-required').removeClass('form-valid');
                $('#' + obj.id + '_error').text(val.msg1);
                return false;
            };
        };
    };
    function apadmin_propDataTypeChange(lname) {
        var dtype = document.getElementById('DataType');
        dtype = dtype.options[dtype.selectedIndex];
        var li = dnn_comm.utils.GetParentByTagName(document.getElementById('DataType'), 'DIV');
        var tr = li.nextSibling; 
        if (typeof (tr.tagName) == 'undefined') {
            tr = li.nextSibling.nextSibling;
        };
        if (dtype.value.indexOf('list') >= 0) {
            tr.style.display = '';
            var tmp = {};
            tmp.action =11;
            ap_callback(JSON.stringify(tmp), apadmin_loadLists);
        } else {
            tr.style.display = 'none';
        };
    };
    function apadmin_loadLists(result) {
        if (result.length > 0) {
            var drp = document.getElementById('drpLists');
            if (drp.options.length > 0) {

                if (drp.hasChildNodes()) {
                    while (drp.childNodes.length >= 1) {
                        drp.removeChild(drp.firstChild);
                    };
                };

            };

            for (var i = 0; i < result.length; i++) {
                p = result[i];

                dnn_comm.utils.addOption('', p.itemId, p.itemName, drp);
            };
            if (ap_prop_temp != null) {
                if (typeof (ap_prop_temp.DataType) != 'undefined') {
                    if (ap_prop_temp.DataType.indexOf('|') > 0) {
                        var list = ap_prop_temp.DataType.split('|')[1];
                        dnn_comm.utils.SetSelected('drpLists', list);
                    };
                };

            };
        } else {
            document.getElementById('drpLists').style.display = 'none';
            document.getElementById('drpLists-none').style.display = 'block';
        };
    };

    function group_Save() {
        var d = {};
        d.action = 71;
        d.GroupName = document.getElementById('ProductGroupName').value;
        if (d.GroupName != '') {
            ap_callback(JSON.stringify(d), group_List);  
        }
    }
    function group_List() {
        dnn_comm.admin.DialogClose('groupedit');
        var d = {};
        d.action = 70;
        ap_callback(JSON.stringify(d), group_List_Complete);  
    }
    function group_List_Complete(result) {
        var groupSelect = document.getElementById('prod_ProductGroupId');
        dnn_comm.utils.RemoveChildNodes('prod_ProductGroupId');
        dnn_comm.utils.addOption('','[RESX:SelectProductGroup]','-1',groupSelect);
        var len = result.length;
        for (var i = 0; i < len; i++) {
            var obj = result[i];
            dnn_comm.utils.addOption('',obj.GroupName,obj.ProductGroupId,groupSelect);
        };
    }
    function billingTypeChange() {
        var opt = document.getElementById('prod_ProductType');
        if (opt.selectedIndex > 0) {
            document.getElementById('recPaymentOptions').style.display = 'block';
        } else {
            document.getElementById('recPaymentOptions').style.display = 'none';
        }
    }
    function openFileUp() {
        document.getElementById('title').value = '';
        document.getElementById('purchasedate').value = '';
        document.getElementById('tmpUpload').value = '';
        dnn_comm.admin.DialogOpen('uploadFile',fileModalOptions);return false;
    }
    function openGroup() {
        document.getElementById('ProductGroupName').value = '';
        dnn_comm.admin.DialogOpen('groupedit', groupEditModalOptions);
    }
</script>
<div>
    <a href="#" onclick="LoadView('admin_products_list'); return false;">[RESX:Products]</a>
    > [RESX:Details]
</div>
<div class="dnn-modcp-contentInner">
<div id="prodTabs" class="dnnForm dnnTabs">
    <ul class="dnnAdminTabNav dnnClear">
        <li><a href="#ProdTab1"><span>[RESX:Details]</span></a></li>
        <li><a href="#ProdTab2"><span>[RESX:Options]</span></a></li>
        <li><a href="#ProdTab3"><span>[RESX:Properties]</span></a></li>
        <li><a href="#ProdTab4"><span>[RESX:PostOrderInstructions]</span></a></li>
        <li><a href="#ProdTab5"><span>[RESX:Downloads]</span></a></li>
    </ul>
    <div class="dnn-modcp-tab-content dnnForm" id="ProdTab1">
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_ProductGroupId" ResourceKey="[RESX:ProductGroup]"  runat="server" />
            <select id="prod_ProductGroupId">
                <%=ProductGroups %>
            </select>
            <img src="<%=AddIcon %>" onclick="openGroup();" style="cursor:pointer;margin-top:4px;" />
        </div>
        <div class="dnnFormItem">
         <dnn:Label ControlName="prod_ProductName" ResourceKey="[RESX:ProductName]"  runat="server" />
           
            <input type="text" id="prod_ProductName" value="" class="dnnFormRequired" onkeypress="ap_fieldaccess(this);"
                onblur="ap_Validate(this);" />
                 <span id="prod_ProductName_error" class="dnnFormMessage dnnFormError"></span>
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_ProductSKU" ResourceKey="[RESX:ProductSKU]"  runat="server" />
            <input type="text" id="prod_ProductSKU" value="" class="dnnFormRequired" onkeypress="ap_fieldaccess(this);"
                onblur="ap_Validate(this);" />
             <span id="prod_ProductSKU_error" class="dnnFormMessage dnnFormError"></span>
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_ProductDetailPage" ResourceKey="[RESX:ProductPage]"  runat="server" />
            <input type="text" id="prod_ProductDetailPage" value="" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_Price" ResourceKey="[RESX:Price]"  runat="server" />
            <input type="text" id="prod_Price" value="" class="dnn-modcp-money dnnFormRequired"
                onkeypress="return dnn_comm.utils.OnlyNumbers(event)" onblur="dnn_comm.admin.CheckCurrency(this, currSamp);" /><span class="inputSample">e.g. <%=formatSample %></span>
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_Cost" ResourceKey="[RESX:Cost]"  runat="server" />
            <input type="text" id="prod_Cost" value="" class="dnn-modcp-money" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" onblur="dnn_comm.admin.CheckCurrency(this, currSamp);" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_ShipFee" ResourceKey="[RESX:ShipFee]"  runat="server" />
            <input type="text" id="prod_ShipFee" value="" class="dnn-modcp-money"
                onkeypress="return dnn_comm.utils.OnlyNumbers(event)" onblur="dnn_comm.admin.CheckCurrency(this, currSamp);" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_Active" ResourceKey="[RESX:Active]"  runat="server" />
            
            <input type="checkbox" id="prod_Active" value="1" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_Visible" ResourceKey="[RESX:Visible]"  runat="server" />
            <input type="checkbox" id="prod_Visible" value="1" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_Taxable" ResourceKey="[RESX:Taxable]"  runat="server" />
            <input type="checkbox" id="prod_Taxable" value="1" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_RequireShipAddress" ResourceKey="[RESX:RequireShipAddress]"  runat="server" />
            <input type="checkbox" id="prod_RequireShipAddress" value="" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_ProductDescription" ResourceKey="[RESX:ShortDescription]"  runat="server" />
            <textarea id="prod_ProductDescription" rows="6" style="height: 150px;"></textarea>
        </div>
    </div>
    <div id="ProdTab2" class="dnn-modcp-tab-content dnnForm">
        <div class="dnnFormItem">
            <dnn:Label ControlName="drpprod_AllowedRolesPicker" ResourceKey="[RESX:AllowedRoles]"  runat="server" />
            <select id="drpprod_AllowedRolesPicker">
            </select>
            <a href="javascript:void(0);" onclick="prod_AllowedRolesPicker.Add();" class="dnnPrimaryAction">[RESX:AddRole]</a>
            <div class="dnn-modcp-tokens">
                <ul id="prod_AllowedRolesPicker">
                </ul>
                <input type="hidden" id="prod_AllowedRoles" value="" />
            </div>
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="drpprod_AddToRolesPicker" ResourceKey="[RESX:AddToRoles]"  runat="server" />
            <select id="drpprod_AddToRolesPicker">
            </select>
        </div>
        <div class="dnnFormItem">
         
                <dnn:Label ControlName="drpprod_AddToRolesPicker" ResourceKey="[RESX:ExpiresIn]"  runat="server" />
                <input type="text" id="prod_AddToRoles-units" value="" width="3" style="width:25px;min-width:25px;" />
                <label style="width:30px">[RESX:Units]</label>
                <select id="prod_AddToRoles-interval" style="width:85px;min-width:85px;">
                    <option></option>
                    <option value="D">[RESX:Days]</option>
                    <option value="M">[RESX:Months]</option>
                </select>

            <a href="javascript:void(0);" onclick="prod_AddToRolesPicker.Add();" class="dnnPrimaryAction">[RESX:AddRole]</a>
            
            <div class="dnn-modcp-tokens">
                <ul id="prod_AddToRolesPicker">
                </ul>
                <input type="hidden" id="prod_AddToRoles" value="" />
            </div>
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_CustomAction" ResourceKey="[RESX:CustomAction]"  runat="server" />
            <input type="text" id="prod_CustomAction" value="" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_SendEmailTemplate" ResourceKey="[RESX:SendEmail]"  runat="server" />
            <select id="prod_SendEmailTemplate">
                <%=EmailTemplates %>
            </select>
        </div>
        <%if (SupportsARB) {%>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_ProductType" ResourceKey="[RESX:ProductType]"  runat="server" />
            <select id="prod_ProductType" onchange="billingTypeChange();">
                <option value="0">[RESX:OneTimePayment]</option>
                <option value="1">[RESX:RecurringPayment]</option>
            </select>
        </div>
        <div id="recPaymentOptions" style="display:none;">
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_RecInterval" ResourceKey="[RESX:RecInterval]"  runat="server" />
            <select id="prod_RecInterval">
                <option></option>
                <option value="D">[RESX:Days]</option>
                <option value="M">[RESX:Months]</option>
            </select>
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_RecLength" ResourceKey="[RESX:RecLength]"  runat="server" />
            <input type="text" id="prod_RecLength" value="" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ControlName="prod_RecOccurances" ResourceKey="[RESX:RecOccurances]"  runat="server" />
            <input type="text" id="prod_RecOccurances" value="" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" />
        </div>
        </div>
        <%} %>
         <div class="dnnFormItem"></div>
         <div class="dnnFormItem"></div>
         <div class="dnnFormItem"></div>
    </div>
    <div id="ProdTab3" class="dnn-modcp-tab-content">
        <div class="floatRight buttonArea">
            <a href="#" onclick="apadmin_LoadPropForm();return false;" class="btnadd roundall"
                style="margin-top: 10px; margin-bottom: 10px;">[RESX:AddProperty]</a>
        </div>
        <div style="margin-top: 32px;height:450px;">
            <ul id="proplist" class="dnn-modcp-datalist">
            </ul>
        </div>
    </div>
    <div class="dnn-modcp-tab-content" id="ProdTab4">
            <div class="dnnFormMessage dnnFormInfo">
				<span>[RESX:PostOrderInstructions:Hint]</span>
			</div>

        <div>
            [RESX:DisplayInstructions]:<input type="checkbox" id="prod_InstructionsEnabled" value="1" /></div>
        <div>
            <textarea id="prod_PostOrderInstructions" style="width: 99%" rows="20"></textarea></div>
    </div>
    <div class="dnn-modcp-tab-content" id="ProdTab5">
        <div class="floatRight buttonArea">
            <a href="#" onclick="openFileUp();" class="btnadd roundall"
                style="margin-top: 10px; margin-bottom: 10px;">[RESX:AddFile]</a>
        </div>
        <div style="margin-top: 32px;">
            <ul class="dnn-modcp-datalist dnnClear" id="ul-filelist">
            </ul>
        </div>
    </div>
  
</div>
</div>
<div id="controlActions" style="display: none;">
    <ul class="dnnActions dnnClear">
        <li><a href="#" onclick="saveProduct(); return false;" class="dnnPrimaryAction">[RESX:Button:Save]</a></li>
        <li><a href="javascript:deleteProduct();" class="dnnSecondaryAction">
            [RESX:Button:Delete]</a></li>
        <li><a href="#" onclick="LoadView('admin_products_list'); return false;" class="dnnSecondaryAction">
            [RESX:Button:Cancel]</a></li>
    </ul>
</div>
<div id="uploadFile" style="display:none;">
    <div id="uploader">
            <div id="uploaderForm" class="dnnForm">
                <div class="dnnFormItem">
                <dnn:Label ControlName="title" ResourceKey="[RESX:Title]"  runat="server" />
                 
                    <input type="text" id="title" name="title" value="" class="dnnFormRequired" />
                </div>
                <div class="dnnFormItem">
                <dnn:Label ControlName="purchasedate" ResourceKey="[RESX:PurchaseDate]"  runat="server" />
                    
                    <input type="text" id="purchasedate" name="purchasedate" class="dnnFormRequired dnnFormDatePicker" readonly="readonly" value="" />
                </div> 
                <div class="dnnFormItem">
                <dnn:Label ControlName="tmpUpload" ResourceKey="[RESX:File]"  runat="server" />
              
                    <input type="file" id="tmpUpload" name="tmpUpload" />
                </div>
                <ul class="dnnActions dnnClear">
                    <li><a href="#" onclick="ap_upload(); return false;" class="dnnPrimaryAction">[RESX:UploadFile]</a></li>
                </ul>
             </div>
        </div>
</div>
<div id="groupedit" style="display:none;">
    <div class="dnnForm" style="width:400px;min-width:400px;margin-left:auto;margin-right:auto;margin-top:10px;">
        <div class="dnnFormItem">
        <dnn:Label ControlName="ProductGroupName" ResourceKey="[RESX:ProductGroupName]"  runat="server" />
            
            <input type="text" id="ProductGroupName" value="" style="width:225px;" size="200" class="dnnFormRequired" />
        </div>
        <ul class="dnnActions dnnClear" style="width:400px;">
            <li><a href="#" onclick="group_Save(); return false;" class="dnnPrimaryAction">[RESX:Button:Save]</a></li>
            <li><a href="#" onclick="dnn_comm.admin.DialogClose('groupedit'); return false;" class="dnnSecondaryAction">
            [RESX:Button:Cancel]</a></li>
        </ul>
    </div>
</div>
<div id="propview" style="display:none;">
    <div class="dnnForm">
    <div class="dnnFormItem">
    <dnn:Label ControlName="PropertyName" ResourceKey="[RESX:PropertyName]"  runat="server" />
          
                <input type="text" id="PropertyName" title="[RESX:PropertyName]" class="dnnFormRequired"
                        value="" onkeyup="dnn_comm.utils.updateShadow(this,event,'Label');" onkeypress="return dnn_comm.utils.filterInput(this,event,'Label');" /></li>
            </div>
            <div class="dnnFormItem">
            <dnn:Label ControlName="Label" ResourceKey="[RESX:PropertyLabel]"  runat="server" />
              
                <input type="text" id="Label" title="[RESX:PropertyLabel]" class="dnnFormRequired"
                            value="" />
            </div>
            <div class="dnnFormItem">
             <dnn:Label ControlName="DataType" ResourceKey="[RESX:DataType]"  runat="server" />
             
                <select id="DataType" onchange="apadmin_propDataTypeChange();"><option
                            value="text">[RESX:Text]</option>
                            <option value="list">[RESX:ListDropDown]</option>
                            <!--<option value="list-multi">[RESX:ListCheckBoxes]</option>-->
                        </select>
            </div>
            <div class="dnnFormItem" style="display:none;">
             <dnn:Label ControlName="drpLists" ResourceKey="[RESX:ListName]"  runat="server" />
             
                <select id="drpLists"></select>
                <span id="drpLists-none" style="display:none;"><b>[RESX:NoLists]</b></span>
            </div>
            <div class="dnnFormItem">
            <dnn:Label ControlName="propreq" ResourceKey="[RESX:IsRequired]"  runat="server" />
               
                <span class="dnn-modcp-radiobuttons">
                    <input type="radio" name="propreq" value="false"
                                    id="IsRequiredNo" />
                    <label for="IsRequiredNo">[RESX:No]</label>
                    <input type="radio" name="propreq"
                                    value="true" id="IsRequired" isdefault="true" checked="checked" />
                    <label for="IsRequired">[RESX:Yes]</label>
                </span>
            </div>
            <div class="dnnFormItem">
            <dnn:Label ControlName="ValidationExpression" ResourceKey="[RESX:ValidationExpression]"  runat="server" />
                <input type="text" id="ValidationExpression" value="" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ControlName="DefaultValue" ResourceKey="[RESX:DefaultValue]"  runat="server" />
                <input type="text" id="DefaultValue" value="" />
            </div>
             <div class="dnnFormItem">
            <dnn:Label ControlName="propreq" ResourceKey="[RESX:IsEnabled]"  runat="server" />
               
                <span class="dnn-modcp-radiobuttons">
                    <input type="radio" name="propenabled" value="false"
                                    id="IsEnabledNo" />
                    <label for="IsEnabledNo">[RESX:No]</label>
                    <input type="radio" name="propenabled" isdefault="true"
                                    value="true" id="IsEnabled" checked="checked" />
                    <label for="IsEnabled">[RESX:Yes]</label>
                </span>
            </div>
            <ul class="dnnActions">
                <li><a href="#" onclick="apadmin_saveProperty(); return false;" class="dnnPrimaryAction">[RESX:Save]</a></li>
                <li><a href="#" onclick="dnn_comm.admin.DialogClose('propview'); return false;"
                class="dnnSecondaryAction">[RESX:Cancel]</a>
                </li>
                
            </ul>
            <input type="hidden" id="PropertyDefId" value="-1" />
            <input type="hidden" id="ObjectType" value="0" />
            <input type="hidden" id="ObjectOwnerKey" value="" />
    </div>
</div>


<input type="hidden" value="" id="prod_ProductId" />
<asp:Literal ID="litScripts" runat="server" />
<script type="text/javascript">
    var currAddToRoles = '';
    var currAllowedRoles = '';
    var currAgreements = '';
    loadProduct();
    var prod_AllowedRolesPicker = dnn_comm.utils.CreateObject(dnn_comm.RolePicker);
    prod_AllowedRolesPicker.Init('prod_AllowedRoles', allroles);
    var prod_AddToRolesPicker = dnn_comm.utils.CreateObject(dnn_comm.RolePicker);
    prod_AddToRolesPicker.Init('prod_AddToRoles', saferoles);

    apadmin_getProperties(0, document.getElementById('prod_ProductId').value);
    createUpload();
    ap_getFiles(document.getElementById('prod_ProductId').value);
    var dtformat = dateFormat;
    dtformat = dtformat.replace('yyyy', 'yy').toLowerCase();
    var dateOptions = {
        showOn: 'button',
        buttonImage: '<%=Page.ResolveUrl(modulePath + "images/calendar.png")%>',
        buttonImageOnly: true,
        dateFormat: dtformat
    };
    $('#purchasedate').datepicker(dateOptions);
    $('#ui-datepicker-div').wrap('<div class="dnnForm" />');

    $(document).ready(function () {
        var options = { disabled: [] };
        var prodId = document.getElementById('prod_ProductId').value;
        if (prodId.substring(0, 4) == '0000') {
            options = { disabled: [2, 4], selected:0 };
        }
        $('#prodTabs').dnnTabs(options);
        $('.dnnTooltip').dnnTooltip();
    });
</script>
