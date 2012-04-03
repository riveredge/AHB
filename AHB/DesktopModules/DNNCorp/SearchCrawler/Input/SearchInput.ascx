<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="SearchInput.ascx.cs" Inherits="DotNetNuke.Professional.SearchCrawler.SearchInput.SearchInput" %>
<asp:PlaceHolder ID="phSearchInput" runat="server">
    <div class="dnnForm dnnSearchInput dnnClear" id="dnnSearchInput">
        <div class="dnnFormItem">
            <asp:Label CssClass="dnnSearchLabel dnnLeft" ID="lblSearch" runat="server" AssociatedControlID="txtSearch" resourcekey="lblSearch"/>
            <asp:TextBox CssClass="dnnSearchTextBox" ID="txtSearch" runat="server" Wrap="False" MaxLength="200"/>
            <asp:ImageButton ID="imgGo" CssClass="ImgSearch" runat="server" resourcekey="imgGo" CausesValidation="false" />
            <asp:Button CssClass="dnnPrimaryAction" ID="cmdGo" runat="server" Text="Go" CausesValidation="false"/>
        </div>
    </div>
</asp:PlaceHolder>