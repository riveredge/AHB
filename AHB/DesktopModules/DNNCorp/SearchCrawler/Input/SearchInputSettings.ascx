<%@ control language="c#" autoeventwireup="false" codebehind="SearchInputSettings.ascx.cs" inherits="DotNetNuke.Professional.SearchCrawler.SearchInput.SearchInputSettings" %>
<%@ register tagprefix="dnn" tagname="Label" src="~/controls/LabelControl.ascx" %>
<div class="dnnForm dnnSearchInputSettings dnnClear">
    <div class="dnnFormItem">
        <dnn:label id="plModuleCombo" runat="server" controlname="cboModule" />
        <asp:label id="txtModule" runat="server" />
        <asp:dropdownlist id="cboModule" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label id="plGo" runat="server" controlname="chkGo" />
        <asp:checkbox id="chkGo" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label id="plSearchText" runat="server" controlname="chkSearchText" />
        <asp:checkbox id="chkSearchText" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label id="plSearchOnEnter" runat="server" controlname="chkSearchOnEnter" />
        <asp:checkbox id="chkSearchOnEnter" runat="server" />
    </div>
</div>