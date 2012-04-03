<%@ control language="c#" autoeventwireup="false" codebehind="SearchResultsSettings.ascx.cs" inherits="DotNetNuke.Professional.SearchCrawler.SearchResults.SearchResultsSettings" %>
<%@ register tagprefix="dnn" tagname="Label" src="~/controls/LabelControl.ascx" %>

<div class="dnnForm dnnSearchResultsSettingsPE dnnClear">
    <div class="dnnFormItem">
        <dnn:label id="plShowOnSearch" runat="server" controlname="chkShowOnSearch" />
        <asp:checkbox id="chkShowOnSearch" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label id="plSearchByRole" runat="server" controlname="chxSearchByRole" />
        <asp:checkbox id="chxSearchByRole" runat="server" />
    </div>
    <div class="dnnFormItem">
         <dnn:label id="plSearchScope" runat="server" controlname="lsbSearchScope" />
         <asp:listbox id="lsbSearchScope" runat="server" width="300" rows="5" selectionmode="Multiple" />
         <asp:CustomValidator ID="valSearchScope" runat="server" ControlToValidate="lsbSearchScope" Display="Dynamic" SetFocusOnError="true" ValidateEmptyText="true" resourcekey="valSearchScope.ErrorMessage" onservervalidate="valSearchScope_ServerValidate" CssClass="dnnFormMessage dnnFormError" />
    </div>
    <div class="dnnFormItem">
        <dnn:label id="plResultsPerPage" runat="server" controlname="txtResultsPerPage" />
        <asp:textbox id="txtResultsPerPage" runat="server" maxlength="5" />
    </div>
    <div class="dnnFormItem">
        <dnn:label id="plTitleLength" runat="server" controlname="txtTitleLength" />
        <asp:textbox id="txtTitleLength" runat="server" maxlength="5" />
    </div>
    <div class="dnnFormItem">
        <dnn:label id="plTitleLinkTarget" runat="server" controlname="ddlTitleLinkTarget" />
        <asp:dropdownlist id="ddlTitleLinkTarget" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label id="plDescriptionFragments" runat="server" controlname="txtDescriptionFragments" />
        <asp:textbox id="txtDescriptionFragments" runat="server" maxlength="5" />
    </div>
    <div class="dnnFormItem">
        <dnn:label id="plDescriptionHide" runat="server" controlname="chkDescriptionHide" />
        <asp:checkbox id="chkDescriptionHide" runat="server" />
    </div>
</div>