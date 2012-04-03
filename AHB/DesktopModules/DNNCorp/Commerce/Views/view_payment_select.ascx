<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="view_payment_select.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.view_payment_select" %>
  <script type="text/javascript">
      function displayPayMethod() {
          var optSel = document.getElementById('appay_PaymentMethod');
          var ccDiv = document.getElementById('payCC');
          if (optSel != null) {
              if (optSel.selectedIndex > 0) {
                  optSel = optSel.options[optSel.selectedIndex].value;
              } else {
                  ccDiv.style.display = 'none';
                  optSel = '';
              };
          } else {
              optSel = '';
              ccDiv.style.display = 'none';
          };
          var ppDiv = document.getElementById('payPP');
          var divPO = document.getElementById('payPO');
          var divOther = document.getElementById('payOther');
          var divTransfer = document.getElementById('payTransfer');
          switch (optSel) {
              case 'VISA':
                  ccDiv.style.display = 'block';
                  ppDiv.style.display = 'none';
                  divOther.style.display = 'none';
                  divTransfer.style.display = 'none';
                  divPO.style.display = 'none';
                  break
              case 'MASTERCARD':
                  ccDiv.style.display = 'block';
                  ppDiv.style.display = 'none';
                  divOther.style.display = 'none';
                  divTransfer.style.display = 'none';
                  divPO.style.display = 'none';
                  break
              case 'AMERICAN EXPRESS':
                  ccDiv.style.display = 'block';
                  ppDiv.style.display = 'none';
                  divOther.style.display = 'none';
                  divTransfer.style.display = 'none';
                  divPO.style.display = 'none';
                  break
              case 'DISCOVER':
                  ccDiv.style.display = 'block';
                  ppDiv.style.display = 'none';
                  divOther.style.display = 'none';
                  divTransfer.style.display = 'none';
                  divPO.style.display = 'none';
                  break
              case 'PAYPAL':
                  ppDiv.style.display = 'block';
                  ccDiv.style.display = 'none';
                  divOther.style.display = 'none';
                  divTransfer.style.display = 'none';
                  divPO.style.display = 'none';
                  break
              case 'OTHER':
                  ppDiv.style.display = 'none';
                  ccDiv.style.display = 'none';
                  divOther.style.display = 'block';
                  divTransfer.style.display = 'none';
                  divPO.style.display = 'none';
                  break
              case 'BANK TRANSFER':
                  ppDiv.style.display = 'none';
                  ccDiv.style.display = 'none';
                  divOther.style.display = 'none';
                  divTransfer.style.display = 'block';
                  divPO.style.display = 'none';
                  break
              case 'PO':
                  ppDiv.style.display = 'none';
                  ccDiv.style.display = 'none';
                  divOther.style.display = 'none';
                  divTransfer.style.display = 'none';
                  divPO.style.display = 'block';
                  break

          };
      };
      function setPaymethod() {
          displayPayMethod();
      };
        
    </script>
<div class="dnnCart">
    <div class="dnnCart-top roundTop">
        <div class="tracker clearFix">
            <%= ProgressTracker%>
        </div>
        <div class="dnnCart-header clearFix">
            <div>[RESX:CartHeader]</div>
            <span>[RESX:CartHeader:Hint]</span>
        </div>
    </div>
 <div class="dnnCart-content clearFix">
    <asp:Repeater ID="rptOrder" runat="server">
        <HeaderTemplate>
            <table class="dnnCart-grid">
                <thead>
                <tr>
                    <td></td>
                    <td class="alignCenter" colspan="2">[RESX:Qty]</td>
                    <td class="fullWidth">[RESX:Name]</td>
                    <td class="alignCenter">[RESX:Price]</td>
                    <td class="alignCenter">[RESX:Discount]</td>
                    <td class="alignCenter">[RESX:Total]</td>
                </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
            <ItemTemplate>
                <tr id="<%#Eval("OrderItemId") %>">
                    <td><a href="#" onclick="ap_deleteItem(this); return false;" title="[RESX:DeleteItem]" class="delete-icon"></a></td>
                    <td class="lt-cell"><div><ul class="dnnCart-flip"><li onclick="ap_changeQty(this,1,'<%#Eval("ProductSku") %>');" class="dnnCart-flip-up" title="[RESX:IncreaseQty]"></li><li onclick="ap_changeQty(this,-1,'<%#Eval("ProductSku") %>');" class="dnnCart-flip-down" title="[RESX:DecreaseQty]"></li></ul></div></td>
                    <td class="qty rt-cell"><div id="<%#Eval("OrderItemId") %>-qty"><%#Eval("Qty") %></div></td>
                    <td class="fullWidth"><div><%#HttpUtility.UrlDecode(Eval("ProductName").ToString(), System.Text.Encoding.Default) %></div><div><%#Eval("Note") %></div></td>
                    <td class="money" id="<%#Eval("OrderItemId") %>-price"><%#FormatMoney(Eval("Price").ToString())%></td>
                    <td class="money" id="<%#Eval("OrderItemId") %>-disc"><%#FormatMoney(Eval("Discount").ToString())%></td>
                    <td class="money" id="<%#Eval("OrderItemId") %>-subtotal"><%#FormatMoney(Eval("SubTotal").ToString())%></td>
                </tr>
            </ItemTemplate>
        <FooterTemplate>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="7">
                    <ul>
                        <li><b>[RESX:SubTotal]:</b><span id="cartSubTotal" class="money"><%=sSubTotal%></span></li>
                        <%if (Settings.CollectTax) {%>
                        <li><b>[RESX:Tax]:</b><span id="cartTax" class="money"><%=sTax %></span></li>
                        <%}%>
                        <li><b>[RESX:Misc]:</b><span class="money"><%=sMisc%></span></li>
                        <li><b>[RESX:Discount]:</b><span id="cartDiscount" class="money"><%=sDiscount%></span></li>
                        <% if (Settings.CollectShipping) {%>
                        <li><b>[RESX:Shipping]:</b><span id="cartShipping" class="money"><%= sShipping%></span></li>
                        <%}%>
                        <li><b>[RESX:GrandTotal]:</b><span id="cartGrandTotal" class="money"><%=sGrandTotal%><input type="hidden" id="txtGrandTotal" name="txtGrandTotal" value="<%=dblGrandTotal %>" /></span></li>
                    </ul>
                        <fieldset><legend>[RESX:CheckOut:Notes]</legend>
                            <textarea id="txtNotes" name="txtNotes" width="90%" rows="2"></textarea>
                                                   </fieldset>
           
                        <fieldset><legend>[RESX:CheckOut:ApplyCode]</legend>
                          <div><%=errDisc %></div>
                          <span>[RESX:CheckOut:DiscHint]</span>
                          <div class="dnnCart-buttonarea">
                            <a href="javascript:void(0);" class="dnnCart-apply" onclick="ap_applyDisc(); return false;"><i></i>[RESX:ApplyDiscountCode]</a>
                            <input type="text" id="apDiscountCode" style="width:125px;" />
                                <div class="dnnCart-form-tooltip dnnCart-tooltip dnnCart-tooltip-content dnnCart-tooltip-warn">
                                    <div class="dnnCart-tooltip-pointer-top dnnCart-tooltip-content">
                                        <div class="dnnCart-tooltip-pointer-top-inner dnnCart-tooltip-warn"></div>
                                    </div>
                                    <div class="dnnCart-tooltip-text"></div>
                                </div>
                         </div>
                        </fieldset>
                    
                </td>
            </tr>
             
               </tfoot> 
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <div class="clearfix">
    <fieldset class="contactInfo">
        <legend>[RESX:ContactHeader]</legend>
        <h5>[RESX:ContactHeader:Hint]</h5>
        <ul>
                <li><b>[RESX:ContactInfo]</b></li>
                <li><%= CurrentUser.FirstName%> <%= CurrentUser.LastName%></li>
                <li>[RESX:Phone]: <%= CurrentUser.Telephone%></li>
                <li>[RESX:Email]: <%=CurrentUser.Email %></li>
            </ul>
            <ul>
                <li><b>[RESX:BillingAddress]</b></li>
                <li><%=BillingAddress.Name %></li>
                <li><%=BillingAddress.Address1 %></li>
                <li><%=BillingAddress.City %>, <%=BillingAddress.Region %>  <%= BillingAddress.PostalCode%></li>
                <li><%= BillingAddress.Country %></li>
            </ul>
            <%if (Settings.CollectShipping) {%>
                 <ul>
                    <li><b>[RESX:ShippingAddress]</b></li>
                    <li><%=ShippingAddress.Name%></li>
                    <li><%= ShippingAddress.Address1%></li>
                    <li><%= ShippingAddress.City%>, <%=ShippingAddress.Region%>  <%= ShippingAddress.PostalCode%></li>
                    <li><%=ShippingAddress.Country%></li>
                 </ul>
            
            <%}%>
    </fieldset>
    <fieldset class="paymentForm">
        <legend>[RESX:PaymentHeader]</legend>
        <h5>[RESX:PaymentHeader:Hint]</h5>
        
         <%  if (dblGrandTotal == 0) {%>
<div class="ap-ui-paymentarea clearFix" id="divPay" style="display:none;">
<%}else{%>
<div class="ap-ui-paymentarea clearFix" id="divPay">
<%}%>
<% if (String.IsNullOrEmpty(DefaultPaymentOption)) {%>
[RESX:CheckOut:PaymentMethod]:<select id="appay_PaymentMethod" name="appay_PaymentMethod" onchange="displayPayMethod();"><option value="-1">[RESX:PleaseSelect]</option><%= PayMethods%></select>        
<%}%>
     <table id="payCC" class="dnnCart-form">
        <thead>
            <tr>
                <td colspan="3">[RESX:CheckOut:PayCredit] <asp:Literal ID="litCCImages" runat="server" /></td>
            </tr>
        </thead>
        <tbody>
        <tr>
            <td><label>[RESX:CheckOut:NameOnCard]:</label></td>
            <td><input type="text" id="appay_NameOnCard" name="appay_NameOnCard" value="<%=NameOnCard %>" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" /><i class="am-ui-tt"></i></td>
            <td></td>
        </tr>
        <tr>
            <td><label>[RESX:CheckOut:CardNumber]:</label></td>
            <td><input type="text" id="appay_CardNumber" name="appay_CardNumber" value="" onkeypress="ap_fieldaccess(this); return dnn_comm.utils.OnlyNumbers(event);" onblur="ap_Validate(this);" /><i class="am-ui-tt"></i></td>
            <td>
                </td>
        </tr>
        <tr>
            <td><label>[RESX:CheckOut:EXP]:</label></td>
            <td>
                <select id="appay_ExpMonth" name="appay_ExpMonth" style="width:125px">
                <option value="01">01 - January</option>
                <option value="02">02 - February</option>
                <option value="03">03 - March</option>
                <option value="04">04 - April</option>
                <option value="05">05 - May</option>
                <option value="06">06 - June</option>
                <option value="07">07 - July</option>
                <option value="08">08 - August</option>
                <option value="09">09 - September</option>
                <option value="10">10 - October</option>
                <option value="11">11 - November</option>
                <option value="12">12 - December</option>
                </select>
                <select id="appay_ExpYear" name="appay_ExpYear" style="width:65px;"><%=ExpYears %></select><i class="am-ui-tt"></i>
            </td>
            <td>
                <asp:Literal ID="reqExpLiteral" runat="server" /></td>
        </tr>
        <tr>
            <td><label>[RESX:CheckOut:CCV]:</label></td>
            <td><input type="text" id="appay_CCV" name="appay_CCV" style="width:50px;" value="" onkeypress="ap_fieldaccess(this); return dnn_comm.utils.OnlyNumbers(event);" onblur="ap_Validate(this);" /><i class="am-ui-tt"></i></td>
            <td></td>
        </tr>
        <tr>
            <td class="apbold" colspan="3" style="color:#ff0000"><asp:Literal ID="litResponse" runat="server" /></td>
        </tr>
        </tbody>
    </table>
    <% if (DefaultPaymentOption == "PAYPAL") {%>
    <table width="300" id="payPP">
    <%} else {%>
    <table width="300" id="payPP" style="display:none;">
    <%} %>
        <tr>
            <td colspan="2"><b>[RESX:CheckOut:PayPayPal]</b></td>
        </tr>
        <tr>
            <td><%=PayPalImage %></td>
            <td><div style="padding:5px;">[RESX:CheckOut:PayPalMessage]</div></td>
        </tr>
    </table>
    <% if (DefaultPaymentOption == "BANK TRANSFER") {%>
    <div id="payTransfer">
    <%} else {%>
       <div id="payTransfer" style="display:none;">
    <%} %>
        <div style="padding:5px;">[RESX:CheckOut:TransferMessage]</div>
    </div>
     <% if (DefaultPaymentOption == "OTHER") {%>
     <div id="payOther">
    <%} else {%>
       <div id="payOther" style="display:none;">
    <%} %>
   
        <div style="padding:5px;">[RESX:CheckOut:OtherMessage]</div>
    </div>
       <% if (DefaultPaymentOption == "PO") {%>
     <div id="payPO">
    <%} else {%>
    <div id="payPO" style="display:none;">
    <%} %>
    
        <div style="padding:5px;">[RESX:CheckOut:PurchaseOrderMessage]</div>
        <table width="250">
            <tr>
                <td class="apnormal">[RESX:PurchaseOrderNumber]:</td>
                <td><input type="text" id="txtPurchaseOrder" name="txtPurchaseOrder" value="" /></td>
                <td style="font-weight:bold;color:#ff0000;"><asp:label ID="lblPORequired" runat="server"  Visible="false" Text="[RESX:PurchaseOrderRequired]" /></td>
                
            </tr>
        </table>
    </div>
</div>
<% if (dblGrandTotal == 0) {%>
<div class="ap-ui-paymentarea clearFix" id="divNoPay">
<%}else{%>
<div class="ap-ui-paymentarea clearFix" id="divNoPay" style="display:none;">
<%}%>
    <div class="apbold" style="padding:5px;">[RESX:CheckOut:NoPayMessage]</div>
</div>    
    </fieldset>
    </div>
      <div class="dnnCart-buttonarea" style="margin-right:20px;">
            <% if (dblGrandTotal > 0) {%>
            <a href="#" onclick="ap_processPayment(this); return false;" id="appay_Submit" class="dnnCart-positive next-icon"><i></i>[RESX:Button:ProcessPayment]</a>
            <%}else{%>
            <a href="#" onclick="ap_processOrder(); return false;" id="appay_Submit" class="dnnCart-positive next-icon"><i></i>[RESX:Button:ProcessPayment]</a>
            <%}%>
            
            <a href="<%=ProductsUrl %>" class="products-icon"><i></i>[RESX:Button:ContinueShopping]</a>
   </div>
    <div class="clearDiv"></div>
   </div>
    <div class="dnnCart-bottom roundBottom"></div>
</div>

<input type="hidden" id="defaultPaymethod" value="<%=DefaultPaymentOption %>" />
<%  if (!CreditCardOnly) {%>
<script type="text/javascript">
    setPaymethod();
</script>
<%}%>
<div class="dnnCart-modal" id="ap-wait" style="width:400px;height:200px;">
    <div>
        <div class="dnnCart-loader">[RESX:PleaseWait]</div>
    </div>
</div>
