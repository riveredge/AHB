<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Professional.WebServerManager.EditServers" Codebehind="EditServers.ascx.cs" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>                
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<div class="dnnForm dnnEditServers dnnClear" ID="dnnEditServers">
	<div class="dnnFormExpandContent"><a href=""><%=Localization.GetString("ExpandAll", Localization.SharedResourceFile)%></a></div>
	<h2 ID="dnnSitePanel-EditServersCaching" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("Caching")%></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn:label ID="lblCachingProvider" runat="server" ControlName="CachingProviders" />
			<asp:DropDownList ID="CachingProviders" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn:label ID="plWebFarm" ControlName="chkWebFarm" runat="server" />
			<asp:Checkbox ID="chkWebFarm" runat="server" Enabled="false" />
		</div>
		<div class="dnnFormItem">
			<dnn:label ID="plUseIISAppName" ControlName="chkUseIISAppName" runat="server" />
			<asp:Checkbox ID="chkUseIISAppName" runat="server" Enabled="false" />
		</div>
		<ul class="dnnActions dnnClear">
			<li><asp:LinkButton ID="SaveProvider" runat="server" ResourceKey="grd.Save" CssClass="dnnPrimaryAction" /></li>
		</ul>
	</fieldset>
	<h2 ID="dnnSitePanel-EditServersServers" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("Servers")%></a></h2>
	<fieldset>
		<%-- HACK: this needs to be a repeater or a ListView or something else that doesn't wrap items in spans (or tables) --%>
		<asp:DataList ID="lstServers" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" DataKeyField="ServerID" OnItemDataBound="OnServersItemDataBound" OnEditCommand="OnServersEditCommand" OnCancelCommand="OnServersCancelCommand" OnUpdateCommand="OnServersUpdateCommand" OnDeleteCommand="OnServersDeleteCommand" >
			<HeaderTemplate><ul id="editServersList"><li></HeaderTemplate>
			<SeparatorTemplate></li><li></SeparatorTemplate>
			<FooterTemplate></li></ul></FooterTemplate>
			<ItemTemplate>
				<fieldset class="mwsEditServers dnnClear">
					<div class="dnnLeft"><dnn:DnnImage ID="WS" runat="server" IconKey="Webserver" IconSize="64X64" AlternateText='<%#Eval("ServerName")%>' CssClass="dnnServerImage"></dnn:DnnImage></div>
					<div class="dnnRight">
						<div class="dnnFormItem">
							<asp:Label runat="server" ResourceKey="grd.Server" AssociatedControlID="lblServerName" />
							<asp:Label ID="lblServerName" runat="server"><%#Eval("ServerName")%></asp:Label>
						</div>
						<div class="dnnFormItem">
							<asp:Label runat="server" ResourceKey="grd.IISAppName" AssociatedControlID="lblIisAppName" />
							<asp:Label ID="lblIisAppName" runat="server"><%#Eval("IISAppName")%></asp:Label>
						</div>
						<div class="dnnFormItem">
							<asp:Label runat="server" ResourceKey="grd.URL" AssociatedControlID="lblUrl" />
							<asp:Hyperlink ID="lblUrl" runat="server" NavigateUrl='<%# "http://" + Eval("Url")%>'><%#Eval("Url")%></asp:Hyperlink>
						</div>
						<div class="dnnFormItem">
							<asp:Label runat="server" ResourceKey="grd.CreatedDate" AssociatedControlID="lblCreatedDate" />
							<asp:Label ID="lblCreatedDate" runat="server"><%#Eval("CreatedDate")%></asp:Label>
						</div>
						<div class="dnnFormItem">
							<asp:Label runat="server" ResourceKey="grd.LastActivityDate" AssociatedControlID="lblLastActivityDate" />
							<asp:Label ID="lblLastActivityDate" runat="server"><%#Eval("LastActivityDate")%></asp:Label>
						</div>
						<div class="dnnFormItem">
							<asp:Label runat="server" ResourceKey="grd.Enabled" AssociatedControlID="lblEnabled" />
							<asp:Label ID="lblEnabled" runat="server"><%#LocalizeString("Enabled." + Eval("Enabled").ToString().ToUpperInvariant())%></asp:Label>
						</div>
					</div>
				</fieldset>
				<ul class="dnnActions dnnClear">
					<li><asp:LinkButton ID="Edit" runat="server" CommandName="Edit" Text='<%#LocalizeString("grd.Edit") + " " + Eval("ServerName")%>' CssClass="dnnPrimaryAction"/></li>
					<li><asp:LinkButton ID="Del" runat="server" CommandName="Delete" Text='<%#LocalizeString("grd.Delete") + " " + Eval("ServerName")%>' Visible="<%#Servers.Count > 1%>" CssClass="dnnSecondaryAction" /></li>
				</ul>
			</ItemTemplate>
			<EditItemTemplate>
				<fieldset>
					<div class="dnnFormItem">
						<asp:Label runat="server" ResourceKey="grd.Server" AssociatedControlID="lblServerName" />
						<asp:Label ID="lblServerName" runat="server"><%#Eval("ServerName")%></asp:Label>
					</div>
					<div class="dnnFormItem">
						<asp:Label runat="server" ResourceKey="grd.IISAppName" AssociatedControlID="lblIisAppName" />
						<asp:Label ID="lblIisAppName" runat="server"><%#Eval("IISAppName")%></asp:Label>
					</div>
					<div class="dnnFormItem">
						<asp:Label runat="server" ResourceKey="grd.URL" AssociatedControlID="lstAliases" />
						<asp:DropDownList ID="lstAliases" runat="server" />
					</div>
					<div class="dnnFormItem">
						<asp:Label runat="server" ResourceKey="grd.CreatedDate" AssociatedControlID="lblCreatedDate" />
						<asp:Label ID="lblCreatedDate" runat="server"><%#Eval("CreatedDate")%></asp:Label>
					</div>
					<div class="dnnFormItem">
						<asp:Label runat="server" ResourceKey="grd.LastActivityDate" AssociatedControlID="lblLastActivityDate" />
						<asp:Label ID="lblLastActivityDate" runat="server"><%#Eval("LastActivityDate")%></asp:Label>
					</div>
					<div class="dnnFormItem">
						<asp:Label runat="server" ResourceKey="grd.Enabled" AssociatedControlID="chkEnabled" />
						<asp:CheckBox ID="chkEnabled" runat="server" Checked='<%#Eval("Enabled")%>' />
					</div>
				</fieldset>
				<ul class="dnnActions dnnClear">
					<li><asp:LinkButton ID="Save" runat="server" CommandName="Update" Text='<%#LocalizeString("grd.Save")%>' CssClass="dnnPrimaryAction" /></li>
					<li><asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" Text='<%#LocalizeString("grd.Cancel")%>' CssClass="dnnSecondaryAction" /></li>
				</ul>
			</EditItemTemplate>
		</asp:DataList>
	</fieldset>
	<h2 ID="dnnSitePanel-EditServersMemory" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("MemoryUsage")%></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn:label ID="plServer" runat="server" ControlName="lblServer" />
			<asp:label ID="lblServer" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn:label ID="plLimit" runat="server" ControlName="lblLimit" />
			<asp:label ID="lblLimit" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn:label ID="plPrivateBytes" runat="server" ControlName="lblPrivateBytes" />
			<asp:label ID="lblPrivateBytes" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn:label ID="plCount" runat="server" ControlName="lblCount" />
			<asp:label ID="lblCount" runat="server" />
		</div>
		<div class="dnnFormItem" ID="rowItems" runat="server" visible="false">
			<dnn:label ID="plItems" runat="server" ControlName="cboItems" />
			<asp:DropDownList ID="cboItems" runat="server" AutoPostBack="true" />
		</div>
		<div class="dnnFormItem" ID="rowKey" runat="server" visible="false">
			<dnn:label ID="plKey" runat="server" ControlName="lblKey" />
			<asp:Label ID="lblKey" runat="server" />
		</div>
		<div class="dnnFormItem" visible="false" runat="server" ID="rowValue">
			<dnn:label ID="plValue" runat="server" ControlName="lblValue" />
			<asp:Label ID="lblValue" runat="server" />
		</div>
		<div class="dnnFormItem" visible="false" runat="server" ID="rowSize">
			<dnn:label ID="plSize" runat="server" ControlName="lblSize" />
			<asp:Label ID="lblSize" runat="server" />
		</div>
		<ul class="dnnActions dnnClear">
			<li><asp:LinkButton ID="cmdLoad" runat="server" CssClass="dnnPrimaryAction" ResourceKey="cmdLoad.Text" /></li>
			<li visible="false" runat="server" ID="rowExpire"><asp:LinkButton ID="cmdExpire" runat="server" CssClass="dnnSecondaryAction" ResourceKey="cmdExpire.Text" /></li>
		</ul>
	</fieldset>
</div>
<script type="text/javascript">
/*globals jQuery, window, Sys */
(function ($, Sys) {
	$(document).ready(function () {
		function setupDnnEditServers() {
			$('#dnnEditServers').dnnPanels()
				.find('.dnnFormExpandContent a').dnnExpandAll({
					expandText: '<%=Localization.GetString("ExpandAll", Localization.SharedResourceFile)%>',
					collapseText: '<%=Localization.GetString("CollapseAll", Localization.SharedResourceFile)%>',
					targetArea: '#dnnEditServers' 
				});
		}

		setupDnnEditServers();
		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
			setupDnnEditServers();
		});
	});
}(jQuery, window.Sys));
</script>