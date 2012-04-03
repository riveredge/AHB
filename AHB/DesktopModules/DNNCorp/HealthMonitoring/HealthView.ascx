<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Professional.HealthMonitoring.HealthView" Codebehind="HealthView.ascx.cs" %>
<%@ Import Namespace="DotNetNuke.Professional.HealthMonitoring"%>
<div class="dnnForm dnnHealthView dnnClear" id="dnnHealthView">
	<ul class="dnnAdminTabNav dnnClear">
		<li><a href="#dhvSummary"><%=LocalizeString("Tab.Summary.Text")%></a></li>
		<li><a href="#dhvDetails"><%=LocalizeString("Tab.Details.Text")%></a></li>
	</ul>
	<div class="dhvSummary dnnClear" id="dhvSummary">
		<div class="dnnFormMessage dnnFormInfo"><%=LocalizeString("Summary.Instructions.Text")%></div>
		<div class="dnnFormItem">
			<asp:Label ID="lblLastPing" resourcekey="Summary.LastPingDate.Text" runat="server" CssClass="dnnFormLabel" />
			<%=LastCheck(HealthMonitorController.HEALTH_MONITOR)%>
		</div>
		<div class="dnnFormItem">
			<asp:Label ID="lblLastAppRestart" runat="server" resourcekey="Summary.LastAppRestart.Text" CssClass="dnnFormLabel" /> 
			<%=LastCheck(HealthMonitorController.APPLICATION_START)%>
		</div>
		<ul class="dnnActions dnnClear">
			<li> <%=GetActivationLink("Ping.Activation.Text")%></li>
		</ul>
	</div>
	<div class="dhvDetails dnnClear" id="dhvDetails">
		<asp:Repeater EnableViewState="False" runat="server" ID="dlLog">
			<HeaderTemplate>
				<div class="dnnGrid">
					<div class="healthheader dnnGridHeader">
						<div class="healthDate"><%#LocalizeString("Ping.Date.Text")%></div>
						<div class="healthPortal"><%#LocalizeString("Ping.Portal.Text")%></div>
					</div>
			</HeaderTemplate>
			<ItemTemplate>
				<div class="healthrow <%# Container.ItemIndex % 2 == 0 ? "dnnGridItem" : "dnnGridAltItem" %>">
					<div class="healthDate"><%#Eval("LogCreateDate")%></div>
					<div class="healthPortal"><%#Eval("LogPortalName")%></div>
				</div>
				<div id='guid-<%#((DotNetNuke.Services.Log.EventLog.LogInfo)Container.DataItem).LogGUID%>' class="healthDetail">
					<%#GetPropertiesText(Container.DataItem)%>
				</div>
			</ItemTemplate>
			<FooterTemplate></div></FooterTemplate>
		</asp:Repeater>
		<asp:Panel ID="divNoResults" CssClass="dnnFormMessage dnnFormSuccess" runat="server">
			<asp:Label ID="lblNoResults" runat="server" resourcekey="NoEntries" />
		</asp:Panel>
		<ul class="dnnActions dnnClear">
			<li><%=GetLogViewerLink()%></li>
		</ul>
	</div>
</div>