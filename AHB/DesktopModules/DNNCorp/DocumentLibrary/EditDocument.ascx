<%@ Control Language="c#" AutoEventWireup="True" Inherits="DotNetNuke.Professional.DocumentLibrary.EditDocument" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="anthem" Namespace="DotNetNuke.Professional.Anthem" Assembly="DotNetNuke.Professional.Anthem" %>
<div id="divEditDocument" style="DISPLAY: none" runat="server">
	<anthem:Panel ID="pnlDL" Runat="server" UpdateAfterCallBack="true">
		<table class="OuterTable" cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td>
					<table class="ToolbarBackgroundTop" cellspacing="0">
						<tr>
							<td class="ToolbarLeft">&nbsp;</td>
							<td width="100%">
								<asp:Label id="lblTitleFileEdition" Runat="server">File Edition</asp:Label>
								<asp:Label id="lblTitleModerate" Runat="server" cssclass="normalRed"> - Moderated</asp:Label>
                            </td>
							<td class="ToolbarRight">&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
                </td>
			</tr>
			<tr>
				<td>
                    <div class="dnnForm dnnEditDocument dnnClear" id="dnnEditDocument">
                        <div class="EditDocumentContent dnnClear">
                            <div id="exEditDocument" class="exEditDocument dnnClear">
                                <div class="exedContent dnnClear">
                                    <fieldset>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= txtDocumentName.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentName" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="DocumentNameHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <anthem:textbox id="txtDocumentName" runat="server" maxlength="256"></anthem:textbox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= cboDocumentFolder.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentFolder" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="DocumentFolderHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <anthem:dropdownlist id="cboDocumentFolder" runat="server" DataTextField="FolderName" DataValueField="FolderID"></anthem:dropdownlist>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= clbDocumentCategories.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentCategories" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="DocumentCategoriesHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <anthem:checkedlistbox id="clbDocumentCategories" style="OVERFLOW: auto" runat="server" cssclass="Normal" DataTextField="CategoryName" DataValueField="CategoryID" Height="100"></anthem:checkedlistbox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= txtDocumentDescription.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentDescription" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="DocumentDescriptionHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <anthem:TextBox id="txtDocumentDescription" Runat="server" TextMode="MultiLine" rows="10"></anthem:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label>
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentDateExpiration" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="DocumentDateExpirationHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
						                    <div style="float:left">
						                        <anthem:calendar id="calDocumentDateExpiration" runat="server"
						                            onvisiblemonthchanged="calDocumentDateExpiration_VisibleMonthChanged"
						                            onselectionchanged="calDocumentDateExpiration_SelectionChanged">
						                        </anthem:calendar>
						                    </div>
						                    <div>
						                        &nbsp;<anthem:linkbutton id="cmdClearExpirationDate" runat="server" cssclass="CommandButton" borderstyle="None" causesvalidation="false" OnClick="cmdClearExpirationDate_Click">Clear Expiration Date</anthem:linkbutton>
                                                <anthem:Label ID="lblExpirationDateCleared" runat="server" CssClass="Normal"></anthem:Label>
						                    </div>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label>
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentUploaded" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="DocumentUploadedHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <div>
                                                <asp:Label id="lblDocDateUp" Runat="server" cssclass="dgTxtS"></asp:Label><br />
                                                <asp:Label id="lblDocUsrNmUp" Runat="server" cssclass="dgTxtS"></asp:Label>&nbsp;-&nbsp; 
                                                <asp:Label id="lblDocUsrFlNmUp" Runat="server" cssclass="dgTxtS"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label>
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentModified" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="DocumentModifiedHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <div>
                                                <asp:Label ID="lblDocDateMod" runat="server" CssClass="dgTxtS"></asp:Label><br />
                                                <asp:Label ID="lblDocUsrNmMod" runat="server" CssClass="dgTxtS"></asp:Label>&nbsp;-&nbsp;
                                                <asp:Label ID="lblDocUsrFlNmMod" runat="server" CssClass="dgTxtS"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label>
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentVersions" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="DocumentVersionsHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <anthem:ImageButton id="cmdDocVerView" Runat="server" OnClick="cmdDocVerView_Click"></anthem:ImageButton>&nbsp;<anthem:ImageButton id="cmdDocVerAdd" Runat="server" OnClick="cmdDocVerAdd_Click"></anthem:ImageButton>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        <ul class="dnnActions dnnClear">
                            <li><anthem:linkbutton id="cmdUpdate" runat="server" CssClass="dnnPrimaryAction" BorderStyle="None" OnClick="cmdUpdate_Click">Update</anthem:linkbutton></li>
                            <li><anthem:linkbutton id="cmdCancel" runat="server" CssClass="dnnSecondaryAction" BorderStyle="None" CausesValidation="False" resourcekey="cmdCancel" OnClick="cmdCancel_Click">Cancel</anthem:linkbutton></li>
                            <li><anthem:linkbutton id="cmdDelete" runat="server" CssClass="dnnSecondaryAction" BorderStyle="None" CausesValidation="False" resourcekey="cmdDelete" OnClick="cmdDelete_Click">Delete</anthem:linkbutton></li>
                        </ul>
                    </div>
				</td>
			</tr>
		</table>
	</anthem:Panel>
</div>
<script language="javascript" type="text/javascript">
    function setUpDnnEditDocument() {
        jQuery('.dnnTooltip').dnnTooltip();
    }
</script>