<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Professional.Commerce.Settings" Codebehind="Settings.ascx.cs" %>
<div class="dnnForm">
    <div class="dnnFormItem">
        <label>Display Mode:</label>
        <asp:DropDownList ID="drpDisplayMode" runat="server">
            <asp:ListItem Value="product_list" Text="Products"></asp:ListItem>
            <asp:ListItem Value="mini_cart" Text="MiniCart"></asp:ListItem>
            <asp:ListItem Value="myorders" Text="My Orders"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="dnnFormItem">
        <label>Product Template:</label>
        <asp:DropDownList ID="drpProductTemplate" runat="server"></asp:DropDownList>
    </div>

</div>