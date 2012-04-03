<%@ Control Language="c#" AutoEventWireup="True" Inherits="DotNetNuke.Professional.DocumentLibrary.DocumentLibrarySettings" Codebehind="DocumentLibrarySettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<style type="text/css">
    .nofloat input
    {
        float: none;
    }
</style>
<div class="dnnForm dnnDocumentLibrarySettings dnnClear" id="dnnDocumentLibrarySettings">
    <asp:Panel ID="pnError" runat="server" Visible="false">
        <div class="dnnFormMessage dnnFormError"><asp:label id="lblError" Runat="server"></asp:label></div>
    </asp:Panel>
    <div class="DocumentLibrarySettingsContent dnnClear">
        <div id="exDocumentLibrarySettings" class="exDocumentLibrarySettings dnnClear">
            <div class="exdlsContent dnnClear">
                <h2 id="Panel-LocalNavigationTree" class="dnnFormSectionHead"><a><%=LocalizeString("LocalNavigationTree")%></a></h2>
                <fieldset>
                    <div class="dnnFormItem">
                        <dnn:label id="plMode" runat="server" controlname="cboMode"></dnn:label>
                        <asp:dropdownlist id="cboMode" runat="server" OnSelectedIndexChanged="cboMode_SelectedIndexChanged"></asp:dropdownlist>
                    </div>
                    <div class="dnnFormItem">
                        <dnn:label id="plModeToggle" runat="server" controlname="chxModeToggle"></dnn:label>
                        <asp:checkbox id="chxModeToggle" runat="server" OnCheckedChanged="chxModeToggle_CheckedChanged"></asp:checkbox>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plRestrictFolder" runat="server" controlname="cboRestrictFolder"></dnn:label>
						<asp:dropdownlist id="cboRestrictFolder" runat="server" DataValueField="FolderID" DataTextField="FolderName"></asp:dropdownlist>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plRestrictCategory" runat="server" controlname="cboRestrictCategory"></dnn:label>
						<asp:dropdownlist id="cboRestrictCategory" runat="server" DataValueField="CategoryID" DataTextField="CategoryName"></asp:dropdownlist>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plTreeStyle" runat="server" controlname="cboTreeStyle"></dnn:label>
						<asp:dropdownlist id="cboTreeStyle" runat="server"></asp:dropdownlist>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plHideTree" runat="server" controlname="chxHideTree"></dnn:label>
						<asp:checkbox id="chxHideTree" runat="server" AutoPostBack="True" OnCheckedChanged="chxHideTree_CheckedChanged"></asp:checkbox>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plHorizontalScroll" runat="server" controlname="chxHorizontalScroll"></dnn:label>
						<asp:checkbox id="chxHorizontalScroll" runat="server"></asp:checkbox>
                    </div>
                </fieldset>
                <h2 id="Panel-LocalDocumentGrid" class="dnnFormSectionHead"><a><%=LocalizeString("LocalDocumentGrid")%></a></h2>
                <fieldset>
                    <div class="dnnFormItem">
						<dnn:label id="plDisplayNavigation" runat="server" controlname="chxDisplayNavigation"></dnn:label>
						<asp:checkbox id="chxDisplayNavigation" runat="server"></asp:checkbox>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plItemsPerPage" runat="server" controlname="cboItemsPerPage"></dnn:label>
						<asp:dropdownlist id="cboItemsPerPage" runat="server"></asp:dropdownlist>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plGridLayout" runat="server" controlname="ddlGridLayout"></dnn:label>
						<asp:dropdownlist id="ddlGridLayout" Runat="server" DataValueField="name" DataTextField="displayName"></asp:dropdownlist>
                    </div>
                    <div class="dnnFormItem">
                        <dnn:label id="plThumbnailBackColor" runat="server" controlname="txtThumbnailBackColor"></dnn:label>
                        <asp:TextBox ID="txtThumbnailBackColor" runat="server" MaxLength="7"></asp:TextBox>
                    </div>
                    <div class="dnnFormItem">
						<table cellspacing="2" cellpadding="2" width="1" border="0" class="nofloat">
							<tr>
								<td>&nbsp;</td>
								<td colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td >&nbsp;</td>
								<td style="border-left:1px solid;" nowrap="nowrap" colspan="2">
									<center><b><asp:label id="lblSortBy" resourcekey="lblSortBy" Runat="server"></asp:label></b></center>
								</td>
								<td style="border-left:1px solid;">&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td nowrap="nowrap"><b><asp:label id="lblDisplay" resourcekey="lblDisplay" Runat="server"></asp:label></b></td>
								<td style="border-left:1px solid;" nowrap="nowrap"><b><asp:label id="lblSortByAsc" resourcekey="lblSortByAsc" Runat="server"></asp:label></b></td>
								<td nowrap="nowrap"><b><asp:label id="lblSortByDesc" resourcekey="lblSortByDesc" Runat="server"></asp:label></b></td>
								<td style="border-left:1px solid;" nowrap="nowrap"><b><asp:label id="lblDisplayLength" resourcekey="lblDisplayLength" Runat="server"></asp:label></b></td>
							</tr>
							<tr>
								<td nowrap="nowrap"><dnn:label id="plDisplayDocumentName" runat="server" controlname="chxDisplayDocumentDescription"></dnn:label></td>
								<td align="center"><input disabled="disabled" type="checkbox" checked="checked"></td>
								<td style="border-left:1px solid;" align="center"><input id="rdoSortByDocumentNameAsc" type="radio" name="rdoSortBy" runat="server" value="rdoSortByDocumentNameAsc" /></td>
								<td style="border-left:1px solid;" align="center"><input id="rdoSortByDocumentNameDesc" type="radio" name="rdoSortBy" runat="server" value="rdoSortByDocumentNameDesc" /></td>
								<td style="border-left:1px solid;" width="100%"><asp:textbox id="txtDisplayLength" Runat="server" Width="116px"></asp:textbox></td>
							</tr>
							<tr>
								<td nowrap="nowrap"><dnn:label id="plDisplayDocumentIcon" runat="server" controlname="chxDisplayDocumentIcon"></dnn:label></td>
								<td align="center"><asp:checkbox id="chxDisplayDocumentIcon" runat="server"></asp:checkbox></td>
								<td style="border-left:1px solid;" align="center"><input disabled="disabled" type="radio" /></td>
								<td style="border-left:1px solid;" align="center"><input disabled="disabled" type="radio" /></td>
								<td style="border-left:1px solid;">&nbsp;</td>
							</tr>
							<tr>
								<td nowrap="nowrap"><dnn:label id="plDisplayDocumentDescription" runat="server" controlname="chxDisplayDocumentDescription"></dnn:label></td>
								<td align="center"><asp:checkbox id="chxDisplayDocumentDescription" runat="server"></asp:checkbox></td>
								<td style="border-left:1px solid;" align="center"><input disabled="disabled" type="radio" /></td>
								<td style="border-left:1px solid;" align="center"><input disabled="disabled" type="radio" /></td>
								<td style="border-left:1px solid;">&nbsp;</td>
							</tr>
							<tr>
								<td nowrap="nowrap"><dnn:label id="plDisplayDocumentSize" runat="server" controlname="chxDisplayDocumentSize"></dnn:label></td>
								<td align="center"><asp:checkbox id="chxDisplayDocumentSize" runat="server"></asp:checkbox></td>
								<td style="border-left:1px solid;" align="center"><input id="rdoSortByDocumentSizeAsc" type="radio" name="rdoSortBy" runat="server" value="rdoSortByDocumentSizeAsc" /></td>
								<td style="border-left:1px solid;" align="center"><input id="rdoSortByDocumentSizeDesc" type="radio" name="rdoSortBy" runat="server" value="rdoSortByDocumentSizeDesc" /></td>
								<td style="border-left:1px solid;">&nbsp;</td>
							</tr>
							<tr>
								<td nowrap="nowrap"><dnn:label id="plDisplayDocumentUploaded" runat="server" controlname="chxDisplayDocumentUploaded"></dnn:label></td>
								<td align="center"><asp:checkbox id="chxDisplayDocumentUploaded" runat="server"></asp:checkbox></td>
								<td style="border-left:1px solid;" align="center"><input id="rdoSortByDocumentUploadedAsc" type="radio" name="rdoSortBy" runat="server" value="rdoSortByDocumentUploadedAsc" /></td>
								<td style="border-left:1px solid;" align="center"><input id="rdoSortByDocumentUploadedDesc" type="radio" name="rdoSortBy" runat="server" value="rdoSortByDocumentUploadedDesc" /></td>
								<td style="border-left:1px solid;">&nbsp;</td>
							</tr>
							<tr>
								<td nowrap="nowrap"><dnn:label id="plDisplayDocumentModified" runat="server" controlname="chxDisplayDocumentModified"></dnn:label></td>
								<td align="center"><asp:checkbox id="chxDisplayDocumentModified" runat="server"></asp:checkbox></td>
								<td style="border-left:1px solid;" align="center"><input id="rdoSortByDocumentModifiedAsc" type="radio" name="rdoSortBy" runat="server" value="rdoSortByDocumentModifiedAsc" /></td>
								<td style="border-left:1px solid;" align="center"><input id="rdoSortByDocumentModifiedDesc" type="radio" name="rdoSortBy" runat="server" value="rdoSortByDocumentModifiedDesc" /></td>
								<td style="border-left:1px solid;">&nbsp;</td>
							</tr>
						</table>
                    </div>
                </fieldset>
                <h2 id="Panel-GlobalFileSystem" class="dnnFormSectionHead"><a><%=LocalizeString("GlobalFileSystem")%></a></h2>
                <fieldset>
                    <div class="dnnFormItem">
						<dnn:label id="plRootFolderSync" runat="server" controlname="cmdRootFolderSync"></dnn:label>
						<asp:imagebutton id="cmdRootFolderSync" Runat="server" CausesValidation="false" OnClick="cmdRootFolderSync_Click" style="padding:0px;"></asp:imagebutton>&nbsp;
						<asp:hyperlink id="lnkRootFolderSyncLog" resourcekey="cmdRootFolderSyncLog" Runat="server"></asp:hyperlink>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plRootFolder" runat="server" controlname="cboRootFolder"></dnn:label>
                        <table cellspacing="0" cellpadding="1" border="0">
							<tr>
								<td colspan="2" nowrap="nowrap"><asp:radiobuttonlist id="rdoRootFolderMode" Runat="server" AutoPostBack="true" RepeatDirection="Horizontal" CellSpacing="0" CellPadding="0" OnSelectedIndexChanged="rdoRootFolderMode_SelectedIndexChanged"></asp:radiobuttonlist></td>
							</tr>
							<tr>
								<td><asp:dropdownlist id="cboRootFolder" runat="server" Width="300" AutoPostBack="true" OnSelectedIndexChanged="cboRootFolder_SelectedIndexChanged"></asp:dropdownlist><asp:textbox id="txtRootFolder" Runat="server" Width="300"></asp:textbox></td>
								<td valign="top" width="1"><asp:imagebutton id="cmdRootFolderEnable" resourcekey="cmdRootFolderEnable" Runat="server" CausesValidation="false" OnClick="cmdRootFolderEnable_Click"></asp:imagebutton></td>
							</tr>
						</table>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plSecureFiles" runat="server" controlname="chxSecureFiles"></dnn:label>
						<asp:checkbox id="chxSecureFiles" runat="server"></asp:checkbox>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plBigUploads" runat="server" controlname="chxBigUploads"></dnn:label>
						<asp:checkbox id="chxBigUploads" runat="server"></asp:checkbox>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plEnableWebDav" runat="server" controlname="chxEnableWebDav"></dnn:label>
						<asp:checkbox id="chxEnableWebDav" runat="server"></asp:checkbox>&nbsp;
						<asp:ImageButton id="cmdEnableWebDavCheck" resourcekey="cmdEnableWebDavCheck" Runat="server" CausesValidation="false" ImageAlign="Baseline" OnClick="cmdEnableWebDavCheck_Click"></asp:ImageButton>
						<asp:Label cssclass="normal" ID="lblEnableWebDavCheck" Runat="server" EnableViewState="false" Visible="false"></asp:Label>
                    </div>
                </fieldset>
                <h2 id="Panel-GlobalDocument" class="dnnFormSectionHead"><a><%=LocalizeString("GlobalDocument")%></a></h2>
                <fieldset>
                    <div class="dnnFormItem">
						<dnn:label id="plAllowedExtensionsAdd" runat="server" controlname="txtAllowedExtensionsAdd"></dnn:label>
                        <table cellspacing="0" cellpadding="1" border="0">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="rblExtensions" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblExtensions_SelectedIndexChanged" CssClass="dlRadioButtonList">
                                        <asp:ListItem Value="All" resourcekey="rblExtensionsAll" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="Selected" resourcekey="rblExtensionsSelected"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <br />
                                    <asp:Panel ID="pnAllowedExtensions" runat="server" Enabled="false">
		                                <table cellspacing="0" cellpadding="1" border="0">
                                            <tr>
                                                <td><asp:Label ID="lbExtensionsDisabled" runat="server" resourcekey="lbExtensionsDisabled"></asp:Label></td>
                                                <td></td>
                                                <td><asp:Label ID="lbExtensionsEnabled" runat="server" resourcekey="lbExtensionsEnabled"></asp:Label></td>
                                            </tr>
				                            <tr>
                                                <td valign="top"><asp:ListBox ID="lstDisabledExtensionsList" CssClass="NormalTextBox" runat="server" Width="130" Rows="10" SelectionMode="Multiple"></asp:ListBox></td>
                                                <td align="center">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td width="20" align="center" style="height:20px"><asp:ImageButton ID="btnExtensionsAllowAll" runat="server" resourcekey="btnExtensionsAllowAll.Tooltip" OnClick="btnExtensionsMove_Click" CommandName="AllowAll" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="20" align="center" style="height:20px"><asp:ImageButton ID="btnExtensionsAllowSelected" runat="server" resourcekey="btnExtensionsAllowSelected.Tooltip" OnClick="btnExtensionsMove_Click" CommandName="AllowSelected" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="20" align="center" style="height:20px"><asp:ImageButton ID="btnExtensionsBlockSelected" runat="server" resourcekey="btnExtensionsBlockSelected.Tooltip" OnClick="btnExtensionsMove_Click" CommandName="BlockSelected" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="20" align="center" style="height:20px"><asp:ImageButton ID="btnExtensionsBlockAll" runat="server" resourcekey="btnExtensionsBlockAll.Tooltip" OnClick="btnExtensionsMove_Click" CommandName="BlockAll" /></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
									            <td valign="top"><asp:listbox id="lstAllowedExtensionsList" CssClass="NormalTextBox" Runat="server" Width="130" Rows="10" SelectionMode="Multiple"></asp:listbox></td>
								            </tr>
							            </table>
                                        <br />
                                        <asp:Label ID="lblAllowedExtensionsMessage" runat="server" CssClass="NormalRed" EnableViewState="false"></asp:Label>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plConfirmDownload" runat="server" controlname="chxConfirmDownload"></dnn:label>
						<asp:checkbox id="chxConfirmDownload" runat="server"></asp:checkbox>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plDisplayMedia" runat="server" controlname="chxDisplayMedia"></dnn:label>
						<asp:checkbox id="chxDisplayMedia" runat="server" />
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plBoxSize" runat="server" controlname="ddlBoxSize"></dnn:label>
						<asp:dropdownlist id="ddlBoxSize" runat="server"></asp:dropdownlist>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plVersioningEnabled" runat="server" controlname="chxVersioningEnabled"></dnn:label>
						<asp:checkbox id="chxVersioningEnabled" runat="server" AutoPostBack="true" OnCheckedChanged="chxVersioningEnabled_CheckedChanged"></asp:checkbox>
                    </div>
                    <div class="dnnFormItem">
					    <dnn:label id="plVersioningMaxNumber" runat="server" controlname="txtVersioningMaxNumber"></dnn:label>
					    <asp:textbox id="txtVersioningMaxNumber" Runat="server"></asp:textbox>
                    </div>
                    <div class="dnnFormItem">
						<dnn:label id="plDNNSearchEnabled" runat="server" controlname="chxDNNSearchEnabled"></dnn:label>
						<asp:checkbox id="chxDNNSearchEnabled" runat="server"></asp:checkbox>
                    </div>
                </fieldset>
                <h2 id="Panel-GlobalStatistics" class="dnnFormSectionHead"><a><%=LocalizeString("GlobalStatistics")%></a></h2>
                <fieldset>
                    <div class="dnnFormItem">
						<dnn:label id="plStatsLogDays" runat="server" controlname="txtStatsLogDays"></dnn:label>
						<asp:textbox id="txtStatsLogDays" Runat="server"></asp:textbox>
                    </div>
                </fieldset>
                <h2 id="Panel-GlobalModule" class="dnnFormSectionHead"><a><%=LocalizeString("GlobalModule")%></a></h2>
                <fieldset>
                    <div class="dnnFormItem">
						<dnn:label id="plModuleStyle" runat="server" controlname="ddlModuleStyle"></dnn:label>
						<asp:dropdownlist id="ddlModuleStyle" Runat="server" DataValueField="name" DataTextField="displayName"></asp:dropdownlist>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>
