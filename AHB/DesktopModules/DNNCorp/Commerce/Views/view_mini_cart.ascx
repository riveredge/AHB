<%@ Control Language="C#" AutoEventWireup="true" Inherits="DotNetNuke.Professional.Commerce.view_orderitems" %>
 <asp:Repeater ID="rptOrder" runat="server">
        <HeaderTemplate>
           <table class="dnnCart-grid">
                <thead>
                <tr>
                    <td class="fullWidth">[RESX:Name]</td>
                    <td class="alignCenter">[RESX:Total]</td>
                </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
            <ItemTemplate>
                <tr id="<%#Eval("OrderItemId") %>">
                    <td class="fullWidth"><div><%#Eval("ProductName") %></div></td>
                    <td class="money" id="<%#Eval("OrderItemId") %>-subtotal"><%#FormatMoney(Eval("SubTotal").ToString())%></td>
                    
                </tr>
            </ItemTemplate>
        <FooterTemplate>
               </tbody>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>