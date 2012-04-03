<%@ Control Language="c#" AutoEventWireup="true" Inherits="DotNetNuke.Professional.DocumentLibrary.EditCategory" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="anthem" Namespace="DotNetNuke.Professional.Anthem" Assembly="DotNetNuke.Professional.Anthem" %>
<div id="divEditCategory" style="display: none" runat="server">
    <anthem:Panel ID="pnlDL" runat="server">
        <table class="OuterTable" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <table class="ToolbarBackgroundTop" cellspacing="0">
                        <tr>
                            <td class="ToolbarLeft">&nbsp;</td>
                            <td width="100%">
                                <asp:Label ID="lblTitle" runat="server"></asp:Label>
                            </td>
                            <td class="ToolbarRight">&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="dnnForm dnnEditCategory dnnClear" id="dnnEditCategory">
                        <div class="EditCategoryContent dnnClear">
                            <div id="exEditCategory" class="exEditCategory dnnClear">
                                <div class="execContent dnnClear">
                                    <h2 id="Panel-GeneralSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><asp:Literal ID="CategoryGeneralSettings" runat="server" /></a></h2>
                                    <fieldset>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= txtCategoryName.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="CategoryName" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="CategoryNameHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <asp:TextBox ID="txtCategoryName" runat="server" MaxLength="256"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= cboCategoryParent.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="CategoryParent" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="CategoryParentHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <asp:DropDownList ID="cboCategoryParent" runat="server" DataTextField="CategoryName" DataValueField="CategoryID"></asp:DropDownList>
                                        </div>
                                    </fieldset>
                                    <h2 id="Panel-DirectViewSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><asp:literal ID="CategoryDirectViewSettings" runat="server" /></a></h2>
                                    <fieldset>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= chxCategoryDirectView.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="CategoryDirectView" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="CategoryDirectViewHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <asp:CheckBox ID="chxCategoryDirectView" runat="server" EnableViewState="false"></asp:CheckBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= txtCategoryDirectKey.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="CategoryDirectKey" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="CategoryDirectKeyHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <asp:TextBox ID="txtCategoryDirectKey" runat="server" EnableViewState="false"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnTooltip">
                                                <label for="<%= txtCategoryDirectUrl.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="CategoryDirectUrl" runat="server"></asp:Label></a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                                    <asp:Label ID="CategoryDirectUrlHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                                    <a href="#" class="pinHelp"></a>
	                                            </div>
                                            </div>
                                            <asp:TextBox ID="txtCategoryDirectUrl" runat="server" TextMode="MultiLine" Rows="1" Wrap="false" EnableViewState="false"></asp:TextBox>
                                        </div>
                                    </fieldset>
                                    <asp:Panel ID="pnSecuritySettings" runat="server">
                                        <h2 id="Panel-SecuritySettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><asp:literal ID="CategorySecuritySettings" runat="server" /></a></h2>
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
                                                <asp:CheckBox ID="chxSecurityInherit" runat="server" EnableViewState="false"></asp:CheckBox>
                                            </div>
                                            <div class="dnnFormItem">
                                                <asp:Panel ID="pnlSecurity" runat="server">
                                                    <asp:Repeater ID="repSecurity" runat="server" OnItemDataBound="repSecurity_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table border="0" bgcolor="ghostwhite" id="tbSecurity">
                                                                <tr class="dgRowH">
                                                                    <td><asp:Label EnableViewState="false" ID="lblRole" CssClass="dgTxtB" runat="server">Role</asp:Label></td>
                                                                    <td><asp:Label EnableViewState="false" ID="lblView" CssClass="dgTxtB" runat="server">View</asp:Label></td>
                                                                    <td><asp:Label EnableViewState="false" ID="lblAdd" CssClass="dgTxtB" runat="server">Add</asp:Label></td>
                                                                    <td><asp:Label EnableViewState="false" ID="lblEdit" CssClass="dgTxtB" runat="server">Edit</asp:Label></td>
                                                                    <td><asp:Label EnableViewState="false" ID="lblDelete" CssClass="dgTxtB" runat="server">Delete</asp:Label></td>
                                                                    <td><asp:Label EnableViewState="false" ID="lblChangeSecurity" CssClass="dgTxtB" runat="server">Change Security</asp:Label></td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><input type="hidden" id="hidDNNRoleName" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "DNNRoleName")%>' name="hidDNNRoleName" /><span class="dgTxt"><%# DataBinder.Eval(Container.DataItem, "DNNRoleName") %></span></td>
                                                                <td align="center"><asp:CheckBox EnableViewState="false" runat="server" CssClass="dgTxt" ID="chxView" Checked='<%# DataBinder.Eval(Container.DataItem, "View")%>'></asp:CheckBox></td>
                                                                <td align="center"><asp:CheckBox EnableViewState="false" runat="server" CssClass="dgTxt" ID="chxAdd" Checked='<%# DataBinder.Eval(Container.DataItem, "Add")%>'></asp:CheckBox></td>
                                                                <td align="center"><asp:CheckBox EnableViewState="false" runat="server" CssClass="dgTxt" ID="chxEdit" Checked='<%# DataBinder.Eval(Container.DataItem, "Edit")%>'></asp:CheckBox></td>
                                                                <td align="center"><asp:CheckBox EnableViewState="false" runat="server" CssClass="dgTxt" ID="chxDelete" Checked='<%# DataBinder.Eval(Container.DataItem, "Delete")%>'></asp:CheckBox></td>
                                                                <td align="center"><asp:CheckBox EnableViewState="false" runat="server" CssClass="dgTxt" ID="chxChangeSecurity" Checked='<%# DataBinder.Eval(Container.DataItem, "ChangeSecurity")%>'></asp:CheckBox></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </asp:Panel>
                                            </div>
                                        </fieldset>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <ul class="dnnActions dnnClear">
                            <li><anthem:LinkButton ID="cmdUpdate" runat="server" CssClass="dnnPrimaryAction" BorderStyle="None" resourcekey="cmdUpdate" OnClick="cmdUpdate_Click"></anthem:LinkButton></li>
                            <li><anthem:LinkButton ID="cmdCancel" runat="server" CssClass="dnnSecondaryAction" BorderStyle="None" resourcekey="cmdCancel" CausesValidation="False" OnClick="cmdCancel_Click"></anthem:LinkButton></li>
                            <li><anthem:LinkButton ID="cmdDelete" runat="server" CssClass="dnnSecondaryAction" BorderStyle="None" resourcekey="cmdDelete" CausesValidation="False" OnClick="cmdDelete_Click"></anthem:LinkButton></li>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </anthem:Panel>
</div>
<script language="javascript" type="text/javascript">
    function setUpDnnEditCategory() {
        jQuery('#dnnEditCategory').dnnPanels();
        jQuery('.dnnTooltip').dnnTooltip();
    }
</script>