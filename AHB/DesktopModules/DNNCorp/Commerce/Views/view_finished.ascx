<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="view_finished.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.view_finished" %>
<div class="dnnCart">
    <div class="dnnCart-top roundTop">
        <div class="tracker">
            <%= ProgressTracker%>
        </div>
        <div class="dnnCart-header clearfix">
            <div>[RESX:Finished]</div>
            <span>[RESX:Finished:Hint]</span>
        </div>
    </div>
    <div class="dnnCart-content">
        <fieldset>
            <legend>[RESX:OrderSummary]</legend>
            <asp:Repeater ID="rptOrder" runat="server">
                <HeaderTemplate>
                    <table class="dnnCart-grid dnnCart-finished">
                        <thead>
                            <tr>
                                <td class="alignCenter">[RESX:Qty]</td>
                                <td class="fullWidth">[RESX:Name]</td>
                                <td class="alignCenter">[RESX:Price]</td>
                                <td class="alignCenter">[RESX:Discount]</td>
                                <td class="alignCenter">[RESX:Total]</td>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                        <tr>
                            <td style="vertical-align:top;"><%#Eval("Qty") %></td>
                            <td class="dnnCart-fcol">
                                <div class="prodname">
                                    <%#Eval("ProductName") %>
                                </div>
                                <div class="odata"><%# GetOrderData(Eval("ProductId").ToString(), (System.Xml.XmlDocument)Eval("OrderItemData"))%></div>
                                <div class="orderitems">
                                    <div><%#Eval("Note") %></div>
                                    <div class="cart-downloads"><%# GetDownloads(Eval("OrderDetailsId").ToString())%></div>
                                </div>
                            </td>
                            <td class="money" style="vertical-align:top;"><%#FormatMoney(Eval("Price").ToString())%></td>
                            <td class="money" style="vertical-align:top;"><%#FormatMoney(Eval("Disc").ToString())%></td>
                            <td class="money" style="padding-right:20px;vertical-align:top;"><%#FormatMoney(Eval("SubTotal").ToString())%></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="3" style="text-align:left;"><%# ParseSpecialInstructions(Eval("ProductInfo.PostOrderInstructions").ToString(), Eval("OrderDetailsId").ToString())%></td>
                            <td></td>
                        </tr>
                    </ItemTemplate>
                <FooterTemplate>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5" style="padding-right:20px;">
                            <ul>
                                <li><b>[RESX:SubTotal]:</b><span class="money"><%= FormatMoney(Order.SubTotal)%></span></li>
                                <%if (Settings.CollectTax) {%>
                                <li><b>[RESX:Tax]:</b><span class="money"><%= FormatMoney(Order.Tax)%></span></li>
                                <%}%>
                                <li><b>[RESX:Misc]:</b><span class="money"><%= FormatMoney(Order.Misc)%></span></li>
                                <li><b>[RESX:Discount]:</b><span class="money"><%= FormatMoney(Order.Disc)%></span></li>
                                <% if (Settings.CollectShipping) {%>
                                <li><b>[RESX:Shipping]:</b><span class="money"><%= FormatMoney(Order.Shipping)%></span></li>
                                <%}%>
                                <li><b>[RESX:GrandTotal]:</b><span class="money"><%= FormatMoney(Order.GrandTotal)%></span></li>
                            </ul>
                    
                        </td>
                    </tr>
             
                       </tfoot> 
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </fieldset>
    </div>
    <div class="dnnCart-bottom roundBottom"></div>
</div>