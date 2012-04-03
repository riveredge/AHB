<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_settings.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.admin_settings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<script type="text/javascript">
	function loadSettings() {
		if (typeof (settings) != 'undefined') {
		    dnn_comm.form.BindForm(settings, 'opt_');
		    var collectTaxYes = document.getElementById('opt_CollectTax_Yes');
		    var collectTaxNo = document.getElementById('opt_CollectTax_No');
		    if (settings.CollectTax) {
		        collectTaxYes.checked = true;
		        collectTaxYes.setAttribute('checked', 'checked');
		        collectTaxNo.checked = false;
		        collectTaxNo.removeAttribute('checked');
		    } else {
		        collectTaxYes.checked = false;
		        collectTaxYes.removeAttribute('checked');
		        collectTaxNo.checked = true;
		        collectTaxNo.setAttribute('checked', 'checked');
		    }
		    var collectShipYes = document.getElementById('opt_CollectShippingYes');
		    var collectShipNo = document.getElementById('opt_CollectShipping_No');
		    if (settings.CollectShipping) {
		        collectShipYes.checked = true;
		        collectShipYes.setAttribute('checked', 'checked');
		        collectShipNo.checked = false;
		        collectShipNo.removeAttribute('checked');
		    } else {
		        collectShipYes.checked = false;
		        collectShipYes.removeAttribute('checked');
		        collectShipNo.checked = true;
		        collectShipNo.setAttribute('checked', 'checked');
		    }
		};
	};
	function saveSettings() {
		dnn_comm.admin.ShowMsg('[RESX:PleaseWait]', 'loading');
		var newsettings = dnn_comm.form.PackageForm(settings, 'opt_');
		newsettings.action = 51;
		var d = JSON.stringify(newsettings);
		ap_callback(d, saveComplete);
	};
	function saveComplete(result) {
	    if (result.result == 'failed') {
	        dnn_comm.admin.ShowMsg(result.message, 'negative');
	    } else {
	        var curr = document.getElementById('opt_Currency');
	        curr = curr.options[curr.selectedIndex].value;
	    am.currency = curr.toLowerCase();
	        dnn_comm.admin.HideMsg(function () {
	            dnn_comm.admin.ShowMsg('[RESX:SaveComplete]', 'positive');
	            setTimeout(function () {
	                dnn_comm.admin.HideMsg();
	            }, 1600);
	        });
	    }
	};
	function hasCC(payOpt) {
		if (payOpt.indexOf('VISA') >= 0 || payOpt.indexOf('MASTER') >= 0 || payOpt.indexOf('AMER') >= 0 || payOpt.indexOf('DISC') >= 0) {
			return true;
		} else {
			return false;
		}
	}
	function hasPayPal(payOpt) {
		if (payOpt.indexOf('PAYPAL') >= 0) {
			return true;
		} else {
			return false;
		}
	}

	function paySelect(obj) {
		var hidOpt = document.getElementById('opt_PaymentOptions');
		var sOpts = hidOpt.value;
		if (obj.checked == true) {
			if ((sOpts.indexOf(obj.value) == -1)) {
				hidOpt.value += obj.value + ";";
			}
		} else {
			if ((sOpts.indexOf(obj.value) != -1)) {
				hidOpt.value = sOpts.replace(obj.value + ";", "");
			};
		};
};
function status_Edit(obj) {
	var p = dnn_comm.utils.GetParentByTagName(obj, 'TR');
	var id = p.id;
	id = id.substring(id.indexOf('-')+1);
	var d = {};
	d.action=29;
	d.OrderStatusId = id;
	var obj = ap_callback_synch(JSON.stringify(d));
	document.getElementById('txtOrderStatus').value = obj.DisplayText;
	document.getElementById('txtOrderStatusId').value = obj.OrderStatusId;

};
function status_Delete(obj) {
	var p = dnn_comm.utils.GetParentByTagName(obj, 'TR');
	var id = p.id;
	id = id.substring(id.indexOf('-') + 1);
	if (confirm('[RESX:Confirm:Delete]')) {
		var d = {};
		d.action = 32;
		d.OrderStatusId = id;
		ap_callback(JSON.stringify(d), status_ListGet);
	}
	
}
function status_Save() {
	var d = {};
	d.action = 31;
	d.DisplayText = document.getElementById('txtOrderStatus').value;
	d.OrderStatusId = document.getElementById('txtOrderStatusId').value;
	ap_callback(JSON.stringify(d), status_ListGet);
};
	function status_ListGet() {
		var r = {};
		r.action = 30;
		var d = JSON.stringify(r);
		ap_callback(d, status_ListGet_Complete);
	};
	function status_ListGet_Complete(result) {
		var tbl = document.getElementById('orderStatusList');
		dnn_comm.utils.RemoveChildNodes('orderStatusList');
		var editBtn = document.createElement('a');
		editBtn.setAttribute('href', '#');
	  
		var editImage = new Image();
		editImage.src = editIcon;
		editBtn.appendChild(editImage);

		var deleteBtn = document.createElement('a');
		deleteBtn.setAttribute('href', '#');
		var deleteImage = new Image();
		deleteImage.src = deleteIcon;
		deleteBtn.appendChild(deleteImage);


		var len = result.length;
		for (var i = 0; i < len; i++) {
			var obj = result[i];
			var tr = document.createElement('tr');
			tr.setAttribute('id', 'osi-' + obj.OrderStatusId);
			var td = document.createElement('td');
			td.appendChild(document.createTextNode(obj.DisplayText));
			tr.appendChild(td);

			var edit = document.createElement('td');
			var tmp = editBtn.cloneNode(true);
			tmp.onclick = function () { status_Edit(this); return false; };
			edit.appendChild(tmp);
			tr.appendChild(edit);

			var del = document.createElement('td');
			var delTmp = deleteBtn.cloneNode(true);
			delTmp.onclick = function () { status_Delete(this); return false; };
			del.appendChild(delTmp);
		   
			tr.appendChild(del);

			tbl.appendChild(tr);

		};
		document.getElementById('txtOrderStatusId').value = -1;
		document.getElementById('txtOrderStatus').value = '';
};
function tax_save() {
	var d = {};
	d.action = 61;
	d.TaxItemId = -1;
	var ident = document.getElementById('drpTaxIdent');
	d.TaxIdentifier = ident.options[ident.selectedIndex].value;
	d.TaxQualifier = document.getElementById('txtTaxQualifier').value;
	d.TaxRate = document.getElementById('txtTaxRate').value;
	ap_callback(JSON.stringify(d), tax_list);
};
function tax_delete(obj) {
	var p = dnn_comm.utils.GetParentByTagName(obj, 'TR');
	var id = p.id;
	id = id.substring(id.indexOf('-') + 1);
	if (confirm('[RESX:Confirm:Delete]')) {
		var d = {};
		d.action = 62;
		d.TaxItemId = id;
		ap_callback(JSON.stringify(d), tax_list);
	}
};
function tax_list() {
	var r = {};
	r.action = 60;
	var d = JSON.stringify(r);
	ap_callback(d, tax_list_complete);
}

	function tax_list_complete(result) {
		var tbl = document.getElementById('taxRates');
		dnn_comm.utils.RemoveChildNodes('taxRates');
		var len = result.length;
		var deleteBtn = document.createElement('a');
		deleteBtn.setAttribute('href', '#');
		var deleteImage = new Image();
		deleteImage.src = deleteIcon;
		deleteBtn.appendChild(deleteImage);

		for (var i = 0; i < len; i++) {
			var obj = result[i];
			var tr = document.createElement('tr');
			tr.setAttribute('id', 'tax-' + obj.TaxItemId);
			var td = document.createElement('td');
			td.appendChild(document.createTextNode(obj.TaxIdentifier));
			tr.appendChild(td);
			td = document.createElement('td');
			td.appendChild(document.createTextNode(obj.TaxQualifier));
			tr.appendChild(td);
			td = document.createElement('td');
			td.appendChild(document.createTextNode(obj.TaxRate));
			tr.appendChild(td);
			td = document.createElement('td');
			var delTmp = deleteBtn.cloneNode(true);
			delTmp.onclick = function () { tax_delete(this); return false; };
			td.appendChild(delTmp);
			tr.appendChild(td);
			tbl.appendChild(tr);
		}

	}
  
</script>
<div class="dnn-modcp-contentInner">
	<div id="optTabs" class="dnnForm dnnTabs">
		<ul class="dnnAdminTabNav dnnClear">
		<li><a href="#optTab1"><span>[RESX:General]</span></a></li>
		<li><a href="#optTab2"><span>[RESX:PaymentOptions]</span></a></li>
		<li><a href="#optTab3"><span>[RESX:TaxRates]</span></a></li>
		<li><a href="#optTab4"><span>[RESX:OrderStatusOptions]</span></a></li>
	</ul>
 <div class="dnn-modcp-tab-content dnnForm" id="optTab1">
	<div class="dnnFormItem">
        <dnn:Label ID="plOrderNumber" ControlName="opt_OrderSeed" ResourceKey="[RESX:OrderNumber]" runat="server" />
		<input type="text" id="opt_OrderSeed" value="" class="dnnFormRequired" />
	</div>
	<div class="dnnFormItem">
        <dnn:Label ID="plFromEmail" ControlName="opt_FromEmail" ResourceKey="[RESX:FromEmail]" runat="server" />
		<input type="text" id="opt_FromEmail" value="" class="dnnFormRequired" />
	</div>
	<div class="dnnFormItem">
        <dnn:Label ID="plCollectTax" ControlName="opt_CollectTax" ResourceKey="[RESX:CollectTax]"  runat="server" />
		<span class="dnn-modcp-radiobuttons">
		<input id="opt_CollectTax_Yes" name="opt_CollectTax" value="true" type="radio" />
		<label for="opt_CollectTax_Yes">[RESX:Yes]</label>
		<input id="opt_CollectTax_No" name="opt_CollectTax" value="false" type="radio"  />
		<label for="opt_CollectTax_No">[RESX:No]</label>
		</span>
	</div>
	<div class="dnnFormItem">
        <dnn:Label ID="plCollectShip" ControlName="opt_CollectShipping" ResourceKey="[RESX:CollectShip]"  runat="server" />
		<span class="dnn-modcp-radiobuttons">
		<input id="opt_CollectShippingYes" name="opt_CollectShipping" value="true" type="radio" />
		<label for="opt_CollectShippingYes">[RESX:Yes]</label>
		<input id="opt_CollectShipping_No" name="opt_CollectShipping" value="false" type="radio" />
		<label for="opt_CollectShipping_No">[RESX:No]</label>
		</span>
	</div>
	<div class="dnnFormItem">
        <dnn:Label ControlName="opt_Theme" ResourceKey="[RESX:Theme]"  runat="server" />
		
		<select id="opt_Theme"><%= ThemeOptions%></select>
	</div>
	<div class="dnnFormItem">
        <dnn:Label ControlName="opt_Sources" ResourceKey="[RESX:OrderSources]"  runat="server" />
		<input type="text" id="opt_Sources" value="" />
	</div>
	<div class="dnnFormItem">
        <dnn:Label ControlName="opt_SalesReps" ResourceKey="[RESX:SalesReps]"  runat="server" />
		
		<select id="opt_SalesReps"><%=SalesReps %></select>
	</div>
	<div class="dnnFormItem">
       <dnn:Label ControlName="opt_DateFormat" ResourceKey="[RESX:DateFormat]"  runat="server" />
		
		<select id="opt_DateFormat">
						<option value="MM/dd/yyyy">MM/dd/yyyy</option>
						<option value="dd MMM yyyy">dd MMM yyyy</option>
						<option value="MM-dd-yyyy">MM-dd-yyyy</option>
						<option value="M-dd-yyyy">M-dd-yyyy</option>
						<option value="dd-MM-yyyy">dd-MM-yyyy</option>
						<option value="dd/MM/yyyy">dd/MM/yyyy</option>
						<option value="M/dd/yyyy">M/dd/yyyy</option>
		</select>
	</div>
	<div class="dnnFormItem">
       <dnn:Label ControlName="opt_TimeFormat" ResourceKey="[RESX:TimeFormat]"  runat="server" />
		
		<select id="opt_TimeFormat">
			<option value="hh:mm tt">hh:mm tt</option>
				<option value="hh:mm:ss tt">hh:mm:ss tt</option>
				<option value="h:mm tt">h:mm tt</option>
				<option value="h:mm:ss tt">h:mm:ss tt</option>
				<option value="HH:mm:ss">HH:mm:ss</option>
				<option value="HH:mm">HH:mm</option>
				<option value="H:mm:ss">H:mm:ss</option>
				<option value="H:mm">H:mm</option>
					</select>
	</div>
	<div class="dnnFormItem">
        <dnn:Label ControlName="drpopt_AdminNotifyRolesPicker" ResourceKey="[RESX:OrderNotifications]"  runat="server" />
		
		<select id="drpopt_AdminNotifyRolesPicker"></select>
        <a href="javascript:void(0);" onclick="opt_AdminNotifyRolesPicker.Add();" class="dnnPrimaryAction">[RESX:AddRole]</a>
		 
		   <div class="dnn-modcp-tokens">
				<ul id="opt_AdminNotifyRolesPicker">
				</ul>
				<input type="hidden" id="opt_AdminNotifyRoles" value="" />
			</div>
			
	</div>
	<b>[RESX:EmailTemplates]</b>
	<div class="dnnFormItem">
        <dnn:Label ControlName="opt_AdminNotifyTemplate" ResourceKey="[RESX:NotificationTemplate]"  runat="server" />
		<select id="opt_AdminNotifyTemplate"><%= EmailTemplates%></select>
	</div>
	<div class="dnnFormItem">
        <dnn:Label ControlName="opt_CustomerWelcomeTemplate" ResourceKey="[RESX:CustomerWelcome]"  runat="server" />
		<select id="opt_CustomerWelcomeTemplate"><%= EmailTemplates%></select>
	</div>
	<div class="dnnFormItem">
        <dnn:Label ControlName="opt_ReceiptEmailTemplate" ResourceKey="[RESX:CustomerOrderDetails]"  runat="server" />
		<select id="opt_ReceiptEmailTemplate"><%= EmailTemplates%></select>
	</div>
	<div class="dnnFormItem">
        <dnn:Label ControlName="opt_OrderPendingEmailTemplate" ResourceKey="[RESX:CustomerPendingPayment]"  runat="server" />
		<select id="opt_OrderPendingEmailTemplate"><%= EmailTemplates%></select>
	</div>

 </div>
 <div class="dnn-modcp-tab-content dnnForm" id="optTab2">
	<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:PaymentOptions]"  runat="server" />
		<asp:Literal ID="litPaymentOptions" runat="server" />
	</div>
	<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:EnableSSL]"  runat="server" />
		<input type="checkbox" id="opt_SSL" value="1" />
	</div>
    	<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:Currency]"  runat="server" />
		 <select id="opt_Currency">
							<option value="USD">US Dollars</option>
							<option value="AUD">Australian Dollar</option>
							<option value="CAD">Canadian Dollar</option>
							<option value="EUR">Euro</option>
							<option value="GBP">Pound Sterling</option>
							
						 </select>
	</div>
	<fieldset>
		<legend>[RESX:CreditCardProvider]</legend>
		<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:PaymentAssembly]"  runat="server" />
		<input type="text" id="opt_PaymentAssembly" value="" />
	</div>
	<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:PaymentClass]"  runat="server" />
		<input type="text" id="opt_PaymentClass" value="" />
	</div>

	<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:PaymentLogin]"  runat="server" />
		 <input type="text" id="opt_CCLoginId" value="" />
	</div>
	<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:PaymentPass]"  runat="server" />
		<input type="text" id="opt_CCPass" value="" />
	</div>
	<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:PaymentTestMode]"  runat="server" />
		<input type="checkbox" id="opt_TestMode" value="1" />
	</div>
    <div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:PaymentURL]"  runat="server" />
		<input type="text" id="opt_PaymentURL" value="" />
	</div>
	</fieldset>
	<fieldset>
		<legend>[RESX:PayPalInfo]</legend>
		<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:PayPalID]"  runat="server" />
		<input type="text" id="opt_PayPalId" value="" />
	</div>
	<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:PayPalURL]"  runat="server" />
		<input type="text" id="opt_PayPalURL" value="" />
	</div>
	<div class="dnnFormItem">
        <dnn:Label ResourceKey="[RESX:PayPalLang]"  runat="server" />
		<input type="text" id="opt_PayPalLanguage" value="" />
	</div>
	</fieldset>
	

	</div>
	<div class="dnn-modcp-tab-content" id="optTab3">
	   
				
		<div class="dnnForm">
			<div class="dnnFormMessage dnnFormInfo">
				<span>[RESX:Tax:Info]</span>
			</div>
		<table>
			<tr>
				<td><b>[RESX:TaxIdentifier]</b></td>
				<td><b>[RESX:TaxQualifier]</b></td>
				<td><b>[RESX:TaxRate]</b></td>
				<td></td>
			</tr>
			<tr>
				<td>
					<select style="width:150px;" id="drpTaxIdent">
						<option value="0">[RESX:City]</option>
						<option value="1">[RESX:State]</option>
						<option value="2">[RESX:PostalCode]</option>
						<option value="3">[RESX:Country]</option>
					</select>
				</td>
				<td>
					<input type="text" id="txtTaxQualifier" value="" />
				</td>
				<td>
					<input type="text" id="txtTaxRate" value="" onkeypress="return dnn_comm.utils.OnlyNumbers(event);" />
				</td>
				<td>
                    <a href="javascript:void(0);" onclick="tax_save();" class="dnnPrimaryAction">[RESX:Save]</a>
					
							
				</td>
				</tr>
			</table>
		</div>
		<table id="taxRates">
			
		</table>
			
		   


	</div>
	 <div class="dnn-modcp-tab-content" id="optTab4">
		<fieldset>
			<legend>[RESX:OrderStatusOptions]</legend>
			<table id="orderStatusList">
				
			</table>
			<div class="dnnForm">
				<div class="dnnFormMessage dnnFormInfo">
					<span>[RESX:OrderStatus:Info]</span>
				</div>
				<div class="dnnFormItem">
					<input type="hidden" id="txtOrderStatusId" value="" />
					<input type="text" id="txtOrderStatus" size="100" style="width:100px;" />
                    <a href="javascript:void(0);" onclick="status_Save(); return false;" class="dnnPrimaryAction">[RESX:Button:Save]</a>
					
				</div>
			</div>
		</fieldset>
		<table>
	  <tr>
					<td colspan="2"></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
					 <asp:Literal id="litOrderStatus" runat="server" />
						
					   
				   </td>
				   <td></td>
					<td></td>
				</tr></table>
	 </div>
<div id="controlActions" style="display:none;">
	 <ul class="dnnActions dnnClear">
		<li><a href="#" onclick="saveSettings(); return false;" class="dnnPrimaryAction">[RESX:Button:Save]</a></li>
	</ul>
		
</div>
	</div>
</div>
<%=sScripts %>
<script type="text/javascript">
	loadSettings();
	var opt_AdminNotifyRolesPicker = dnn_comm.utils.CreateObject(dnn_comm.RolePicker);
	opt_AdminNotifyRolesPicker.Init('opt_AdminNotifyRoles', allroles);

	$(document).ready(function () {
	    $('#optTabs').dnnTabs({ regionToToggleSelector: 'div' });
	    $('.dnnTooltip').dnnTooltip();

	});

status_ListGet();
tax_list();
</script>