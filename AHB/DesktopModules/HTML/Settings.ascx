<%@ Control Inherits="DotNetNuke.Modules.HtmlPro.Settings" CodeBehind="Settings.ascx.cs" language="C#" AutoEventWireup="false"  %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div class="dnnForm dnnHTMLSettings dnnClear">
	<div class="dnnFormItem">
		<dnn:label id="plReplaceTokens" controlname="chkReplaceTokens" runat="server" />
		<asp:CheckBox ID="chkReplaceTokens" runat="server" />
	</div>
	<div class="dnnFormItem">
		<dnn:label id="plRenderType" controlname="cbRenderType" runat="server" />
		<asp:CheckBox ID="cbRenderType" runat="server" />
	</div>
	<div class="dnnFormItem" id="rowMaxVersions" runat="server" visible="false">
		<dnn:label id="plMaxVersions" runat="server" controlname="txtMaxVersions" suffix=":" />
		 <asp:TextBox ID="txtMaxVersions" runat="server" MaxLength="3" />
	</div>
	<div class="dnnFormItem">
		<dnn:label id="plWorkflow" controlname="cboWorkflow" runat="server" suffix=":" />
		<asp:DropDownList ID="cboWorkflow" runat="server" DataTextField="WorkflowName" DataValueField="WorkflowID" AutoPostBack="True" />
		<asp:HyperLink id="cmdWorkflow" runat="server" resourcekey="cmdWorkflow" Visible="false" />
	</div>
	<div class="dnnFormMessage dnnFormInfo">
		<asp:Label ID="lblDescription" runat="server" />
	</div>
	<div class="dnnFormItem" id="rowPageWorkflowOverride">
		<dnn:label id="plPageWorkflowOverride" controlname="chkPageWorkflowOverride" runat="server" />        
		<asp:CheckBox ID="chkPageWorkflowOverride" runat="server" AutoPostBack="true" />
	</div>
	<div class="dnnFormItem" id="rowModuleWorkflowOverride">
		<dnn:label id="plModuleWorkflowOverride" controlname="chkModuleWorkflowOverride" runat="server" />
		<asp:CheckBox ID="chkModuleWorkflowOverride" runat="server" AutoPostBack="true" />
	</div>
	<div class="dnnFormItem" id="rowApplyTo" runat="server">
		<dnn:label id="plApplyTo" controlname="rblApplyTo" runat="server" />
		<asp:RadioButtonList ID="rblApplyTo" runat="server" RepeatDirection="Horizontal" CssClass="dnnFormRadioButtons">
			<asp:ListItem Value="Module" ResourceKey="Module" />
			<asp:ListItem Value="Page" ResourceKey="Page" />
			<asp:ListItem Value="Site" ResourceKey="Site" />
		</asp:RadioButtonList>
		<asp:CheckBox ID="chkReplace" runat="server" resourcekey="chkReplace" CssClass="inline" />
	</div>
</div>