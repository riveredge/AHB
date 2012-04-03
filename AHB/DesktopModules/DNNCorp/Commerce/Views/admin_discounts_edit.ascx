<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_discounts_edit.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.admin_discounts_edit" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<script type="text/javascript">
    var currSamp = '<%=formatSample %>';
    function saveDiscount() {
        var isValid = true;

        var discAmount = document.getElementById('disc_DiscountAmount');
        if (dnn_comm.utils.Trim(discAmount.value) == '') {
            discAmount.value = 0;
        };
        if (checkNumber(discAmount.value, currSamp) == false) {
            isValid = false;
            discAmount.style.backgroundColor = '#fbc2c4';
            alert('[RESX:Error:InvalidCurrency]');
        } else {
            discAmount.style.backgroundColor = '';
        };
        var discUserUse = document.getElementById('disc_UserMaxUsage');
        var discMaxUse = document.getElementById('disc_TotalMaxUsage');
        if (discUserUse.value > discMaxUse.value) {
            isValid = false;
            $(discUserUse).parent().addClass('form-required').removeClass('form-valid');
            $('#' + discUserUse.id + '_error').text('[RESX:Error:UserUsageTooLarge]');
        }
        if (isValid) {
            discount = dnn_comm.form.PackageForm(discount, 'disc_');
            var params = dnn_comm.utils.ObjectToParams(discount);
            params = 'cpview=admin_discounts_edit&action=save&' + params;
            dnn_comm.admin.ShowMsg('[RESX:PleaseWait]', 'loading');
            dnn_comm.utils.Callback(params, '', saveDiscountComplete);
        };
    };
    function saveDiscountComplete(result) {
        
        $(".dnnFormError").css('display', 'none');
        if (typeof (result.DiscountId) == 'undefined') {
            dnn_comm.admin.HideMsg();
            var len = result.length;
            for (var i = 0; i < len; i++) {
                var obj = result[i];
                var field = '';
                var msg = '';
                for (var p in obj) {
                    field = p;
                    msg = obj[p];
                }
                var elem = document.getElementById('disc_' + field + '_error');
                if (elem !== null) {
                    elem.innerHTML = msg;
                    elem.style.display = 'inline';
                }
            }
        } else {
            dnn_comm.admin.HideMsg(function () {
                dnn_comm.admin.ShowMsg('[RESX:SaveComplete]', 'positive');
                setTimeout(function () {
                    dnn_comm.admin.HideMsg();
                }, 1600);
            });
            
            discount = result;
            loadDiscount();
        }
    };
    function deleteDiscount() {
    };
    function deleteDiscountComplete(result) {
    };
    function loadDiscount() {
        if (typeof (discount) != 'undefined') {
            discount.DiscountCode = unescape(discount.DiscountCode);
            discount.Description = unescape(discount.Description);
            if (discount.StartDate.indexOf('1900') > -1) {
                discount.StartDate = '';
            }
            if (discount.EndDate.indexOf('9999') > -1) {
                discount.EndDate = '';
            }
            dnn_comm.form.BindForm(discount, 'disc_');
            if (discount.DiscountCodeRequired) {
                document.getElementById('disc_DiscountCodeRequired').checked = true;
                document.getElementById('disc_DiscountCodeRequired').setAttribute('checked', 'checked');
                document.getElementById('disc_DiscountCodeRequiredNo').checked = false;
                document.getElementById('disc_DiscountCodeRequiredNo').removeAttribute('checked');
            } else {
                document.getElementById('disc_DiscountCodeRequiredNo').checked = true;
                document.getElementById('disc_DiscountCodeRequiredNo').setAttribute('checked', 'checked');
                document.getElementById('disc_DiscountCodeRequired').checked = false;
                document.getElementById('disc_DiscountCodeRequired').removeAttribute('checked');
            };
            $('#discountEditor').dnnTabs({ disabled: [] });
            if (typeof (restricts) != 'undefined') {
                if (restricts.length > 0) {
                    var rtypes = ['', '[RESX:ProductSpecific]', '[RESX:ProductPurchased]', '[RESX:SpecificRole]'];
                    var ul = document.getElementById('restrlist');
                    dnn_comm.utils.RemoveChildNodes('restrlist');
                    for (var i = 0; i < restricts.length; i++) {
                        var r = restricts[i];
                        var li = document.createElement('li');
                        var b = document.createElement('b');
                        b.appendChild(document.createTextNode(rtypes[r.rtype]));
                        li.appendChild(b);
                        var span = document.createElement('span');
                        span.appendChild(document.createTextNode(decodeURIComponent(r.objectname)));
                        li.appendChild(span);
                        var delIcon = document.createElement('img');
                        delIcon.src = deleteIcon;
                        var atag = document.createElement('a');
                        atag.setAttribute('id', r.rtype + '|' + r.objectid);
                        atag.setAttribute('href', '#');
                        atag.onclick = function () {
                            if (confirm('[RESX:Confirm:Delete]')) {
                                var restrict = {};
                                restrict.restrictid = this.id;
                                restrict.DiscountId = discount.DiscountId;
                                var params = dnn_comm.utils.ObjectToParams(restrict);
                                params = 'cpview=admin_discounts_edit&action=restrictdelete&' + params;
                                dnn_comm.utils.Callback(params, '', restrictDeleteComplete);
                            };
                            return false;
                        }
                        atag.appendChild(delIcon);
                        li.appendChild(atag);
                        ul.appendChild(li);
                    };
                };
            };
            
        };
    };
    function restrictDeleteComplete() {
        LoadView("admin_discounts_edit", discount.DiscountId);
    };
    function loadRestrict() {
        var options = {};
        options.height = 375;
        options.width = 500;
        options.title = '[RESX:RestrictionEditor]';
        dnn_comm.admin.DialogOpen('restEditor',options);
    };
    function toggleRestrict(obj) {
        document.getElementById('restType1').style.display = 'none';
        document.getElementById('restType2').style.display = 'none';
        document.getElementById('restType3').style.display = 'none';
        var sel = obj.options[obj.selectedIndex].value;
        if (sel != '') {
            document.getElementById('restType' + sel).style.display = 'block';
        }
    };
    function restrict_Save() {
        var rtype = document.getElementById('restrictType');
        rtype = rtype.options[rtype.selectedIndex].value;

        if (rtype == '') {
            $.dnnAlert({ text: '[RESX:Error:RestrictTypeRequired]' });
            return;
        };
        var restrict = {};
        restrict.restricttype = rtype;
        restrict.DiscountId = discount.DiscountId;
        var isvalid = true;
        switch (rtype) {
            case '1':
                var prod = document.getElementById('discProducts');
                restrict.productid = prod.options[prod.selectedIndex].value;
                if (restrict.productid == '') {
                    alert('[RESX:Error:ProductRequired]');
                    return;
                };
                break;
            case '2':
                var prodpur = document.getElementById('discProductPurchased');
                restrict.productid = prodpur.options[prodpur.selectedIndex].value;
                if (restrict.productid == '') {
                    alert('[RESX:Error:ProductRequired]');
                    return;
                };
                restrict.qualstart = document.getElementById('restrQualStart').value;
                restrict.qualend = document.getElementById('restrQualEnd').value;
                break;
            case '3':
                var role = document.getElementById('discRoles');
                restrict.roleid = role.options[role.selectedIndex].value;
                if (restrict.roleid == '') {
                    alert('[RESX:Error:RoleReq]');
                    return;
                };
                break;
        }
        var params = dnn_comm.utils.ObjectToParams(restrict);
        params = 'cpview=admin_discounts_edit&action=restrictsave&' + params;
        dnn_comm.utils.Callback(params, '', restrictSaveComplete);
    };
    function restrictSaveComplete() {
        dnn_comm.admin.DialogClose('restEditor');
        LoadView("admin_discounts_edit", discount.DiscountId);
    };
</script>
<div>
    <a href="#" onclick="LoadView('admin_discounts_list'); return false;">[RESX:Discounts]</a> > [RESX:Details]
</div>
<div class="dnn-modcp-contentInner">
<div id="discountEditor" class="dnnForm dnnTabs">
    <ul class="dnnAdminTabNav dnnClear">
        <li><a href="#discTab1"><span>[RESX:Details]</span></a></li>
        <li><a href="#discTab2"><span>[RESX:Restrictions]</span></a></li>
    </ul>
    <div class="dnn-modcp-tab-content dnnForm" id="discTab1">
    <div class="dnnFormItem">
        <dnn:Label ControlName="disc_Description" ResourceKey="[RESX:Description]"  runat="server" />
        <input type="text" id="disc_Description" value="" class="dnnFormRequired" />
        <span id="disc_Description_error" class="dnnFormMessage dnnFormError" style="display:none;"></span>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ControlName="disc_DiscountCode" ResourceKey="[RESX:DiscountCode]"  runat="server" />
        <input type="text" id="disc_DiscountCode" value="" class="dnnFormRequired" />
        <span id="disc_DiscountCode_error" class="dnnFormMessage dnnFormError" style="display:none;"></span>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ControlName="disc_DiscountCodeRequired" ResourceKey="[RESX:RequireDiscountCode]"  runat="server" />
        <span class="dnn-modcp-radiobuttons">
            <input type="radio" name="codereq" isdefault="true" value="true" id="disc_DiscountCodeRequired" checked="checked" /><label for="disc_DiscountCodeRequired">[RESX:Yes]</label><input type="radio" name="codereq" value="false" id="disc_DiscountCodeRequiredNo" /> <label for="disc_DiscountCodeRequiredNo">[RESX:No]</label>
        </span>
        
    </div>
    <div class="dnnFormItem">
        <dnn:Label ControlName="disc_DiscountAmount" ResourceKey="[RESX:Amount]"  runat="server" />
        <input type="text" id="disc_DiscountAmount" class="dnn-modcp-money" onkeypress="return dnn_comm.utils.OnlyNumbers(event);" onblur="dnn_comm.admin.CheckCurrency(this, currSamp);" value="" /><span class="inputSample">e.g. <%=formatSample %></span>

    </div>
    <div class="dnnFormItem">
        <dnn:Label ControlName="disc_DiscountPercent" ResourceKey="[RESX:Percent]"  runat="server" />
        <input type="text" id="disc_DiscountPercent" class="dnn-modcp-number" onkeypress="return dnn_comm.utils.OnlyNumbers(event);" value="" /> 
        <span id="disc_DiscountPercent_error" class="dnnFormMessage dnnFormError" style="display:none;"></span>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ControlName="disc_UserMaxUsage" ResourceKey="[RESX:MaxUsePerUser]"  runat="server" />
        <input type="text" id="disc_UserMaxUsage" class="dnn-modcp-number" onkeypress="return dnn_comm.utils.OnlyNumbers(event);" value="" />
         <span id="disc_UserMaxUsage_error" class="dnnFormMessage dnnFormError"></span>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ControlName="disc_TotalMaxUsage" ResourceKey="[RESX:MaxUseTotal]"  runat="server" />
        <input type="text" id="disc_TotalMaxUsage" class="dnn-modcp-number" onkeypress="return dnn_comm.utils.OnlyNumbers(event);" value="" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ControlName="disc_StartDate" ResourceKey="[RESX:StartDate]"  runat="server" />
        <input type="text" id="disc_StartDate" class="dnnFormDatePicker" readonly="readonly" value="" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ControlName="disc_EndDate" ResourceKey="[RESX:EndDate]"  runat="server" />
        <input type="text" id="disc_EndDate" class="dnnFormDatePicker" readonly="readonly"  value="" />
        
    </div>
    <div class="dnnFormItem">
        <dnn:Label ControlName="disc_Active" ResourceKey="[RESX:Enabled]"  runat="server" />
        <input type="checkbox" id="disc_Active" />
    </div>
    </div>
    <div class="dnn-modcp-tab-content dnnForm" id="discTab2">
        
         <div class="floatRight buttonArea">
            <a href="#" onclick="loadRestrict();return false;" class="btnadd roundall"
                style="margin-top: 10px; margin-bottom: 10px;">[RESX:AddRestriction]</a>
        </div>
        <div style="margin-top: 32px;">
            <ul id="restrlist" class="dnn-modcp-datalist">
                
            </ul>
        </div>
        
    </div>
</div>
</div>

<div id="controlActions" style="display:none;">
    <ul class="dnnActions dnnClear">
        <li><a href="#" onclick="saveDiscount(); return false;" class="dnnPrimaryAction">[RESX:Button:Save]</a></li>
        <%--<li><a href="#" onclick="deleteDiscount(); return false;" class="dnnSecondaryAction">[RESX:Button:Delete]</a></li>--%>
        <li><a href="#" onclick="LoadView('admin_discounts_list'); return false;" class="dnnSecondaryAction">[RESX:Button:Cancel]</a></li>
    </ul>   
</div>
<div id="restEditor" style="display:none;width:450px;height:375px;" title="[RESX:RestrictionEditor]">
   <div class="dnnForm" style="width:400px;min-width:400px;margin-left:auto;margin-right:auto;margin-top:10px;">
        <div class="dnnFormItem">
            <dnn:label ControlName="restrictType" ResourceKey="[RESX:RestrictionType]" runat="server" />
            <select id="restrictType" onchange="toggleRestrict(this);">
                <option value="">[RESX:SelectRestrictionType]</option>
                <option value="1">[RESX:ProductRestriction]</option>
                <option value="2">[RESX:ProductPurchasedRestriction]</option>
                <option value="3">[RESX:RoleRestriction]</option>
            </select>
        </div>
        <div class="dnnFormItem" id="restType1" style="display:none;">
            <dnn:label ResourceKey="[RESX:DiscountForProduct]" runat="server" />
            <select id="discProducts">
                <option value=""></option>
                <%=products %>
            </select>
        </div>
        <div id="restType2" style="display:none;">
            <div class="dnnFormItem">
                <dnn:label ResourceKey="[RESX:DiscountForProductPurchased]" runat="server" />
                <select id="discProductPurchased">
                    <option value=""></option>
                    <%=products %>
                </select>
            </div>
            <div class="dnnFormItem">
                <dnn:label ResourceKey="[RESX:QualifyStartDate]" runat="server" />
                <input type="text" id="restrQualStart" class="dnnFormDatePicker" readonly="readonly" value="" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ResourceKey="[RESX:QualifyEndDate]" runat="server" />
                <input type="text" id="restrQualEnd" class="dnnFormDatePicker" readonly="readonly" value="" />
            </div>
        </div>
        <div class="dnnFormItem" id="restType3" style="display:none;">
            <dnn:label ResourceKey="[RESX:DiscountForSpecificRole]" runat="server" />
            <select id="discRoles">
             <option value=""></option>
             <%=roles %>
            </select>
        </div>
        <ul class="dnnActions dnnClear" style="width:400px;">
            <li><a href="#" onclick="restrict_Save(); return false;" class="dnnPrimaryAction">[RESX:Button:Save]</a></li>
            <li><a href="#" onclick="dnn_comm.admin.DialogClose('restEditor'); return false;" class="dnnSecondaryAction">
            [RESX:Button:Cancel]</a></li>
        </ul>
    </div>
</div>
<asp:Literal ID="litScripts" runat="server" />
<script type="text/javascript">



    loadDiscount();
    var dtformat = dateFormat;
    dtformat = dtformat.replace('yyyy', 'yy').toLowerCase();
    var dateOptions = {
        showOn: 'button',
        buttonImage: '<%=Page.ResolveUrl(modulePath + "images/calendar.png")%>',
        buttonImageOnly: true,
        dateFormat: dtformat
    };
    var endDate = document.getElementById('disc_EndDate');
    var startDate = document.getElementById('disc_StartDate');
    
    if (endDate.value.indexOf('9999') > -1) {
        endDate.value = '';
    }
    if (startDate.value.indexOf('1900') > -1) {
        startDate.value = '';
    }
   
    $('#disc_EndDate').datepicker(dateOptions);
    $('#disc_StartDate').datepicker(dateOptions);
    $('#restrQualStart').datepicker(dateOptions);
    $('#restrQualEnd').datepicker(dateOptions);
    $('#ui-datepicker-div').wrap('<div class="dnnForm" />');
    $(document).ready(function () {
        var options = { disabled: [] };
        if (discount.DiscountId < 1) {
            options = { disabled: [1] };
        }
        $('#discountEditor').dnnTabs(options);
        $('.dnnTooltip').dnnTooltip();

    });
    function showPicker() {
    };
</script>