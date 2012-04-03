<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_orders_edit.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.admin_orders_edit" %>
<%@ Register  assembly="DotNetNuke.Professional.Commerce" namespace="DotNetNuke.Professional.Commerce.Controls" tagPrefix="dnncomm" %>
<%@ Register TagPrefix="dnncomm" TagName="addrpicker" Src="~/DesktopModules/DNNCorp/Commerce/controls/usercontrols/addresspicker.ascx" %>
<script type="text/javascript">
    var custPickerModalOptions = {
        "height": 375,
        "width": 450,
        "title": "[RESX:SelectCustomerTitle]"
    };
    var orderItemModalOptions = {
        "height": 400,
        "width": 450,
        "title": "[RESX:OrderDetailsEditor]"
    };
    var addOrderItemModalOptions = {
        "height": 400,
        "width": 450,
        "title": "[RESX:OrderDetailsEditor]",
        "loadEvent": "var pdl = document.getElementById('ProductId');dnn_comm.utils.SetSelected(pdl,'-1');getProduct()"
    };
    var addressPickerModalOptions = {
        "height": 375,
        "width": 450,
        "title": "[RESX:SelectAddress]"
    };
    var curraddr = [];
    var billto = null;
    var shipto = null;
    function openAddressPicker(target) {
       
        var uid = document.getElementById('apo_UserId').value;
        
        if (uid != '' && uid > 0){
         AddressPicker_InitView();
        
            if (curraddr.length ==0) {
                var addr = {};
                addr.action = 24;
                addr.uid = uid;
                curraddr = ap_callback_synch(JSON.stringify(addr));
                
            }
            if (curraddr.length > 0){
                    BuildAddresses(target);
                };
            document.getElementById('addrtarget').value = target;
            dnn_comm.admin.DialogOpen('AddressPicker',addressPickerModalOptions);
        }else {
            alert('[RESX:SelectCustomer]');
        };
        
        
       
    };
    function addrtemplate(){
        var wrap = document.createElement('div');
        var div = document.createElement('div');
        div.appendChild(document.createTextNode('{Name}'));
        wrap.appendChild(div);
        div = document.createElement('div');
        div.appendChild(document.createTextNode('{Address1}'));
        wrap.appendChild(div);
        div = document.createElement('div');
        div.appendChild(document.createTextNode('{City}, {Region} {PostalCode} '));
        wrap.appendChild(div);
        div = document.createElement('div');
        div.appendChild(document.createTextNode('{Country}'));
        wrap.appendChild(div);
        return wrap;
    };

    
    function BuildAddresses(target){
        var aul = document.getElementById('custaddresses');
        var t = document.getElementById('lirow');
        var tr = t.cloneNode(true);
        var p = t.parentNode;
        if (p.hasChildNodes()) {
            while (p.childNodes.length >= 1) {
                p.removeChild(p.firstChild);
            };
        };
        p.appendChild(tr);
        dnn_comm.utils.BuildList(curraddr,'lirow', 'AddressId');
        var rows = aul.getElementsByTagName('li');
        for (var i = 0; i < rows.length; i++) {
		    var tr = rows[i];
            tr.onclick = function() {setAddress(this,target);};
	    };
        
    };
    function setAddress(obj,target,addr){
        var addrid = obj.id;
        var ablock = document.getElementById(target);
        if (ablock.hasChildNodes()) {
                    while (ablock.childNodes.length >= 1) {
                        ablock.removeChild(ablock.firstChild);
                    };
                };
        if (typeof(addr) == 'undefined'){
            for (var adr in curraddr){
                var ad = curraddr[adr];
                if (ad.AddressId == addrid){
                    addr = ad;        
                };
            };
        };
        
        if (target == 'Billing'){
            billto = addr;
        }else if (target == 'Shipping'){
            shipto = addr;
         };
        var tmp = addrtemplate();
        tmp = dnn_comm.utils.Bind(addr,tmp);
        ablock.appendChild(tmp);
        dnn_comm.admin.DialogClose('AddressPicker');

    };
    var orderid = '<%=OrderId.ToString() %>';
    var order = <%=Order %>;
    var odetails = [];
    function loadFullOrder(){

        dnn_comm.form.BindForm(order,'apo_');
     
        billto = order.BillAddress;
    
        shipto = order.ShipAddress;
        if (order.InvoiceNumber == ''){
            document.getElementById('apo_InvoiceNumber').setAttribute('disabled','disabled');
        };
        var tmp = addrtemplate();
        if (JSON.stringify(billto).length>4){
            tmp = dnn_comm.utils.Bind(billto,tmp);
            setAddress(tmp,'Billing',billto);
        };
        
        
        tmp = addrtemplate();
        if (JSON.stringify(shipto).length>4){
            tmp = dnn_comm.utils.Bind(shipto,tmp);
            setAddress(tmp,'Shipping',shipto);
        };
        document.getElementById('apo_OrderNote').innerHTML = order.OrderNote;
        odetails=order.OrderDetails;
        buildOrderDetails();
        
    };
    function refreshOrder(){
        var o = {};
        o.action = 41;
        o.oid = orderid;
        order = null;
        order = ap_callback_synch(JSON.stringify(o));
         var temp = document.getElementById('OrderDetailsRows');
                var tr = temp.cloneNode(true);
                var p = temp.parentNode;
                if (p.hasChildNodes()) {
                    while (p.childNodes.length >= 1) {
                        p.removeChild(p.firstChild);
                    };
                };
                p.appendChild(tr);
        loadFullOrder();
    };
    function loadCustomerView(){
        var uid = document.getElementById('apo_UserId').value;
        LoadView('admin_customers_view', uid);
    };
    function saveOrderDetails(){
        var prodsel = document.getElementById('ProductId');
        var prodid = prodsel.options[prodsel.selectedIndex].value;
        if (prodsel.selectedIndex > 0 ) {
            var prodname = prodsel.options[prodsel.selectedIndex].text;
            var price = document.getElementById('Price').value;
            var qty = document.getElementById('Qty').value;
            var note = document.getElementById('Note').value;
            var oitemid = document.getElementById('OrderDetailsId').value;
            if(oitemid=='' || oitemid == '-1'){
                oitemid = dnn_comm.utils.GetGuid();
            };
            var tmp = {};
            tmp.action = 36;
            tmp.OrderId = orderid;
            tmp.Price = price;
            tmp.ProductId = prodid;
            tmp.Qty = qty;
            tmp.Note = note;
            tmp.OrderDetailsId = oitemid;
            if (orderid.substring(0,8) == '00000000'){
                var tmpprod = {};
                tmpprod.action = 13;
                tmpprod.ProductId = prodid;
                var prod = ap_callback_synch(JSON.stringify(tmpprod));
                var oitem = {};
                oitem.OrderDetailsId = oitemid;
                oitem.OrderId = orderid;
                oitem.ProductId = prodid;
                oitem.Price = price;
                oitem.Qty = qty;
                oitem.Disc = 0;
                oitem.Misc = 0;
                oitem.DiscountId = -1;
                oitem.Note = note;
                oitem.SubTotal = price * qty;
                oitem.ProductSKU = prod.ProductSKU;
                oitem.ProductName = prod.ProductName;
                if(odetails.length ==0){
                    odetails = new Array();
                };
                var isEdit = false;
                for(var i = 0; i < odetails.length; i++) {
                    if(odetails[i].OrderDetailsId == oitem.OrderDetailsId) {
                        odetails[i] = oitem;
                        isEdit = true;
                        break;
                    }
                }
                if(!isEdit) {
                    odetails.push(oitem);
                }
                buildOrderDetails();   
                dnn_comm.admin.DialogClose('orderitem');
            }else{
                ap_callback(JSON.stringify(tmp),saveOrderDetails_complete);
            };
        };
        
    };

    function saveOrderDetails_complete(result){
        if(result.result == 'success'){
            if (typeof(result.orderdetails) != 'undefined'){
                odetails = result.orderdetails;
                buildOrderDetails();        
                
            };
        };
        dnn_comm.admin.DialogClose('orderitem');
        refreshOrder();
                
    };
    function buildOrderDetails(){
        order.OrderDetails = odetails;
        var temp = document.getElementById('OrderDetailsRows');
        var tr = temp.cloneNode(true);
        var p = temp.parentNode;
        if (p.hasChildNodes()) {
            while (p.childNodes.length >= 1) {
                p.removeChild(p.firstChild);
            };
        };
        p.appendChild(tr);
        dnn_comm.utils.BuildList(odetails,'OrderDetailsRows', 'OrderDetailsId');
        for (var i = 0; i < odetails.length; i++){
            var oinfo = odetails[i];
            if (typeof(oinfo.OrderItemData) != 'undefined') {
             if (oinfo.OrderItemData[0].properties.length>0) {
                var odUl = document.getElementById('orderdata-' + oinfo.OrderDetailsId);
                for (var x = 0; x < oinfo.OrderItemData[0].properties.length; x++) {
                    var prop = oinfo.OrderItemData[0].properties[x].property;
                    var li = document.createElement('li');
                    var lbl = document.createElement('b');
                    lbl.appendChild(document.createTextNode(unescape(prop.name) + ': '));
                    li.appendChild(lbl);
                    li.appendChild(document.createTextNode(prop.value));
                    odUl.appendChild(li);
                    
                };
            };
            };
        };
        try {
        subTotal();
        }catch (err) {
        }
        try {
        grandTotal();
        }catch (err) {
        
        }
    };
    function getProduct(){
        var drp = document.getElementById('ProductId');
        var tmp = {};
        tmp.action = 13;
        tmp.ProductId = drp.options[drp.selectedIndex].value;
        ap_callback(JSON.stringify(tmp),getProductComplete);

    };
    function getProductComplete(result){
        if(result.result == "failed") {
            document.getElementById('Price').value = '0.00';
            document.getElementById('SubTotal').value = '0.00';
            document.getElementById('Qty').value = 1;
            document.getElementById('Misc').value = '0.00';
            document.getElementById('Note').value = '';
        }
        else {
            document.getElementById('Price').value = result.Price;
            document.getElementById('SubTotal').value = result.Price;
            document.getElementById('Qty').value = 1;
        }
    };
    function subTotal(){
        var subtotal = 0;
        
        for (var i = 0; i < odetails.length; i++) {
            
            subtotal += dnn_comm.utils.CleanNumber(odetails[i].SubTotal);
        };
        document.getElementById('apo_SubTotal').value = dnn_comm.utils.FormatCurrency(subtotal,am.currency,false);
    };
    function grandTotal(){
        var grandtotal = 0;
        var subtotal = parseFloat(document.getElementById('apo_SubTotal').value);
        var tax = parseFloat(document.getElementById('apo_Tax').value);
        var misc = parseFloat(document.getElementById('apo_Misc').value);
        var disc = parseFloat(document.getElementById('apo_Disc').value);
        var ship = parseFloat(document.getElementById('apo_Shipping').value);
        grandtotal = ((subtotal + misc) - disc) + tax + ship;
        document.getElementById('apo_GrandTotal').value =  dnn_comm.utils.FormatCurrency(grandtotal,am.currency,false);
    };
    
    function calcOrderTotal(){
        var preTotal = 0;
        var txtOrderSubTotal = document.getElementById('apo_SubTotal');
        var txtOrderTax = document.getElementById('apo_Tax');
        var txtOrderMisc = document.getElementById('apo_Misc');
        var txtOrderDisc = document.getElementById('apo_Disc');
        var txtOrderShipping = document.getElementById('apo_Shipping');
        var txtOrderTotal = document.getElementById('apo_GrandTotal');
        if (txtOrderSubTotal.value == ''){txtOrderSubTotal.value = 0;}
        var subtotal = txtOrderSubTotal.value;
        subtotal = dnn_comm.utils.CleanNumber(subtotal);
        subtotal = parseFloat(subtotal);
        txtOrderSubTotal.value = subtotal + preTotal;
        
        if (txtOrderTax.value == ''){txtOrderTax.value = 0;}
        var tax = parseFloat(txtOrderTax.value);
        if (txtOrderMisc.value == ''){txtOrderMisc.value = 0;}
        var misc = parseFloat(txtOrderMisc.value);
        if (txtOrderDisc.value == ''){txtOrderDisc.value = 0;}
        var disc = parseFloat(txtOrderDisc.value);
        if (txtOrderShipping.value == ''){txtOrderShipping.value = 0;}
        var ship = parseFloat(txtOrderShipping.value);
        var ordertotal = (((((subtotal + preTotal) + tax) + misc) - disc) + ship);
        txtOrderTotal.value = ordertotal;
        
    };
    function editItem(obj){
        var p = dnn_comm.utils.GetParentByTagName(obj,'TR');
        var orderitem = {};
        odetails=order.OrderDetails;
        if (typeof(odetails) != 'undefined') {
            for (var i = 0; i < odetails.length; i++) {
                if(odetails[i].OrderDetailsId == p.id){
                    orderitem = odetails[i];
                };
            };
        };
        document.getElementById('Price').value = dnn_comm.utils.CleanNumber(orderitem.Price);
        document.getElementById('Qty').value = orderitem.Qty;
        document.getElementById('Misc').value = dnn_comm.utils.CleanNumber(orderitem.Misc);
        document.getElementById('SubTotal').value = dnn_comm.utils.CleanNumber(orderitem.SubTotal);
        document.getElementById('Note').value = orderitem.Note;
        document.getElementById('OrderDetailsId').value = orderitem.OrderDetailsId;
        document.getElementById('OrderId').value = orderitem.OrderId;
        var pdl = document.getElementById('ProductId');
        dnn_comm.utils.SetSelected(pdl,orderitem.ProductId);
        if (pdl.selectedIndex <=0) {
            //can't find product
             var tmp = {};
            tmp.action = 13;
            tmp.ProductId = orderitem.ProductId;
            var prod = ap_callback_synch(JSON.stringify(tmp));
            if (typeof(prod.ProductId) != 'undefined') {
                dnn_comm.utils.addOption('ProductId', prod.ProductName, prod.ProductId);
                dnn_comm.utils.SetSelected(pdl,orderitem.ProductId);
            }

        }
        dnn_comm.admin.DialogOpen('orderitem',orderItemModalOptions);
    };
    function deleteItem(obj){
        var p = dnn_comm.utils.GetParentByTagName(obj,'TR');
        if(confirm('[RESX:Actions:DeleteConfirm]')){
            if (orderid.substring(0,8) == '00000000') {
                var idx = -1;
                for (var i = 0; i < odetails.length; i++){
                    if(odetails[i].OrderDetailsId == p.id){
                        idx = i;
                    };
                };
                if (idx >=0){
                    odetails.splice(idx,1);
                    buildOrderDetails();
                };
            } else{
                var tmp = {};
                tmp.action = 40;
                tmp.oid = orderid;
                tmp.oitemid = p.id;
                ap_callback(JSON.stringify(tmp),saveOrderDetails_complete);
            };
        };
    };
function saveOrder(){
    dnn_comm.admin.ShowMsg('[RESX:PleaseWait]', 'loading');
    order.OrderId = orderid;
    order.UserId = document.getElementById('apo_UserId').value;
    order.PurchaseDate = document.getElementById('apo_PurchaseDate').value;
    var stat = document.getElementById('apo_OrderStatus');
    order.OrderStatus = stat.options[stat.selectedIndex].value;
    //order.OrderNote = '';
    var src = document.getElementById('apo_Source');
    order.Source = src.options[src.selectedIndex].value;
    var reps = document.getElementById('apo_SalesRepId');
    order.SalesRepId = reps.options[reps.selectedIndex].value;
    order.SubTotal = document.getElementById('apo_SubTotal').value;
    order.Tax = document.getElementById('apo_Tax').value;
    order.Disc = document.getElementById('apo_Disc').value;
    order.Misc = document.getElementById('apo_Misc').value;
    order.GrandTotal = document.getElementById('apo_GrandTotal').value;
    order.InvoiceNumber = document.getElementById('apo_InvoiceNumber').value;
    order.action = 43;
    order.DateUpdated = encodeURIComponent(order.DateUpdated);
    order.DatePaid = encodeURIComponent(order.DatePaid);
    order.PurchaseDate = encodeURIComponent(order.PurchaseDate);
    if (typeof(billto.AddressId)=='undefined') {
        delete order.BillTo;
    }else {
        order.BillTo = billto;
    };
    
    if (typeof(shipto.AddressId)=='undefined') {
        delete order.ShipTo;
    }else {
        order.ShipTo = shipto;
    };
    
    order.OrderDetails = null;
    delete order.OrderDetails;
    delete order.Shipping;
    delete order.Billing;
    ap_callback(JSON.stringify(order),saveOrderComplete);

};
function saveOrderComplete(result){
     if (typeof(result.OrderId) != 'undefined'){
        orderid = result.OrderId;
        for (var i = 0; i < odetails.length; i++) {
            var oi = odetails[i];
		    oi.action = 36;
            oi.OrderId = result.OrderId;
            ap_callback_synch(JSON.stringify(oi));
	    };
        refreshOrder();
      dnn_comm.admin.HideMsg(function () {
            dnn_comm.admin.ShowMsg('[RESX:SaveComplete]', 'positive');
            setTimeout(function () {
                dnn_comm.admin.HideMsg();
            }, 1600);
        });
    } else {
        dnn_comm.admin.ShowMsg(result.message, 'warn');
            setTimeout(function () {
                dnn_comm.admin.HideMsg();
            }, 3000);
    };
   
};
function deleteOrder(){
    if(confirm('[RESX:Actions:DeleteConfirm]')){
       var tmp = {};
       tmp.action = 42;
       tmp.orderid = orderid;
       ap_callback(JSON.stringify(tmp),deleteOrderComplete);
       
    };
};
function deleteOrderComplete(result){
    LoadView('admin_orders_list');
};
function setCustomer(cid){
    var tmp = {};
    tmp.action = 22;
    tmp.UserID = cid;
    ap_callback(JSON.stringify(tmp), getCustomerComplete);
};
function getCustomerComplete(result){
    if (typeof(result) != 'undefined'){
        var lbl = document.getElementById('apo_CustomerName');
        dnn_comm.utils.RemoveChildNodes('apo_CustomerName');
        document.getElementById('apo_UserId').value = result.UserID;     
        lbl.appendChild(document.createTextNode(result.FirstName + ' ' + result.LastName));
        dnn_comm.admin.DialogClose('CustPicker');
    };
};
function orderActions(){
    if (confirm('[RESX:Confirm:OrderActions]')){
        dnn_comm.admin.ShowMsg('[RESX:PleaseWait]', 'loading');
        var tmp = {};
        tmp.action = 35;
        tmp.oid = orderid;
        ap_callback(JSON.stringify(tmp), orderAction_complete);
    };
};
function orderAction_complete(result){
    if (result.result == 'success') {
        dnn_comm.admin.HideMsg(function () {
            dnn_comm.admin.ShowMsg('[RESX:OrderActionComplete]', 'positive');
            setTimeout(function () {
                dnn_comm.admin.HideMsg();
            }, 1600);
        });
    }else{
        dnn_comm.admin.HideMsg(function () {
            dnn_comm.admin.ShowMsg('[RESX:OrderActionFailed]' + result.message, 'warn');
            setTimeout(function () {
                dnn_comm.admin.HideMsg();
            }, 2600);
        });
    }
    
};
function openCustPicker(){
    CustPicker_InitView();
    dnn_comm.admin.DialogOpen('CustPicker',custPickerModalOptions);
}
function sendEmail() {
    if (confirm('[RESX:Confirm:ResendEmail]')) {
        dnn_comm.admin.ShowMsg('[RESX:PleaseWait]', 'loading');
        var tmp = {};
        tmp.action = 80;
        tmp.OrderId = orderid;
        ap_callback(JSON.stringify(tmp), sendEmail_Complete);
    }
};
function sendEmail_Complete(result) {
if (result.result == 'success') {
        dnn_comm.admin.HideMsg(function () {
            dnn_comm.admin.ShowMsg('[RESX:EmailSentComplete]', 'positive');
            setTimeout(function () {
                dnn_comm.admin.HideMsg();
            }, 1600);
        });
    }else{
        dnn_comm.admin.HideMsg(function () {
            dnn_comm.admin.ShowMsg('[RESX:EmailSentFailed]' + result.message, 'warn');
            setTimeout(function () {
                dnn_comm.admin.HideMsg();
            }, 2600);
        });
    }
}
</script>
<div>
    <a href="#" onclick="LoadView('admin_orders_list'); return false;">[RESX:Orders]</a>
    > [RESX:Details]
</div>
<div class="dnn-modcp-contentInner">
<div id="orderTabs" class="dnnForm dnnTabs">
    <ul class="dnnAdminTabNav dnnClear">
        <li><a href="#Tab1"><span>[RESX:Order]</span></a></li>
        <li><a href="#Tab2"><span>[RESX:OrderPostLog]</span></a></li>
    </ul>


  
    <div id="Tab1" class="dnn-modcp-tab-content">
        <div class="orderBox orderBox-left">
            <div class="orderBox-head"><span>[RESX:OrderInformation]</span></div>
            <table>
                <tr>
                    <td class="label"><label for="InvoiceNumber">[RESX:Invoice]:</label></td>
                    <td><input type="text" id="apo_InvoiceNumber" value="<NEW>" /></td>
                </tr>
                <tr>
                    <td class="label"><label for="PurchaseDate">[RESX:Date]:</label></td>
                    <td><input type="text" id="apo_PurchaseDate" /></td>
                </tr>
                <tr>
                    <td class="label"><label for="OrderSource">[RESX:Source]:</label></td>
                    <td><select id="apo_Source"><%= OrderSources%></select></td>
                </tr>
                <tr>
                    <td class="label"><label for="SalesRep">[RESX:SalesRep]:</label></td>
                    <td><select id="apo_SalesRepId"><%= SalesReps%></select></td>
                </tr>
                <tr>
                    <td class="label"><label for="OrderStatus">[RESX:Status]:</label></td>
                    <td><select id="apo_OrderStatus"><%= OrderStatuses%></select></td>
                </tr>
            </table>
        </div>
        <div class="orderBox orderBox-right">
            <div class="orderBox-head"><span>[RESX:CustomerInformation]</span><a href="javascript:openCustPicker();">[RESX:Edit]</a></div>
            <table>
                <tr>
                    <td class="label"><label for="CustomerName">[RESX:Customer]:</label></td>
                    <td>
                        <div class="dnn-modcp-picker">
                            <span class="dnn-modcp-picker-value"><a href="" id="apo_CustomerName" onclick="loadCustomerView(); return false;"></a>
                            </span><input type="hidden" id="apo_UserId" value="-1" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="orderBox orderBox-right">
            <div class="orderBox-head"><span>[RESX:PaymentDetails]</span></div>
             <table>
                    <tr>
                        <td class="label">[RESX:PaymentMethod]:</td><td><span id="apo_PaymentMethod"></span></td>
                    </tr>
                    <tr>
                        <td class="label">[RESX:Last4]:</td><td><span id="apo_PaymentCustom2"></span></td>
                    </tr>
                    <tr>
                        <td class="label">[RESX:TransactionId]:</td><td><span id="apo_PaymentRef"></span></td>
                    </tr>
                    <tr>
                        <td class="label">[RESX:Authorization]:</td><td><span id="apo_PaymentCustom1"></span></td>
                    </tr>
                </table>
        </div>
        <div class="clearfix"></div>
        <div class="orderBox orderBox-left">
            <div class="orderBox-head"><span>[RESX:BillingAddress]</span><a href="javascript:openAddressPicker('Billing');">[RESX:Edit]</a></div>
            <div id="Billing" class="addrBlock">
                                
                                 
            </div>
        </div>
        <div class="orderBox orderBox-right">
            <div class="orderBox-head"><span>[RESX:ShippingAddress]</span><a href="javascript:openAddressPicker('Shipping');">[RESX:Edit]</a></div>
            <div id="Shipping" class="addrBlock">
                    
                    
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="orderBox">
            <div class="orderBox-head"><span>[RESX:ItemsOrdered]</span><a href="javascript:dnn_comm.admin.DialogOpen('orderitem',addOrderItemModalOptions);">[RESX:AddItems]</a></div>
            <table id="OrderDetails" class="orderGrid">
            <thead>
                <tr>
                    <td></td>
                    <td>[RESX:Product]</td>
                    <td class="alignCenter">[RESX:Price]</td>
                    <td class="alignCenter">[RESX:Qty]</td>
                    <td class="alignCenter">[RESX:Misc]</td>
                    <td class="alignRight">[RESX:Total]</td>
                </tr>
            </thead>
            <tbody>
                <tr id="OrderDetailsRows" style="display:none;">
                    <td class="hover-actions"><span class="dnn-modcp-sprite16 dnn-modcp-edit12" onclick="editItem(this);"></span><span class="dnn-modcp-sprite16 dnn-modcp-delete12" onclick="deleteItem(this);"></span></td>
                    <td class="largecell"><b>{ProductName}</b> <i>{ProductSKU}</i><div>{Note}</div>
                    <ul id="orderdata-{OrderDetailsId}"></ul>
                    </td>
                    <td class="dnn-modcp-money">{Price}</td>
                    <td class="dnn-modcp-number">{Qty}</td>
                    <td class="dnn-modcp-money">{Misc}</td>
                    <td class="dnn-modcp-money">{SubTotal}</td>
                </tr>
            </tbody>
        </table>
        </div>
        
        
        <table class="orderGridFooter">
            <tr>
                <td rowspan="6" style="width:100%; vertical-align:top;">
                    <fieldset><legend>[RESX:CustomerNotes]<span onclick="document.getElementById('apo_OrderNote').focus();" class="dnn-modcp-sprite16 dnn-modcp-edit12"></span></legend>
                    <div id="apo_OrderNote" style="padding:4px;line-height:18px;" contenteditable="true" indicateeditable="true"></div>
                    </fieldset>
                </td>
                <td class="footer-left">[RESX:SubTotal]:</td>
                <td class="footer-right"><input type="text" id="apo_SubTotal" value="0.00"  onkeypress="return dnn_comm.utils.OnlyNumbers(event)" /></td>
            </tr>
            <tr>
                <td class="footer-left">[RESX:Tax]:</td>
                <td class="footer-right"><input type="text" id="apo_Tax" value="0.00" onblur="calcOrderTotal();"  onkeypress="return dnn_comm.utils.OnlyNumbers(event)" /></td>
            </tr>
            <tr>
                <td class="footer-left">[RESX:Misc]:</td>
                <td class="footer-right"><input type="text" id="apo_Misc" value="0.00" onblur="calcOrderTotal();" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" /></td>
            </tr>
            <tr>
                <td class="footer-left">[RESX:Discount]:</td>
                <td class="footer-right"><input type="text" id="apo_Disc" value="0.00" onblur="calcOrderTotal();" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" /></td>
            </tr>
            <tr>
                <td class="footer-left">[RESX:Shipping]:</td>
                <td class="footer-right"><input type="text" id="apo_Shipping" value="0.00" onblur="calcOrderTotal();" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" /></td>
            </tr>
            <tr>
                <td class="footer-left">[RESX:GrandTotal]:</td>
                <td class="footer-right"><input type="text" id="apo_GrandTotal" value="0.00" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" /></td>
            </tr>
        </table>
    </div>
    <div id="Tab2" class="dnn-modcp-tab-content">
          <asp:Repeater ID="rptPostLog" runat="server">
                    <HeaderTemplate>
                        <table width="100%">
                            <tr>
                                <td><b>[RESX:DateTime]</b></td>
                                <td><b>[RESX:Action]</b></td>
                                <td><b>[RESX:Result]</b></td>
                                <td><b>[RESX:Note]</b></td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("DateCreated") %></td>
                            <td><%#Eval("ActionName")%></td>
                            <td><%#GetStatus(Convert.ToInt16(Eval("Status"))) %></td>
                            <td><%#Eval("Note")%></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate></table></FooterTemplate>
                </asp:Repeater>
    </div>
    </div>
</div>
<div id="controlActions" style="display:none;">
 <ul class="dnnActions dnnClear">
   <li><a href="#" onclick="saveOrder(); return false;" class="dnnPrimaryAction">[RESX:Button:Save]</a></li> 
   <li> <a href="#" onclick="deleteOrder(); return false;" class="dnnSecondaryAction">[RESX:Button:Delete]</a></li> 
   <li> <a href="#" onclick="LoadView('admin_orders_list'); return false;" class="dnnSecondaryAction">[RESX:Button:Cancel]</a></li> 
   <li> <a href="#" onclick="orderActions(); return false;" class="dnnSecondaryAction">[RESX:Button:Payment]</a> </li> 
   <li> <a href="#" onclick="sendEmail(); return false;" class="dnnSecondaryAction">[RESX:Button:Email]</a> </li> 
</ul>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#orderTabs').dnnTabs();

    });

</script>

<%--<dnncomm:htmlcontrolloader ControlId="payment" Name="[RESX:SelectCustomer]" Height="375px" Width="425px" FilePath="~/DesktopModules/PRO_Commerce/config/templates/payment_editor.ascx" runat="server" />--%>
<dnncomm:htmlcontrolloader ControlId="CustPicker" Name="[RESX:SelectCustomer]" Height="375px" Width="450px" FilePath="~/DesktopModules/dnncorp/commerce/config/templates/customer_picker.ascx" runat="server" />
<dnncomm:htmlcontrolloader ControlId="orderitem" Name="[RESX:OrderDetailsEditor]" Height="400px" Width="450px" FilePath="~/DesktopModules/dnncorp/commerce/config/templates/orderitem_editor.ascx" runat="server" />
<dnncomm:addrpicker ControlKey="AddressPicker" runat="server" />

    <script type="text/javascript">
        loadFullOrder();
        
    </script>