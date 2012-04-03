<%@ Control language="C#" Inherits="DotNetNuke.Modules.HtmlPro.Workflow" CodeBehind="Workflow.ascx.cs" AutoEventWireup="false"  %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Professional.HtmlPro" Namespace="DotNetNuke.Security.Permissions.Controls" %>
<div class="dnnForm dnnWorkflow dnnClear">
	<div class="dnnwfWorkflow">
		<div class="dnnFormItem" id="divWorkflow1" runat="server">
			<dnn:label id="plWorkflow1" runat="server" controlname="cboWorkflow" suffix=":" />
			<asp:dropdownlist id="cboWorkflow" runat="server" DataTextField="WorkflowName" DataValueField="WorkflowID" AutoPostBack="true" />
		</div>
		<div class="dnnFormItem" id="divWorkflow2" runat="server">
			<dnn:label id="plWorkflow2" runat="server" controlname="txtWorkflow" suffix=":" />
			<asp:TextBox ID="txtWorkflow" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn:label id="plDescription" runat="server" controlname="txtDescription" suffix=":" />
			<asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" />
		</div>
		<div class="dnnFormItem">
			<dnn:label id="plDeleted" runat="server" controlname="chkDeleted" suffix="?" />
			<asp:CheckBox ID="chkDeleted" runat="server" />
		</div>
		<ul class="dnnActions dnnClear">
			<li><asp:linkbutton id="cmdAddWorkflow" runat="server" class="dnnPrimaryAction" resourcekey="cmdAddWorkflow" /></li>
			<li><asp:linkbutton id="cmdSaveWorkflow" runat="server" class="dnnPrimaryAction" resourcekey="cmdUpdate" /></li>
			<li><asp:linkbutton id="cmdCancelWorkflow" runat="server" class="dnnSecondaryAction" resourcekey="cmdCancel" causesvalidation="False" /></li>
		</ul>
	</div>
	<div class="dnnwfStates" id="divStates" runat="server">
		<div class="dnnFormMessage dnnFormInfo"><asp:Label ID="lblWorkflowStateHelp" runat="server" resourcekey="WorkFlowStateHelp" /></div>
		<asp:datagrid ID="grdStates" runat="server" Width="100%" AutoGenerateColumns="false" GridLines="None" cssclass="dnnWorkflowGrid">
				<headerstyle cssclass="dnnGridHeader" verticalalign="Top" />
				<itemstyle cssclass="dnnGridItem" horizontalalign="Left" />
				<alternatingitemstyle cssclass="dnnGridAltItem" />
				<edititemstyle cssclass="dnnFormInput" />
				<selecteditemstyle cssclass="dnnFormError" />
				<footerstyle cssclass="dnnGridFooter" />
				<pagerstyle cssclass="dnnGridPager" />
			<Columns>
				<dnn:imagecommandcolumn CommandName="Edit" IconKey="Edit" KeyField="StateID" Text="Edit" />
				<dnn:imagecommandcolumn CommandName="Delete" IconKey="Delete" KeyField="StateID" Text="Delete" />
				<asp:BoundColumn HeaderText="State" DataField="StateName" />
				<asp:BoundColumn HeaderText="Active" DataField="IsActive" />
				<dnn:imagecommandcolumn CommandName="Up" IconKey="Up" KeyField="StateID" Text="Move Up" />
				<dnn:imagecommandcolumn CommandName="Down" IconKey="Dn" KeyField="StateID" Text="Move Down" />
			</Columns>
		</asp:datagrid>
		<ul class="dnnActions dnnClear">
			<asp:linkbutton id="cmdAddState" runat="server" class="dnnSecondaryAction" resourcekey="cmdAddState" />
		</ul>
	</div>
	<div class="dnnwfPermissions" id="divPermissions" runat="server">
		<div class="dnnFormItem">
			<dnn:label id="plState" runat="server" controlname="txtState" text="State" suffix=":" />
			<asp:TextBox ID="txtState" runat="server" />
		</div>
		<div class="dnnFormItem" id="rowPerms" runat="server">
			<dnn:label id="plPermissions" runat="server" controlname="grdPermissions" text="Reviewers" suffix=":" />
			<dnn:WorkflowStatePermissionsGrid id="grdPermissions" runat="server"/>
		</div>
		<div class="dnnFormItem" id="divNotify" runat="server">
			<dnn:label id="plNotify" runat="server" controlname="chkNotify" suffix="?" />
			<asp:CheckBox ID="chkNotify" runat="server" />
		</div>
		<div class="dnnFormItem" id="divActive" runat="server">
			<dnn:label id="plActive" runat="server" controlname="chkActive" suffix="?" />
			<asp:CheckBox ID="chkActive" runat="server" />
		</div>
		<ul class="dnnActions dnnClear">
			<li><asp:linkbutton id="cmdSavePermissions" runat="server" class="dnnPrimaryAction" resourcekey="cmdUpdate" /></li>
			<li><asp:linkbutton id="cmdCancelPermissions" runat="server" class="dnnSecondaryAction" resourcekey="cmdCancel" causesvalidation="False" /></li>
		</ul>
	</div>
</div>