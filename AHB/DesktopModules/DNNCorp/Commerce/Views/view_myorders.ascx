<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="view_myorders.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.view_myorders" %>
<table width="99%">
<asp:Repeater ID="rptMyOrders" runat="server">
    <HeaderTemplate><table></HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%#Eval("InvoiceNumber") %></td>
            <td><%#Eval("PurchaseDate") %></td>
            <td><%#Eval("GrandTotal") %></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
</asp:Repeater>
