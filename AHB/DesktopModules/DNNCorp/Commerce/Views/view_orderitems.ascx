<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="view_orderitems.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.view_orderitems" %>
<div class="dnnCart">
    <div class="dnnCart-top roundTop">
        <div class="tracker clearfix">
            <%= ProgressTracker%>
        </div>
        <div class="dnnCart-header clearfix">
            <div>[RESX:CartHeader]</div>
            <span>[RESX:CartHeader:Hint]</span>
        </div>
    </div>
 <div class="dnnCart-content">   
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
                    <td class="fullWidth">
                        <div><%#HttpUtility.UrlDecode(Eval("ProductName").ToString(), System.Text.Encoding.Default) %></div>
                        <div><%#Eval("Note") %></div>
                        <div class="odata"><%# GetOrderData(Eval("ProductId").ToString(), Eval("OrderItemData").ToString())%></div></td>
                    <td class="money" id="<%#Eval("OrderItemId") %>-price"><%#FormatMoney(Eval("Price").ToString())%></td>
                    <td class="money" id="<%#Eval("OrderItemId") %>-disc"><%#FormatMoney(Eval("Discount").ToString())%></td>
                    <td class="money" id="<%#Eval("OrderItemId") %>-subtotal"><%#FormatMoney(Eval("SubTotal").ToString())%></td>
                    
                </tr>
            </ItemTemplate>
        <FooterTemplate>
               </tbody>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <div class="dnnCart-buttonarea">
            <a href="<%=CheckOutUrl %>" class="dnnCart-positive checkout-icon"><i></i>[RESX:Button:Checkout]</a>
            <a href="<%=ProductsUrl %>" class="dnnCart-normal products-icon"><i></i>[RESX:Button:ContinueShopping]</a>
    </div>
    <div class="clearDiv"></div>
    </div>

    <div class="dnnCart-bottom roundBottom"></div>

</div>
   
   