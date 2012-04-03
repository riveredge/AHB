<%@ Control Language="c#" AutoEventWireup="True" Codebehind="EditDocumentVersion.ascx.cs" Inherits="DotNetNuke.Professional.DocumentLibrary.EditDocumentVersion" %>
<%@ Register TagPrefix="anthem" Namespace="DotNetNuke.Professional.Anthem" Assembly="DotNetNuke.Professional.Anthem" %>
<div id="divEditDocumentVersion" style="DISPLAY: none" runat="server">
    <anthem:panel id="pnlDL" Runat="server">
		<table class="OuterTable" cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td>
				    <!--start navigation toolbar -->
					<table class="ToolbarBackgroundTop" cellspacing="0">
						<tr>
							<td class="ToolbarLeft">&nbsp;</td>
							<td width="100%">
							    <!-- start toolbar content -->
								<table id="tbNav1" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
									<tr>
										<td><img src='<%=ResolveUrl("images/dgBullet.png")%>' alt="" /></td>
										<td nowrap="nowrap"><asp:label id="lblTotalRecords" Runat="server" cssclass="dgTxtS" EnableViewState="false"></asp:label></td>
										<td>&nbsp;</td>
										<td nowrap="nowrap"><asp:label id="lblRecordCount" runat="server" cssclass="dgTxtS"></asp:label></td>
										<td>&nbsp;</td>
										<td><img src='<%=ResolveUrl("images/dgBullet.png")%>' alt="" /></td>
										<td nowrap="nowrap" align="left"><asp:label id="lblPageSize" Runat="server" cssclass="dgTxtS" EnableViewState="false"></asp:label></td>
										<td>&nbsp;</td>
										<td align="left" width="100%"><anthem:dropdownlist id="cboPageSize" runat="server" autocallback="True" cssClass="dgBox" OnSelectedIndexChanged="cboPageSize_SelectedIndexChanged"></anthem:dropdownlist></td>
										<td nowrap="nowrap" align="right">
											<anthem:imagebutton id="imgFirstTop" runat="server" CssClass="CommandButton" CommandArgument="F" OnCommand="imgNavigation_Command"></anthem:imagebutton>&nbsp;
											<anthem:imagebutton id="imgPreviousTop" runat="server" CssClass="CommandButton" CommandArgument="P" OnCommand="imgNavigation_Command"></anthem:imagebutton>&nbsp;
											<anthem:dropdownlist id="cboJumpToPageTop" runat="server" autocallback="True" cssClass="dgBox" OnSelectedIndexChanged="cboJumpToPage_SelectedIndexChanged"></anthem:dropdownlist>&nbsp;
											<anthem:imagebutton id="imgNextTop" runat="server" CssClass="CommandButton" CommandArgument="N" OnCommand="imgNavigation_Command"></anthem:imagebutton>&nbsp;
											<anthem:imagebutton id="imgLastTop" runat="server" CssClass="ImageButton" CommandArgument="L" OnCommand="imgNavigation_Command"></anthem:imagebutton>&nbsp;
										</td>
									</tr>
								</table>
								<!-- end toolbar content -->
						    </td>
							<td class="ToolbarRight">&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
					<!--end navigation toolbar -->
				</td>
			</tr>
			<tr>
				<td>
					<div align="center"><asp:label id="lblDocumentGrid" Runat="server" cssclass="normal" EnableViewState="false"></asp:label></div>
					<anthem:datagrid id="dgDocument" runat="server" cssclass="dgTbl" CellPadding="2" AllowCustomPaging="True" Width="100%" PageSize="10" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" OnItemDataBound="dgDocument_ItemDataBound" OnSortCommand="dgDocument_SortCommand" OnItemCommand="dgDocument_ItemCommand">
						<headerstyle CssClass="dgRowH"></headerstyle>
						<columns>
							<asp:boundcolumn HeaderText="DocumentName" DataField="DocumentName" SortExpression="DocumentName">
								<headerstyle CssClass="dgTxtB" wrap="false"></headerstyle>
								<itemstyle CssClass="dgTxt" wrap="false"></itemstyle>
							</asp:boundcolumn>
							<asp:boundcolumn HeaderText="DocumentDescription" DataField="DocumentDescription">
								<headerstyle CssClass="dgTxtB"></headerstyle>
								<itemstyle CssClass="dgTxt" width="100%"></itemstyle>
							</asp:boundcolumn>
							<asp:boundcolumn HeaderText="DocumentSize" DataField="DocumentSizeKb" SortExpression="DocumentSize">
								<headerstyle CssClass="dgTxtB" wrap="false"></headerstyle>
								<itemstyle CssClass="dgTxt" width="1" wrap="false"></itemstyle>
							</asp:boundcolumn>
							<asp:templatecolumn HeaderText="Uploaded" SortExpression="DocumentDate_Uploaded">
								<headerstyle CssClass="dgTxtB" horizontalalign="center"></headerstyle>
								<itemstyle verticalalign="top" wrap="false" Cssclass="dgTxtS" horizontalalign="center"></itemstyle>
								<itemtemplate>
									<%# DataBinder.Eval(Container.DataItem, "DNNUserName_Uploaded") %><br />
									<%# DataBinder.Eval(Container.DataItem, "DNNUserFullName_Uploaded") %><br />
									<%# DataBinder.Eval(Container.DataItem, "DocumentDate_UploadedFormatted") %>
								</itemtemplate>
							</asp:templatecolumn>
							<asp:templatecolumn HeaderText="Modified" SortExpression="DocumentDate_Modified">
								<headerstyle CssClass="dgTxtB" horizontalalign="center"></headerstyle>
								<itemstyle verticalalign="top" wrap="false" Cssclass="dgTxtS" horizontalalign="center"></itemstyle>
								<itemtemplate>
									<%# DataBinder.Eval(Container.DataItem, "DNNUserName_Modified") %><br />
									<%# DataBinder.Eval(Container.DataItem, "DNNUserFullName_Modified") %><br />			
									<%# DataBinder.Eval(Container.DataItem, "DocumentDate_ModifiedFormatted") %>						
								</itemtemplate>
							</asp:templatecolumn>
							<asp:templatecolumn>
								<headerstyle CssClass="dgTxtB"></headerstyle>
								<itemstyle verticalalign="top" width="1"></itemstyle>
								<itemtemplate>
									<asp:ImageButton id="cmdRestore" Runat="server" EnableViewState="true" CommandName="Restore" />
								</itemtemplate>
							</asp:templatecolumn>
							<asp:templatecolumn>
								<headerstyle CssClass="dgTxtB"></headerstyle>
								<itemstyle verticalalign="top" width="1"></itemstyle>
								<itemtemplate>
									<asp:ImageButton id="cmdDestroy" Runat="server" EnableViewState="true" CommandName="Destroy" />
								</itemtemplate>
							</asp:templatecolumn>
							<asp:templatecolumn>
								<headerstyle CssClass="dgTxtB"></headerstyle>
								<itemstyle verticalalign="top" width="1"></itemstyle>
								<itemtemplate>
									<asp:HyperLink id="lnkDownload" Runat="server" EnableViewState="false"></asp:HyperLink>
								</itemtemplate>
							</asp:templatecolumn>
						</columns>
						<pagerstyle Visible="False" />
					</anthem:datagrid>
				</td>
			</tr>
			<tr>
				<td>
				    <!--start navigation toolbar -->
					<table class="ToolbarBackgroundBottom" cellspacing="0">
						<tr>
							<td class="ToolbarLeft">&nbsp;</td>
							<td width="100%">
							    <!-- start toolbar content -->
								<table id="tbNav2" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
									<tr>
										<td><img src='<%=ResolveUrl("images/dgBullet.png")%>' alt="" /></td>
										<td nowrap="nowrap" align="left" width="100%"><asp:label id="lblPageCount" runat="server" EnableViewState="false" CssClass="dgTxtS"></asp:label></td>
										<td nowrap="nowrap" align="center">
											<anthem:imagebutton id="imgFirst" runat="server" CssClass="CommandButton" CommandArgument="F" OnCommand="imgNavigation_Command"></anthem:imagebutton>&nbsp;
											<anthem:imagebutton id="imgPrevious" runat="server" CssClass="CommandButton" CommandArgument="P" OnCommand="imgNavigation_Command"></anthem:imagebutton>&nbsp;
											<anthem:dropdownlist id="cboJumpToPage" runat="server" autocallback="True" cssClass="dgBox" OnSelectedIndexChanged="cboJumpToPage_SelectedIndexChanged"></anthem:dropdownlist>&nbsp;
											<anthem:imagebutton id="imgNext" runat="server" CssClass="CommandButton" CommandArgument="N" OnCommand="imgNavigation_Command"></anthem:imagebutton>&nbsp;
											<anthem:imagebutton id="imgLast" runat="server" CssClass="ImageButton" CommandArgument="L" OnCommand="imgNavigation_Command"></anthem:imagebutton>&nbsp;
										</td>
									</tr>
								</table>
								<!-- end toolbar content --></td>
							<td class="ToolbarRight">&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
					<!--end navigation toolbar -->
				</td>
			</tr>
			<tr>
				<td align="center" height="100%">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" colspan="3"><anthem:linkbutton id="cmdCancel" runat="server" CssClass="dnnSecondaryAction" CausesValidation="False" BorderStyle="None" resourcekey="cmdCancel" OnClick="cmdCancel_Click">Cancel</anthem:linkbutton></td>
			</tr>
			<tr>
				<td align="center" height="100%">&nbsp;</td>
			</tr>
		</table>
	</anthem:panel>
</div>
