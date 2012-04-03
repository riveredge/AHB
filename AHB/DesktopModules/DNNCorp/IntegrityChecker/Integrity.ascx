<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="Integrity.ascx.cs" Inherits="DotNetNuke.Professional.IntegrityChecker.Integrity" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div class="dnnForm dnnIntegrity dnnClear" id="dnnIntegrity">
	<div class="dnnFormExpandContent" id="divExpand" runat="server" visible="false"><a href=""><%=Localization.GetString("ExpandAll", Localization.SharedResourceFile)%></a></div>
	<h2 id="dnnSitePanel-IntegritySummary" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("Summary.Head")%></a></h2>
	<asp:MultiView ID="trustedMultiView" runat="server" ActiveViewIndex="0">
		<asp:View ID="notTrustedView" runat="server">
            <fieldset class="dnnFSInfo">
                <div class="dnnFormMessage dnnFormValidationSummary"><asp:Label ID="errorTextLabel" runat="server" /></div>
            </fieldset>
		</asp:View>
		<asp:View ID="trustedView" runat="server">
            <fieldset class="dnnFSInfo">
			    <div class="dnnFormMessage dnnFormSuccess"><asp:Label ID="trustedTextLabel" runat="server" /></div>
			    <div class="dnnFormItem">
				    <dnn:Label ID="issuerLabel" runat="server" />
				    <asp:Label ID="issuerTextLabel" runat="server" />
			    </div>
			    <div class="dnnFormItem">
				    <dnn:Label ID="issuerLocationLabel" runat="server" />
				    <asp:Label ID="issuerLocationTextLabel" runat="server" />
			    </div>
            </fieldset>
			<h2 id="dnnSitePanel-IntegrityUnmodified" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><asp:Label ID="lblUnModified" runat="server" /></a></h2>
			<fieldset class="dnnFSInfo">
				<div class="dnnFormMessage dnnFormInfo"><%=LocalizeString("unmodified.Info")%></div>
				<asp:Repeater ID="unmodifiedFilesList" runat="server">
					<HeaderTemplate><ul></HeaderTemplate>
					<ItemTemplate>
						<li><%#Eval("RelativePath")%></li>
					</ItemTemplate>
					<FooterTemplate></ul></FooterTemplate>
				</asp:Repeater>
			</fieldset>
			<h2 id="dnnSitePanel-IntegrityModified" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><asp:Label ID="lblModified" runat="server" /></a></h2>
			<fieldset class="dnnFSInfo">
				<div class="dnnFormMessage dnnFormInfo"><%=LocalizeString("modified.Info")%></div>
				<asp:Repeater ID="modifiedFilesList" runat="server">
					<HeaderTemplate><ul></HeaderTemplate>
					<ItemTemplate>
						<li><%#Eval("RelativePath")%></li>
					</ItemTemplate>
					<FooterTemplate></ul></FooterTemplate>
				</asp:Repeater>
			</fieldset>
			<h2 id="dnnSitePanel-IntegrityMissing" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><asp:Label ID="lblMissing" runat="server" /></a></h2>
			<fieldset class="dnnFSInfo">
				<div class="dnnFormMessage dnnFormInfo"><%=LocalizeString("missing.Info")%></div>
				<asp:Repeater ID="missingFilesList" runat="server">
					<HeaderTemplate><ul></HeaderTemplate>
					<ItemTemplate>
						<li><%#Eval("RelativePath")%></li>
					</ItemTemplate>
					<FooterTemplate></ul></FooterTemplate>
				</asp:Repeater>
			</fieldset>
			<h2 id="dnnSitePanel-IntegrityNew" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><asp:Label ID="lblNew" runat="server" /></a></h2>
			<fieldset class="dnnFSInfo">
				<div class="dnnFormMessage dnnFormInfo"><%=LocalizeString("newfile.Info")%></div>
				<asp:Repeater ID="newFileList" runat="server">
					<HeaderTemplate><ul></HeaderTemplate>
					<ItemTemplate>
						<li><%#Container.DataItem%></li>
					</ItemTemplate>
					<FooterTemplate></ul></FooterTemplate>
				</asp:Repeater>
			</fieldset>
		</asp:View>
	</asp:MultiView>
</div>
<script type="text/javascript">
/*globals jQuery, window, Sys */
(function ($, Sys) {
	function setupDnnIntegrity() {
		$('#dnnIntegrity').dnnPanels()
			.find('.dnnFormExpandContent a').dnnExpandAll({ 
				expandText: '<%=Localization.GetString("ExpandAll", Localization.SharedResourceFile)%>', 
				collapseText: '<%=Localization.GetString("CollapseAll", Localization.SharedResourceFile)%>', 
				targetArea: '#dnnIntegrity' 
			});
	}

	$(document).ready(function () {
		setupDnnIntegrity();
		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
			setupDnnIntegrity();
		});
	});
}(jQuery, window.Sys));
</script>