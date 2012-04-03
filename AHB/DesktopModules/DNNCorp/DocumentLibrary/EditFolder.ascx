<%@ Control Language="c#" AutoEventWireup="True" Inherits="DotNetNuke.Professional.DocumentLibrary.EditFolder" Codebehind="EditFolder.ascx.cs" %>
<%@ Register TagPrefix="anthem" Namespace="DotNetNuke.Professional.Anthem" Assembly="DotNetNuke.Professional.Anthem" %>
<div id="divEditFolder" style="display: none" runat="server">
    <anthem:panel id="pnlDL" Runat="server">
        <table class="OuterTable" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <table class="ToolbarBackgroundTop" cellspacing="0">
                        <tr>
                            <td class="ToolbarLeft">&nbsp;</td>
                            <td width="100%">
                                <asp:label id="lblTitle" runat="server">Folder</asp:label>
                            </td>
                            <td class="ToolbarRight">&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                    </table>
		        </td>
		    </tr>
            <tr>
                <td>
                    <div class="dnnForm dnnEditFolder dnnClear" id="dnnEditFolder">
                        <div class="EditFolderContent dnnClear">
                            <div id="exEditFolder" class="exEditFolder dnnClear">
                                <div class="exefContent dnnClear">
                                    <h2 id="Panel-GeneralSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><asp:Literal ID="FolderGeneralSettings" runat="server" /></a></h2>
                                    <fieldset>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= txtFolderName.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="FolderName" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="FolderNameHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <asp:textbox id="txtFolderName" runat="server" maxlength="256"></asp:textbox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= cboFolderParent.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="FolderParent" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="FolderParentHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <asp:dropdownlist id="cboFolderParent" runat="server" DataValueField="FolderID" DataTextField="FolderName"></asp:dropdownlist>
                                        </div>
                                    </fieldset>
                                    <h2 id="Panel-DirectViewSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><asp:literal ID="FolderDirectViewSettings" runat="server" /></a></h2>
                                    <fieldset>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= chxFolderDirectView.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="FolderDirectView" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="FolderDirectViewHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <asp:checkbox id="chxFolderDirectView" Runat="server" EnableViewState="false"></asp:checkbox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= txtFolderDirectKey.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="FolderDirectKey" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="FolderDirectKeyHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <asp:textbox id="txtFolderDirectKey" Runat="server" EnableViewState="false"></asp:textbox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= txtFolderDirectUrl.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="FolderDirectUrl" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="FolderDirectUrlHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <asp:TextBox ID="txtFolderDirectUrl" runat="server" EnableViewState="false"></asp:TextBox>
                                        </div>
                                    </fieldset>
                                    <asp:Panel ID="pnSecuritySettings" runat="server">
                                        <h2 id="Panel-SecuritySettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><asp:literal ID="FolderSecuritySettings" runat="server" /></a></h2>
                                        <fieldset>
                                            <div class="dnnFormItem">
                                                <div class="dnnTooltip">
                                                    <label for="<%= chxSecurityInherit.ClientID %>">
                                                        <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="SecurityInherit" runat="server"></asp:Label></a>
                                                    </label>
                                                    <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                        <asp:Label ID="SecurityInheritHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                        <a href="#" class="pinHelp"></a>
	                                                </div>
                                                </div>
                                                <asp:checkbox id="chxSecurityInherit" Runat="server" EnableViewState="false"></asp:checkbox>
                                            </div>
                                            <div class="dnnFormItem">
                                                <div class="dnnTooltip">
                                                    <label>
                                                        <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="RoleSecurity" runat="server"></asp:Label></a>
                                                    </label>
                                                    <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                        <asp:Label ID="RoleSecurityHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                        <a href="#" class="pinHelp"></a>
	                                                </div>
                                                </div>
                                                <asp:panel id="pnlSecurity" Runat="server">
                                                    <asp:repeater id="repSecurity" runat="server" OnItemDataBound="repSecurity_ItemDataBound">
										                <HeaderTemplate>
											                <table border="0" bgcolor="ghostwhite" id="tbSecurity">
												                <tr class="dgRowH">
													                <td class="OuterTable">&nbsp;</td>
													                <td colspan="7"><asp:Label EnableViewState="false" ID="lblFolder" cssclass="dgTxtB" Runat="server">Folder</asp:Label></td>
													                <td colspan="3"><asp:Label EnableViewState="false" ID="lblDocument" cssclass="dgTxtB" Runat="server">Document</asp:Label></td>
												                </tr>
												                <tr class="dgRowH">
													                <td width="100%"><asp:Label EnableViewState="false" ID="lblRole" cssclass="dgTxtB" Runat="server">Role</asp:Label></td>
													                <td><asp:Label EnableViewState="false" ID="lblView" cssclass="dgTxtB" Runat="server">View</asp:Label></td>
													                <td><asp:Label EnableViewState="false" ID="lblAdd" cssclass="dgTxtB" Runat="server">Add</asp:Label></td>
													                <td><asp:Label EnableViewState="false" ID="lblEdit" cssclass="dgTxtB" Runat="server">Edit</asp:Label></td>
													                <td><asp:Label EnableViewState="false" ID="lblDelete" cssclass="dgTxtB" Runat="server">Delete</asp:Label></td>
													                <td><asp:Label EnableViewState="false" ID="lblTrack" cssclass="dgTxtB" Runat="server">Track</asp:Label></td>
													                <td><asp:Label EnableViewState="false" ID="lblModerate" cssclass="dgTxtB" Runat="server">Moderate</asp:Label></td>
													                <td><asp:Label EnableViewState="false" ID="lblChangeSecurity" cssclass="dgTxtB" Runat="server">Change Security</asp:Label></td>
													                <td><asp:Label EnableViewState="false" ID="lblAddDoc" cssclass="dgTxtB" Runat="server">Add</asp:Label></td>
													                <td><asp:Label EnableViewState="false" ID="lblEditDoc" cssclass="dgTxtB" Runat="server">Edit</asp:Label></td>
													                <td><asp:Label EnableViewState="false" ID="lblTrackDoc" cssclass="dgTxtB" Runat="server">Track</asp:Label></td>
												                </tr>
										                </HeaderTemplate>
										                <ItemTemplate>
												                <tr>
													                <td>
														                <input type="hidden" id="hidDNNRoleName" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "DNNRoleName")%>' name="hidDNNRoleName"/>
														                <span class="dgTxt"><%# DataBinder.Eval(Container.DataItem, "DNNRoleName") %></span>
													                </td>
													                <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxView" Checked='<%# DataBinder.Eval(Container.DataItem, "View")%>'></asp:CheckBox></td>
													                <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxAdd" Checked='<%# DataBinder.Eval(Container.DataItem, "Add")%>'></asp:CheckBox></td>
													                <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxEdit" Checked='<%# DataBinder.Eval(Container.DataItem, "Edit")%>'></asp:CheckBox></td>
													                <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxDelete" Checked='<%# DataBinder.Eval(Container.DataItem, "Delete")%>'></asp:CheckBox></td>
													                <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxTrack" Checked='<%# DataBinder.Eval(Container.DataItem, "Track")%>'></asp:CheckBox></td>
													                <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxModerate" Checked='<%# DataBinder.Eval(Container.DataItem, "Moderate")%>'></asp:CheckBox></td>
													                <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxChangeSecurity" Checked='<%# DataBinder.Eval(Container.DataItem, "ChangeSecurity")%>'></asp:CheckBox></td>
													                <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxAddDoc" Checked='<%# DataBinder.Eval(Container.DataItem, "AddDoc")%>'></asp:CheckBox></td>
													                <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxEditDoc" Checked='<%# DataBinder.Eval(Container.DataItem, "EditDoc")%>'></asp:CheckBox></td>
													                <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxTrackDoc" Checked='<%# DataBinder.Eval(Container.DataItem, "TrackDoc")%>'></asp:CheckBox></td>
												                </tr>
										                </ItemTemplate>
										                <FooterTemplate>
								                            </table>
						                                </FooterTemplate>
						                            </asp:repeater>
						                        </asp:panel>
                                            </div>
                                            <div class="dnnFormItem">
                                                <div class="dnnTooltip">
                                                    <label>
                                                        <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="SecurityUser" runat="server"></asp:Label></a>
                                                    </label>
                                                    <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                        <asp:Label ID="SecurityUserHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                        <a href="#" class="pinHelp"></a>
	                                                </div>
                                                </div>
                                                <table cellspacing="0" cellpadding="0" border="0">
                                                    <tr>
                                                        <td><asp:label id="lblSecurityUserEdit" Runat="server" resourcekey="lblSecurityUserEdit" EnableViewState="false" CssClass="Normal"></asp:label><asp:textbox id=txtSecurityUser runat="server" EnableViewState="false" cssclass="Box100"></asp:textbox></td>
                                                        <td><a id="cmdSecurityUser" runat="server"><img id="imgSecurityUser" align="absMiddle" border="0" runat="server"></a> </td>
                                                        <td><anthem:imagebutton id="cmdAddUser" runat="server" ImageAlign="absMiddle" border="0" OnClick="cmdAddUser_Click"></anthem:imagebutton></td>
                                                    </tr>
                                                </table>
                                                <asp:panel id="pnlSecurityUser" Runat="server" style="float:right;width:68%;">
                                                    <anthem:repeater id="repSecurityUser" runat="server" OnItemDataBound="repSecurityUser_ItemDataBound" OnItemCommand="repSecurityUser_ItemCommand">
								                        <HeaderTemplate>
									                        <table border="0" bgcolor="ghostwhite" id="tbSecurityUser">
										                        <tr class="dgRowH">
											                        <td class="OuterTable">&nbsp;</td>
											                        <td colspan="7"><asp:Label EnableViewState="false" ID="lblFolderU" cssclass="dgTxtB" Runat="server">Folder</asp:Label></td>
											                        <td colspan="3"><asp:Label EnableViewState="false" ID="lblDocumentU" cssclass="dgTxtB" Runat="server">Document</asp:Label></td>
											                        <td>&nbsp;</td>
										                        </tr>
										                        <tr class="dgRowH">
											                        <td width="100%"><asp:Label EnableViewState="false" ID="lblUser" cssclass="dgTxtB" Runat="server">User</asp:Label></td>
											                        <td><asp:Label EnableViewState="false" ID="lblViewU" cssclass="dgTxtB" Runat="server">View</asp:Label></td>
											                        <td><asp:Label EnableViewState="false" ID="lblAddU" cssclass="dgTxtB" Runat="server">Add</asp:Label></td>
											                        <td><asp:Label EnableViewState="false" ID="lblEditU" cssclass="dgTxtB" Runat="server">Edit</asp:Label></td>
											                        <td><asp:Label EnableViewState="false" ID="lblDeleteU" cssclass="dgTxtB" Runat="server">Delete</asp:Label></td>
											                        <td><asp:Label EnableViewState="false" ID="lblTrackU" cssclass="dgTxtB" Runat="server">Track</asp:Label></td>
											                        <td><asp:Label EnableViewState="false" ID="lblModerateU" cssclass="dgTxtB" Runat="server">Moderate</asp:Label></td>
											                        <td><asp:Label EnableViewState="false" ID="lblChangeSecurityU" cssclass="dgTxtB" Runat="server">Change Security</asp:Label></td>
											                        <td><asp:Label EnableViewState="false" ID="lblAddDocU" cssclass="dgTxtB" Runat="server">Add</asp:Label></td>
											                        <td><asp:Label EnableViewState="false" ID="lblEditDocU" cssclass="dgTxtB" Runat="server">Edit</asp:Label></td>
											                        <td><asp:Label EnableViewState="false" ID="lblTrackDocU" cssclass="dgTxtB" Runat="server">Track</asp:Label></td>
											                        <td>&nbsp;</td>
										                        </tr>
								                        </HeaderTemplate>
								                        <ItemTemplate>
									                            <tr>
										                            <td>
											                            <input type="hidden" id="hidDNNUserId" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "DNNUserId")%>' NAME="hidDNNUserId"/>
											                            <input type="hidden" id="hidDNNUserName" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "DNNUserName")%>' NAME="hidDNNUserName"/>
											                            <span class="dgTxt"><%# DataBinder.Eval(Container.DataItem, "DNNUserName") %></span>
										                            </td>
										                            <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxViewU" Checked='<%# DataBinder.Eval(Container.DataItem, "View")%>'></asp:CheckBox></td>
										                            <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxAddU" Checked='<%# DataBinder.Eval(Container.DataItem, "Add")%>'></asp:CheckBox></td>
										                            <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxEditU" Checked='<%# DataBinder.Eval(Container.DataItem, "Edit")%>'></asp:CheckBox></td>
										                            <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxDeleteU" Checked='<%# DataBinder.Eval(Container.DataItem, "Delete")%>'></asp:CheckBox></td>
										                            <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxTrackU" Checked='<%# DataBinder.Eval(Container.DataItem, "Track")%>'></asp:CheckBox></td>
										                            <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxModerateU" Checked='<%# DataBinder.Eval(Container.DataItem, "Moderate")%>'></asp:CheckBox></td>
										                            <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxChangeSecurityU" Checked='<%# DataBinder.Eval(Container.DataItem, "ChangeSecurity")%>'></asp:CheckBox></td>
										                            <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxAddDocU" Checked='<%# DataBinder.Eval(Container.DataItem, "AddDoc")%>'></asp:CheckBox></td>
										                            <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxEditDocU" Checked='<%# DataBinder.Eval(Container.DataItem, "EditDoc")%>'></asp:CheckBox></td>
										                            <td align="center" valign="top"><asp:CheckBox EnableViewState="false" Runat="server" cssclass="dgTxt" ID="chxTrackDocU" Checked='<%# DataBinder.Eval(Container.DataItem, "TrackDoc")%>'></asp:CheckBox></td>
										                            <td valign="top"><asp:imagebutton id="cmdDeleteUser" runat="server" border="0" ImageAlign="absMiddle" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "DNNUserId")%>' CommandName="Delete"></asp:imagebutton></td>
									                            </tr>
								                        </ItemTemplate>
								                        <FooterTemplate>
								                            </table>
						                                </FooterTemplate>
						                            </anthem:repeater>
						                        </asp:panel>
                                            </div>
                                        </fieldset>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <ul class="dnnActions dnnClear">
                            <li><anthem:linkbutton id="cmdUpdate" runat="server" resourcekey="cmdUpdate" CssClass="dnnPrimaryAction" BorderStyle="None" OnClick="cmdUpdate_Click">Update</anthem:linkbutton></li>
                            <li><anthem:linkbutton id="cmdCancel" runat="server" resourcekey="cmdCancel" CssClass="dnnSecondaryAction" BorderStyle="None" CausesValidation="False" OnClick="cmdCancel_Click">Cancel</anthem:linkbutton></li>
                            <li><anthem:linkbutton id="cmdDelete" runat="server" resourcekey="cmdDelete" CssClass="dnnSecondaryAction" BorderStyle="None" CausesValidation="False" OnClick="cmdDelete_Click">Delete</anthem:linkbutton></li>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </anthem:panel>
</div>
<script language="javascript" type="text/javascript">
    function setUpDnnEditFolder() {
        jQuery('#dnnEditFolder').dnnPanels();
        jQuery('.dnnTooltip').dnnTooltip();
    }
</script>