<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditPortalGroupView.ascx.cs" Inherits="DotNetNuke.Professional.PortalGroups.Views.EditPortalGroupView" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>

<div class="dnnForm dnnPortalGroups dnnClear">
    <div id="addPortalGroupMessage" runat="server" class="dnnFormMessage dnnFormInfo"><%=LocalizeString("AddPortalGroup") %></div>
    <div class="dnnFormItem">
		<dnn:Label ID="nameLabel" runat="server" ControlName="nameTextBox" />
		<asp:TextBox ID="nameTextBox" CssClass="dnnFormRequired" runat="server" MaxLength="100" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="nameTextBox" 
			resourcekey="valGroupName" CssClass="dnnFormMessage dnnFormError" Display="Dynamic"></asp:RequiredFieldValidator>
	</div>
    <div class="dnnFormItem">
		<dnn:Label ID="descriptionLabel" runat="server" ControlName="txtPortalName" />
		<asp:TextBox ID="descriptionTextBox" CssClass="dnnFormRequired" runat="server" TextMode="MultiLine" Rows="2" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="descriptionTextBox" 
			resourcekey="valGroupDesc" CssClass="dnnFormMessage dnnFormError" Display="Dynamic"></asp:RequiredFieldValidator>
	</div>
    <div class="dnnFormItem">
		<dnn:Label ID="masterPortalLabel" runat="server" ControlName="availablePortalsList" />
		<asp:Label ID="masterPortal" runat="server"  />
        <asp:DropDownList ID="availablePortalsList" runat="server" DataTextField="PortalName" DataValueField="PortalID" />
	</div>
    <div id="domainRow" runat="server" class="dnnFormItem">
		<dnn:Label ID="domainLabel" runat="server" ControlName="domainTextBox" />
		<asp:TextBox ID="domainTextBox" runat="server" MaxLength="200" CssClass="dnnFormRequired" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="domainTextBox" 
			resourcekey="valDomain" CssClass="dnnFormMessage dnnFormError" Display="Dynamic"></asp:RequiredFieldValidator>
		<asp:RegularExpressionValidator runat="server" ControlToValidate="domainTextBox"
			ValidationExpression="^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}$"
			resourcekey="valDomain" CssClass="dnnFormMessage dnnFormError" Display="Dynamic"></asp:RegularExpressionValidator>
	</div>
    <div id="noPortals" runat="server" class="dnnFormMessage dnnFormInfo"><%=LocalizeString("NoPortals") %></div>
    <div id="memberPortalsRow" runat="server" class="dnnFormItem">
		<dnn:Label ID="memberPortalsLabel" runat="server" ControlName="portalsDualListBox" />
        <div class="portalsDualListBox">
		    <dnn:DualListBox id="portalsDualListBox" runat="server" DataValueField="PortalID" DataTextField="PortalName" 
                            AddKey="AddPortal" RemoveKey="RemovePortal" AddAllKey="AddAllPortals" RemoveAllKey="RemoveAllPortals" 
                            AddImageURL="~/images/rt.gif" AddAllImageURL="~/images/ffwd.gif" RemoveImageURL="~/images/lt.gif" 
                            RemoveAllImageURL="~/images/frev.gif" ShowRemoveAllButton="false" CausesValidation="true" >
			    <AvailableListBoxStyle Height="130px" Width="180px" />
			    <HeaderStyle CssClass="dnnFormLabel" />
			    <SelectedListBoxStyle Height="130px" Width="180px"  />
		    </dnn:DualListBox>
            <dnn:Label ID="copyUsersLabel" runat="server" ControlName="copyUsers"  resourcekey="copyUsers"/>
            <asp:CheckBox ID="copyUsers" runat="server"/>
        </div>
	</div>
    <div class="managePortalProgress" style="text-align:center">
        <dnn:DnnProgressManager id="progressManager" runat="server" />
        <dnn:DnnProgressArea id="managePortalProgressArea" runat="server" TimeElapsed="true"  />
    </div>
    <ul class="dnnActions dnnClear">
	    <li><asp:LinkButton id="createButton" runat="server" CssClass="dnnPrimaryAction" resourcekey="createPortalGroup" /></li>
	    <li><asp:LinkButton id="updateButton" runat="server" CssClass="dnnPrimaryAction" resourcekey="savePortalGroup" /></li>
	    <li><asp:LinkButton id="deleteButton" runat="server" CssClass="dnnSecondaryAction dnnDeleteProductGroup" resourcekey="deletePortalGroup" Causesvalidation="False"/></li>
	    <li><asp:Hyperlink id="cancelHyperLink" runat="server" CssClass="dnnSecondaryAction" resourcekey="cmdCancel" /></li>
    </ul>
</div>
<script language="javascript" type="text/javascript">
    /*globals jQuery, window, Sys */
    (function ($, Sys) {
        function setUpMessageList() {
            var yesText = '<%= Localization.GetString("Yes.Text", Localization.SharedResourceFile) %>';
            var noText = '<%= Localization.GetString("No.Text", Localization.SharedResourceFile) %>';
            var title = '<%= Localization.GetString("Confirm.Text", Localization.SharedResourceFile) %>';
            $('.dnnDeleteProductGroup').dnnConfirm({
                text: '<%= Localization.GetString("Delete.Text", LocalResourceFile) %>',
                yesText: yesText,
                noText: noText,
                title: title
            });

            var removeTitle = '<%= Localization.GetString("RemovePortal.Text", LocalResourceFile) %>';
            var removeAllTitle = '<%= Localization.GetString("RemoveAllPortals.Text", LocalResourceFile) %>';

            $("a[title='" + removeTitle + "'], a[title='" + removeAllTitle + "']").dnnConfirm({
                text: '<%= Localization.GetString("RemovePortalFromGroup.Text", LocalResourceFile) %>',
                yesText: yesText,
                noText: noText,
                title: title
            });
        }

        $(document).ready(function () {
            setUpMessageList();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                setUpMessageList();
            });
        });
    } (jQuery, window.Sys));
</script>