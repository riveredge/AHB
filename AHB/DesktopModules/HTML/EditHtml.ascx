<%@ Control Language="C#" Inherits="DotNetNuke.Modules.HtmlPro.EditHtml" CodeBehind="EditHtml.ascx.cs"
	AutoEventWireup="false" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="texteditor" Src="~/controls/texteditor.ascx" %>
<%@ Register TagPrefix="dnnweb" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<div class="dnnForm dnnEditHtml dnnClear" id="dnnEditHtml">
	<ul class="dnnAdminTabNav dnnClear">
		<li><a href="#currentContent">
			<%=LocalizeString("dshCurrentContent")%></a></li>
		<%if (ShowMasterContent){ %><li><a href="#masterContent">
			<%=LocalizeString("dshMaster")%></a></li><% } %>
		<%if (!ShowComment){ %><li><a href="#versions">
			<%=LocalizeString("dshVersions")%></a></li><% } %>
	</ul>
	<div class="ehContent dnnClear" id="ehContent" runat="server">
		<div class="ehccContent dnnClear" id="currentContent">
			<div class="dnnFormItem">
				<dnn:label id="plRenderType" controlname="cbRenderType" runat="server" />
				<asp:CheckBox ID="cbRenderType" runat="server" />
			</div>
			<div class="dnnFormItem" id="divCurrentVersion" runat="server">
				<dnn:label id="plCurrentWorkVersion" runat="server" controlname="lblCurrentVersion"
					text="Version" suffix=":" />
				<asp:Label ID="lblCurrentVersion" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn:label id="plCurrentWorkflowInUse" runat="server" controlname="lblCurrentWorkflowInUse"
					text="Workflow in Use" suffix=":" />
				<asp:Label ID="lblCurrentWorkflowInUse" runat="server" />
			</div>
			<div class="dnnFormItem" id="divCurrentWorkflowState" runat="server">
				<dnn:label id="plCurrentWorkflowState" runat="server" controlname="lblCurrentWorkflowState"
					text="Workflow State" suffix=":" />
				<asp:Label ID="lblCurrentWorkflowState" runat="server" />
			</div>
			<div id="dnnPanel-Summary">
				<h2 class="dnnFormSectionHead">
					<a href="">
						<%=LocalizeString("dshSummary")%></a></h2>
				<fieldset>
					<div class="dnnFormMessage dnnFormInfo summaryHelp">
						<%=LocalizeString("SummaryHelp")%></div>
					<div class="dnnFormItem">
						<dnn:texteditor id="txtSummary" runat="server" height="300" width="100%">
						</dnn:texteditor>
					</div>
				</fieldset>
			</div>
			<h2 id="dnnPanel-Content" class="dnnFormSectionHead">
				<a href="">
					<%=LocalizeString("dshMainContent")%></a></h2>
			<fieldset>
				<div class="dnnFormItem">
					<dnn:texteditor id="txtContent" runat="server" height="400" width="100%">
					</dnn:texteditor>
				</div>
			</fieldset>
			<div class="dnnFormItem" id="divSubmittedContent" runat="server">
				<div class="html_preview" runat="server">
					<asp:Literal ID="litCurrentContentPreview" runat="server" /></div>
			</div>
			<div class="dnnFormItem" id="divLockStatus" runat="server">
				<dnn:label id="plCurrentLockStatus" runat="server" controlname="lblCurrentLockStatus"
					text="Lock Status" suffix=":" />
				<asp:Label ID="lblCurrentLockStatus" runat="server" />
			</div>
			<div class="dnnFormItem" id="divPublish" runat="server">
				<dnn:label id="plActionOnSave" runat="server" text="On Save" suffix="?" />
				<div class="dnnPublish">
					<asp:CheckBox ID="chkPublish" runat="server" resourcekey="chkPublish" AutoPostBack="true"
						TextAlign="Left" />
					<asp:CheckBox ID="chkLock" runat="server" resourcekey="chkLock" TextAlign="Left" />
					<asp:Label ID="lblLockTransfer" runat="server" resourcekey="lblLockTransfer" Visible="false" />
				</div>
			</div>
			<ul class="dnnActions dnnClear">
				<li>
					<asp:LinkButton ID="cmdSave" runat="server" class="dnnPrimaryAction" resourcekey="cmdSave" /></li>
				<li>
					<asp:LinkButton ID="cmdPreview" runat="server" class="dnnSecondaryAction" resourcekey="cmdPreview" /></li>
				<li>
					<asp:HyperLink ID="lnkCancel" runat="server" class="dnnSecondaryAction" resourcekey="cmdCancel" /></li>
			</ul>
		</div>
		<%if (ShowMasterContent)
	{ %>
		<div class="ehccContent dnnClear" id="masterContent">
			<div class="ehmContent dnnClear" id="ehmContent">
				<div class="html_preview">
					<asp:PlaceHolder ID="placeMasterContent" runat="server" />
				</div>
			</div>
		</div>
		<% } %>
		<div class="ehccContent dnnClear" id="versions">
			<asp:Panel ID="ItemHistoryPanel" runat="server">
				<h2 id="dnnSitePanelEditHTMLHistory" class="dnnFormSectionHead" runat="server">
					<a href="">
						<%=LocalizeString("dshHistory")%></a></h2>
				<fieldset id="fsEditHtmlHistory" runat="server">
					<dnnweb:DnnGrid ID="grdLog" runat="server" AutoGenerateColumns="false">
						<MasterTableView>
							<Columns>
								<dnnweb:DnnGridBoundColumn HeaderText="Date" DataField="CreatedOnDate" />
								<dnnweb:DnnGridBoundColumn HeaderText="User" DataField="DisplayName" />
								<dnnweb:DnnGridBoundColumn HeaderText="State" DataField="StateName" />
								<dnnweb:DnnGridBoundColumn HeaderText="Approved" DataField="Approved" />
								<dnnweb:DnnGridBoundColumn HeaderText="Comment" DataField="Comment" />
							</Columns>
							<NoRecordsTemplate>
								<asp:Label ID="lblNoLogs" runat="server" resourcekey="NoHistory" />
							</NoRecordsTemplate>
						</MasterTableView>
					</dnnweb:DnnGrid>
				</fieldset>
			</asp:Panel>
			<h2 id="dnnVersions" class="dnnFormSectionHead" runat="server">
				<a href="">
					<%=LocalizeString("dshVersions")%></a></h2>
			<fieldset>
				<div class="dnnFormItem">
					<dnn:label id="plMaxVersions" runat="server" controlname="lblMaxVersions" suffix=":" />
					<asp:Label ID="lblMaxVersions" runat="server" />
				</div>
				<dnnweb:DnnGrid ID="grdVersions" runat="server" AutoGenerateColumns="false" AllowPaging="True"
					PageSize="5">
					<PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
					<MasterTableView HorizontalAlign="Left">
						<Columns>
							<dnnweb:DnnGridBoundColumn HeaderText="Version" DataField="Version" />
							<dnnweb:DnnGridBoundColumn HeaderText="Date" DataField="LastModifiedOnDate" />
							<dnnweb:DnnGridBoundColumn HeaderText="User" DataField="DisplayName" />
							<dnnweb:DnnGridBoundColumn HeaderText="State" DataField="StateName" />
							<dnnweb:DnnGridTemplateColumn>
								<HeaderTemplate>
									<table cellpadding="0" class="DnnGridNestedTable">
										<tr>
											<td>
												<dnnweb:DnnImage ID="imgDelete" runat="server" IconKey="ActionDelete" resourcekey="VersionsRemove" />
											</td>
											<td>
												<dnnweb:DnnImage ID="imgPreview" runat="server" IconKey="View" resourcekey="VersionsPreview" />
											</td>
											<td>
												<dnnweb:DnnImage ID="imgRollback" runat="server" IconKey="Restore" resourcekey="VersionsRollback" />
											</td>
										</tr>
									</table>
								</HeaderTemplate>
								<ItemTemplate>
									<table cellpadding="0" class="DnnGridNestedTable">
										<tr style="vertical-align: top;">
											<td>
												<dnnweb:DnnImageButton ID="btnRemove" runat="server" CommandName="Remove" IconKey="ActionDelete"
													Text="Delete" resourcekey="VersionsRemove" />
											</td>
											<td>
												<dnnweb:DnnImageButton ID="btnPreview" runat="server" CommandName="Preview" IconKey="View"
													Text="Preview" resourcekey="VersionsPreview" CssClass="VersionPreview" />
											</td>
											<td>
												<dnnweb:DnnImageButton ID="btnRollback" runat="server" CommandName="RollBack" IconKey="Restore"
													Text="Rollback" resourcekey="VersionsRollback" />
											</td>
										</tr>
									</table>
								</ItemTemplate>
							</dnnweb:DnnGridTemplateColumn>
						</Columns>
						<NoRecordsTemplate>
							<asp:Label ID="lblNoVersions" runat="server" resourcekey="NoVersions" />
						</NoRecordsTemplate>
					</MasterTableView>
				</dnnweb:DnnGrid>
				<div class="dnnForm dnnClear previewC">
					<ul class="dnnActions dnnClear">
						<li>
							<asp:LinkButton ID="cmdPreviewCurrent" runat="server" class="dnnPrimaryAction" resourcekey="cmdPreviewCurrent" /></li>
					</ul>
				</div>
			</fieldset>
			<h2 id="dnnPanel-EditHtmlPreview" class="dnnFormSectionHead">
				<a href="">
					<%=LocalizeString("dshPreview")%></a></h2>
			<fieldset>
				<div class="dnnFormItem" id="divPreviewVersion" runat="server">
					<dnn:label id="plPreviewVersion" runat="server" controlname="lblPreviewVersion" suffix=":" />
					<asp:Label ID="lblPreviewVersion" runat="server" />
				</div>
				<div class="dnnFormItem" id="divPreviewWorlflow" runat="server">
					<dnn:label id="plPreviewWorkflowInUse" runat="server" controlname="lblPreviewWorkflowInUse"
						suffix=":" />
					<asp:Label ID="lblPreviewWorkflowInUse" runat="server" />
				</div>
				<div class="dnnFormItem" id="divPreviewWorlflowState" runat="server">
					<dnn:label id="plPreviewWorkflowState" runat="server" controlname="lblPreviewWorkflowState"
						suffix=":" />
					<asp:Label ID="lblPreviewWorkflowState" runat="server" />
				</div>
				<div class="html_preview" runat="server">
					<asp:Panel ID="pnlSummary" runat="server" Visible="false" CssClass="summary">
						<asp:Literal ID="litSummary" runat="server" />
						<dnnweb:DnnScriptBlock runat="server">
							<script type="text/javascript">
								(function ($) {
									$(document).ready(function () {
										var btnMore = $('<a href="#" class="toggleMore"><%=LocalizeString("More") %></a>');
										var btnSummary = $('<a href="#" class="toggleMore"><%=LocalizeString("Summary") %></a>');
										$("#<%=pnlSummary.ClientID %>").append(btnMore);
										$("#<%=pnlContent.ClientID %>").append(btnSummary);

										btnMore.click(function (e) {
											$("#<%=pnlSummary.ClientID %>").slideUp();
											$("#<%=pnlContent.ClientID %>").slideDown();
											e.preventDefault();
										});

										btnSummary.click(function (e) {
											$("#<%=pnlSummary.ClientID %>").slideDown();
											$("#<%=pnlContent.ClientID %>").slideUp();
											e.preventDefault();
										});

									});
								})(jQuery);
							</script>
						</dnnweb:DnnScriptBlock>
					</asp:Panel>
					<asp:Panel ID="pnlContent" runat="server">
						<asp:Literal ID="litPreview" runat="server" />
					</asp:Panel>
				</div>
			</fieldset>
		</div>
	</div>
	<div class="ehComment" id="ehComment" runat="server" visible="false">
		<div class="ehcContent" id="ehcContent">
			<div class="dnnFormItem">
				<asp:TextBox ID="txtComment" runat="server" TextMode="multiline" />
				<asp:RequiredFieldValidator ID="reqComment" runat="server" ControlToValidate="txtComment"
					ValidationGroup="SubmitContent" CssClass="dnnFormMessage dnnFormError" />
			</div>
			<p>
				<asp:LinkButton ID="cmdSubmitComment" runat="server" class="dnnPrimaryAction" resourcekey="cmdSubmitComment" /></p>
		</div>
	</div>
	<ul class="dnnActions dnnClear">
		<li id="liApprove" runat="server" visible="False">
			<asp:LinkButton ID="cmdApprove" runat="server" class="dnnSecondaryAction" resourcekey="cmdApprove" /></li>
		<li id="liReject" runat="server" visible="False">
			<asp:LinkButton ID="cmdReject" runat="server" class="dnnSecondaryAction" resourcekey="cmdReject" /></li>
	</ul>
</div>
<script language="javascript" type="text/javascript">
	/*globals jQuery, window, Sys */
	(function ($, Sys) {
		var callbackTab = null;
		function setupDnnEditHtml() {
			var options = {};
			if (callbackTab == null) options.selected = 0;
			$('#dnnEditHtml').dnnTabs(options).dnnPanels();

			$("#<%=cbRenderType.ClientID %>").click(function () {
				toggleSummary(this.checked);
			});

			var toggleSummary = function (show) {
				$("#dnnPanel-Summary").css("display", show ? "block" : "none");
			};

			toggleSummary($("#<%=cbRenderType.ClientID %>").attr("checked"));

			$("#<%=cmdPreview.ClientID %>, #<%=cmdPreviewCurrent.ClientID %>, input.VersionPreview").click(function () {
				callbackTab = "versions";
			});
		};

		$(document).ready(function () {
			setupDnnEditHtml();
			if (!$("#dnnPanel-Content").next().is(":visible")) {
				$("#dnnPanel-Content a").click();
			}
			Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
				setupDnnEditHtml();

				if (callbackTab !== null) {
					$(".dnnAdminTabNav").find("a[href$=" + callbackTab + "]").click();

					callbackTab = null;
				};
			});
		});
	} (jQuery, window.Sys));
</script>
