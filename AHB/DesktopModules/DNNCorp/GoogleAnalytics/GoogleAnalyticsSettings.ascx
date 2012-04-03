<%@ Control language="C#" Inherits="DotNetNuke.Professional.GoogleAnalyticsPro.GoogleAnalyticsSettings" AutoEventWireup="false"  Codebehind="GoogleAnalyticsSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<%@ Register TagPrefix="dnn" Namespace="Telerik.Web.UI" %>
<div class="dnnForm dnnGoogleAnalyticsPro dnnClear" id="dnnGoogleAnalyticsPro">
    <div class="dnnFormExpandContent"><a href=""><%=Localization.GetString("ExpandAll", Localization.SharedResourceFile)%></a></div>
    <h2 id="dnnSitePanel-GAProTracking" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("Tracking")%></a></h2>
    <fieldset>
        <div class="dnnFormItem">
            <dnn:label id="lblTrackingId" runat="server" controlname="txtTrackingId" suffix=":" />
            <asp:textbox id="txtTrackingId" runat="server" />
            <asp:RequiredFieldValidator ID="valTrackingId" runat="server" CssClass="dnnFormMessage dnnFormError" ControlToValidate="txtTrackingId" Display="Dynamic" resourcekey="valTrackingId" ValidationGroup="Form" />
        </div>
        <div class="dnnFormItem">
            <dnn:label id="lblEnable" runat="server" controlname="lblEnable" suffix=":" />
            <asp:checkbox id="chkEnable" runat="server" />
        </div>
    </fieldset>
    <h2 id="dnnSitePanel-GAProAdvaParams" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("AdvancedParams")%></a></h2>
    <fieldset>
        <div class="dnnFormItem">
            <dnn:label id="lblUrlParameter" runat="server" controlname="txtUrlParameter" suffix=":" />
            <asp:textbox id="txtUrlParameter" runat="server" textmode="multiline" rows="3" />
        </div>
        <div class="dnnFormItem">
            <dnn:label id="lblDomainName" runat="server" controlname="lblDomainName" suffix=":" />
            <asp:textbox id="txtDomainName" runat="server" />
        </div>
    </fieldset>
    <h2 id="dnnSitePanel-GAProSegRules" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("SegRules")%></a></h2>
    <fieldset>
        <dnn:DnnGrid id="dgRules" runat="server" AutoGenerateColumns="false" AllowSorting="false" CssClass="dnnGAProGrid">
            <MasterTableView DataKeyNames="RuleId,RulePosition">
                <Columns>
                    <dnn:DnnGridButtonColumn UniqueName="imgEdit" ButtonType="ImageButton" IconKey="Edit" CommandName="EditItem" />
                    <dnn:DnnGridButtonColumn UniqueName="imgDelete" ButtonType="ImageButton" IconKey="Delete" CommandName="DeleteItem" />
                    <dnn:DnnGridBoundColumn DataField="Label" HeaderText="Label" />
                    <dnn:DnnGridBoundColumn DataField="Page" HeaderText="Page" />
                    <dnn:DnnGridBoundColumn DataField="Role" HeaderText="Role" />
                    <dnn:DnnGridButtonColumn UniqueName="imgUp" HeaderText="Up" ButtonType="ImageButton" IconKey="Up" CommandName="MoveUp" />
                    <dnn:DnnGridButtonColumn UniqueName="imgDn" HeaderText="Down" ButtonType="ImageButton" IconKey="Dn" CommandName="MoveDown" />
                </Columns>
                <NoRecordsTemplate>
                    <div class="dnnFormMessage dnnFormWarning">
                        <asp:Label ID="lblNoRecords" runat="server" resourcekey="lblNoRecords" />
                    </div>
                </NoRecordsTemplate>
            </MasterTableView>
        </dnn:DnnGrid>
        <fieldset class="dnnEditSegmentRule">
            <div class="dnnFormItem dnnFormHelp dnnClear"><p class="dnnFormRequired"><span><%=LocalizeString("RequiredFields")%></span></p></div>
            <div class="dnnFormItem">
                <dnn:label id="plLabel" runat="server" controlname="txtLabel" suffix=":" />
                <asp:TextBox ID="txtLabel" runat="server" CssClass="dnnFormRequired" />
                <asp:RequiredFieldValidator ID="valLabel" runat="server" CssClass="dnnFormMessage dnnFormError" ControlToValidate="txtLabel" Display="Dynamic" resourcekey="valLabel" ValidationGroup="Rule" />
            </div>
            <div class="dnnFormItem">
                <dnn:label id="plPages" runat="server" controlname="lstPages" suffix=":" />
                <asp:dropdownlist id="cboTab" datatextfield="IndentedTabName" datavaluefield="TabId" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn:label id="plRoles" runat="server" controlname="lstRoles" suffix=":" />
                <asp:dropdownlist id="cboRole" runat="server" datavaluefield="RoleId" datatextfield="RoleName" />
            </div>
            <ul class="dnnActions dnnClear">
                <li><asp:LinkButton id="cmdSaveRule" runat="server" CssClass="dnnPrimaryAction" resourcekey="cmdSave" ValidationGroup="Rule" /></li>
                <li><asp:LinkButton id="cmdCancel" runat="server" resourcekey="cmdCancel" CssClass="dnnSecondaryAction" CausesValidation="false" Visible="false" /></li>
            </ul>
        </fieldset>
    </fieldset>
    <ul class="dnnActions dnnClear">
        <li><asp:LinkButton id="cmdUpdate" runat="server" resourcekey="cmdUpdate" CssClass="dnnPrimaryAction" ValidationGroup="Form" /></li>
    </ul>
</div>
<script type="text/javascript">
/*globals jQuery, window, Sys */
(function ($, Sys) {
    function setupDnnGoogleAnalyticsPro() {
        $('#dnnGoogleAnalyticsPro').dnnPanels()
            .find('.dnnFormExpandContent a').dnnExpandAll({
                expandText: '<%=Localization.GetString("ExpandAll", Localization.SharedResourceFile)%>', 
                collapseText: '<%=Localization.GetString("CollapseAll", Localization.SharedResourceFile)%>', 
                targetArea: '#dnnGoogleAnalyticsPro' 
            });
    }

    $(document).ready(function () {
        setupDnnGoogleAnalyticsPro();
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            setupDnnGoogleAnalyticsPro();
        });
    });
}(jQuery, window.Sys));
</script>