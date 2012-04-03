<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="DocumentLibraryModerate.ascx.cs" Inherits="DotNetNuke.Professional.DocumentLibrary.DocumentLibraryModerate" %>
<%@ Register TagPrefix="dl" Namespace="DotNetNuke.Professional.DocumentLibrary" Assembly="DotNetNuke.Professional.DocumentLibrary" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<table cellspacing="0" cellpadding="0" width="100%" bgcolor="white" border="0">
    <tr>
        <td class="Tree" valign="top">
            <table cellspacing="0" cellpadding="0" width="100%" border="0" style="height:100%;">
                <tr>
                    <td>
                        <div class="OuterTable" style="height: 100%">
                            <table class="ToolbarBackgroundTop" cellspacing="0">
                                <tr>
                                    <td class="ToolbarLeft">&nbsp;</td>
                                    <td width="100%">&nbsp;<asp:Label ID="lblFilterOptions" resourcekey="lblFilterOptions" runat="server" Text="Filter Options"></asp:Label></td>
                                    <td class="ToolbarRight">&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="2" cellpadding="1" border="0">
                            <tr>
                                <td class="SubHead" nowrap="nowrap" width="150">
                                    <asp:DropDownList ID="cboStatus" runat="server" Width="180" CssClass="Box100"></asp:DropDownList>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" nowrap="nowrap" width="150">
                                    <asp:Label ID="lblUser" resourcekey="lblUser" runat="server" EnableViewState="false"></asp:Label><br />
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tr>
                                            <td width="100%">
                                                <asp:TextBox ID="txtUser" runat="server" Width="163" CssClass="Box100"></asp:TextBox>
                                            </td>
                                            <td>
                                                <a id="cmdUser" runat="server"><img id="imgUser" align="absmiddle" border="0" runat="server" alt="" /></a>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:CustomValidator ID="valUser" resourcekey="valUser.ErrorMessage" runat="server"
                                        OnServerValidate="ValidateDataUser" ErrorMessage="user not found" EnableClientScript="false"
                                        ControlToValidate="txtUser" Display="Static"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" nowrap="nowrap" width="150">
                                    <asp:Label ID="lblDateStart" resourcekey="lblDateStart" runat="server" EnableViewState="false"></asp:Label><br />
                                    <dnn:DnnDatePicker ID="datepickerStartDate" runat="server"/>&nbsp;
                                    <asp:CompareValidator ID="valDateStartCompare" resourcekey="valDateStartCompare.ErrorMessage"
                                        runat="server" ErrorMessage="start date must be less or equal to end date" EnableClientScript="false"
                                        ControlToValidate="datepickerStartDate" Display="Static" Type="Date" ControlToCompare="datepickerEndDate"
                                        Operator="LessThanEqual"></asp:CompareValidator><asp:CompareValidator ID="valDateStartDataType"
                                            resourcekey="valDateStartDataType.ErrorMessage" runat="server" ErrorMessage="invalid date"
                                            EnableClientScript="true" ControlToValidate="datepickerStartDate" Display="Static" Type="Date"
                                            Operator="DataTypeCheck"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" nowrap="nowrap" width="150">
                                    <asp:Label ID="lblDateEnd" resourcekey="lblDateEnd" runat="server" EnableViewState="false"></asp:Label><br />
                                    <dnn:DnnDatePicker ID="datepickerEndDate" runat="server" />&nbsp;
                                    <asp:CompareValidator ID="valDateEndCompare" resourcekey="valDateEndCompare.ErrorMessage"
                                        runat="server" ErrorMessage="end date must be greater or equal to start date"
                                        EnableClientScript="false" ControlToValidate="datepickerEndDate" Display="Static" Type="Date"
                                        ControlToCompare="datepickerStartDate" Operator="GreaterThanEqual"></asp:CompareValidator><asp:CompareValidator
                                            ID="valDateEndDataType" resourcekey="valDateEndDataType.ErrorMessage" runat="server"
                                            ErrorMessage="invalid date" EnableClientScript="true" ControlToValidate="datepickerEndDate"
                                            Display="Static" Type="Date" Operator="DataTypeCheck"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:LinkButton ID="cmdViewModerate" resourcekey="cmdViewModerate" runat="server" Text="view items" CssClass="dnnPrimaryAction" OnClick="cmdViewModerate_Click"></asp:LinkButton>&nbsp;
                                    <asp:HyperLink ID="cmdBack" resourcekey="cmdBack" runat="server" CssClass="dnnSecondaryAction"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td valign="top" align="left" width="100%">
            <table class="OuterTable" id="tbDetails" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
                <tr>
                    <td>
                        <table class="ToolbarBackgroundTop" cellspacing="0">
                            <tr>
                                <td class="ToolbarLeft">&nbsp;</td>
                                <td width="100%">
                                    <asp:Label ID="lblTitleFileEdition" resourcekey="lblTitleFileEdition" runat="server">File Edition</asp:Label>
                                </td>
                                <td class="ToolbarRight">
                                    &nbsp;&nbsp;&nbsp;
                                </td>
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
                                            <div class="dnnToolTip">
                                                <label for="<%= txtDocumentName.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#">
                                                        <asp:Label ID="DocumentName" runat="server" />
                                                    </a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display:none">
                                                    <asp:Label ID="DocumentNameHelp" runat="server" CssClass="dnnHelpText" />
                                                    <a href="#" class="pinHelp"></a>
                                                </div>
                                            </div>
                                            <asp:TextBox ID="txtDocumentName" runat="server" CssClass="Box100" MaxLength="256"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnToolTip">
                                                <label for="<%= cboDocumentFolder.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#">
                                                        <asp:Label ID="DocumentFolder" runat="server" />
                                                    </a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display:none">
                                                    <asp:Label ID="DocumentFolderHelp" runat="server" CssClass="dnnHelpText" />
                                                    <a href="#" class="pinHelp"></a>
                                                </div>
                                            </div>
                                            <asp:DropDownList ID="cboDocumentFolder" runat="server" CssClass="Box100" DataTextField="FolderName" DataValueField="FolderID"></asp:DropDownList>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnToolTip">
                                                <label for="<%= clbDocumentCategories.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#">
                                                        <asp:Label ID="DocumentCategories" runat="server" />
                                                    </a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display:none">
                                                    <asp:Label ID="DocumentCategoriesHelp" runat="server" CssClass="dnnHelpText" />
                                                    <a href="#" class="pinHelp"></a>
                                                </div>
                                            </div>
                                            <dl:CheckedListBox ID="clbDocumentCategories" Style="overflow: auto" runat="server" CssClass="Normal" DataTextField="CategoryName" DataValueField="CategoryID" Height="100"></dl:CheckedListBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnToolTip">
                                                <label for="<%= txtDocumentDescription.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#">
                                                        <asp:Label ID="DocumentDescription" runat="server" />
                                                    </a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display:none">
                                                    <asp:Label ID="DocumentDescriptionHelp" runat="server" CssClass="dnnHelpText" />
                                                    <a href="#" class="pinHelp"></a>
                                                </div>
                                            </div>
                                            <asp:TextBox ID="txtDocumentDescription" runat="server" CssClass="Box100" TextMode="MultiLine" Rows="10"></asp:TextBox>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnToolTip">
                                                <label for="<%= lblDocDateUp.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#">
                                                        <asp:Label ID="DocumentUploaded" runat="server" />
                                                    </a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display:none">
                                                    <asp:Label ID="DocumentUploadedHelp" runat="server" CssClass="dnnHelpText" />
                                                    <a href="#" class="pinHelp"></a>
                                                </div>
                                            </div>
                                            <div>
                                                <asp:Label ID="lblDocDateUp" runat="server" EnableViewState="false" CssClass="dgTxtS"></asp:Label><br />
                                                <asp:Label ID="lblDocUsrNmUp" runat="server" EnableViewState="false" CssClass="dgTxtS"></asp:Label>&nbsp; - &nbsp;
                                                <asp:Label ID="lblDocUsrFlNmUp" runat="server" EnableViewState="false" CssClass="dgTxtS"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="dnnFormItem">
                                            <div class="dnnToolTip">
                                                <label for="<%= lblDocDateMod.ClientID %>">
                                                    <a tabindex="-1" class="dnnFormHelp" href="#">
                                                        <asp:Label ID="DocumentModified" runat="server" />
                                                    </a>
                                                </label>
                                                <div class="dnnFormHelpContent dnnClear" style="display:none">
                                                    <asp:Label ID="DocumentModifiedHelp" runat="server" CssClass="dnnHelpText" />
                                                    <a href="#" class="pinHelp"></a>
                                                </div>
                                            </div>
                                            <div class="dnnClear">
                                                <asp:Label ID="lblDocDateMod" runat="server" EnableViewState="false" CssClass="dgTxtS"></asp:Label><br />
                                                <asp:Label ID="lblDocUsrNmMod" runat="server" EnableViewState="false" CssClass="dgTxtS"></asp:Label>&nbsp; - &nbsp;
                                                <asp:Label ID="lblDocUsrFlNmMod" runat="server" EnableViewState="false" CssClass="dgTxtS"></asp:Label>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="dnnActions dnnClear">
                            <asp:LinkButton ID="cmdModerateUpdate" resourcekey="cmdUpdate" runat="server" CssClass="dnnPrimaryAction" BorderStyle="None" OnClick="cmdModerateUpdate_Click">Update</asp:LinkButton>&nbsp;
                            <asp:LinkButton ID="cmdModerateCancel" resourcekey="cmdCancel" runat="server" CssClass="dnnSecondaryAction" BorderStyle="None" CausesValidation="False" OnClick="cmdModerateCancel_Click">Cancel</asp:LinkButton><br />
                            <asp:LinkButton ID="cmdModerateSubmit" resourcekey="cmdModerateSubmit" runat="server" CssClass="dnnSecondaryAction" BorderStyle="None" CausesValidation="False" OnClick="cmdModerateSubmit_Click">Re-Submit</asp:LinkButton> &nbsp;
                            <asp:LinkButton ID="cmdModerateRevise" resourcekey="cmdModerateRevise" runat="server" CssClass="dnnSecondaryAction" BorderStyle="None" CausesValidation="False" OnClick="cmdModerateRevise_Click">Revise</asp:LinkButton>&nbsp;
                            <asp:LinkButton ID="cmdModerateReject" resourcekey="cmdModerateReject" runat="server" CssClass="dnnSecondaryAction" BorderStyle="None" CausesValidation="False" OnClick="cmdModerateReject_Click">Reject</asp:LinkButton>&nbsp;
                            <asp:LinkButton ID="cmdModerateAccept" resourcekey="cmdModerateAccept" runat="server" CssClass="dnnSecondaryAction" BorderStyle="None" CausesValidation="False" OnClick="cmdModerateAccept_Click">Accept</asp:LinkButton>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="OuterTable" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td>
                        <table class="ToolbarBackgroundTop" cellspacing="0">
                            <tr>
                                <td class="ToolbarLeft">&nbsp;</td>
                                <td width="100%">
                                    <table id="tbNav1" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
                                        <tr>
                                            <td>
                                                <img src='<%=ResolveUrl("images/dgBullet.png")%>' alt="" />
                                            </td>
                                            <td nowrap="nowrap">
                                                <asp:Label ID="lblTotalRecords" runat="server" CssClass="dgTxtS"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td nowrap="nowrap">
                                                <asp:Label ID="lblRecordCount" runat="server" CssClass="dgTxtS"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>
                                                <img src='<%=ResolveUrl("images/dgBullet.png")%>' alt="" />
                                            </td>
                                            <td nowrap="nowrap" align="left">
                                                <asp:Label ID="lblPageSize" runat="server" CssClass="dgTxtS"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td align="left" width="100%">
                                                <asp:DropDownList ID="cboPageSize" runat="server" AutoPostBack="True" CssClass="dgBox" OnSelectedIndexChanged="cboPageSize_SelectedIndexChanged"></asp:DropDownList>
                                            </td>
                                            <td nowrap="nowrap" align="right">
                                                <asp:ImageButton ID="imgFirstTop" runat="server" CssClass="CommandButton" CommandArgument="F" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                                <asp:ImageButton ID="imgPreviousTop" runat="server" CssClass="CommandButton" CommandArgument="P" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                                <asp:DropDownList ID="cboJumpToPageTop" runat="server" AutoPostBack="True" CssClass="dgBox" OnSelectedIndexChanged="cboJumpToPage_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                                                <asp:ImageButton ID="imgNextTop" CssClass="CommandButton" runat="server" CommandArgument="N" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                                <asp:ImageButton ID="imgLastTop" runat="server" CssClass="ImageButton" CommandArgument="L" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="ToolbarRight">
                                    &nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="lblDocument" runat="server" CssClass="normal"></asp:Label>
                        <asp:DataGrid ID="dgDocument" runat="server" CssClass="dgTbl" CellPadding="2" AllowCustomPaging="True"
                            Width="100%" PageSize="10" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                            OnItemCommand="dgDocument_ItemCommand" OnSortCommand="dgDocument_SortCommand"
                            OnItemDataBound="dgDocument_ItemDataBound">
                            <HeaderStyle CssClass="dgRowH"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn HeaderText="Status" SortExpression="DocumentModerateStatus">
                                    <HeaderStyle CssClass="dgTxtB" HorizontalAlign="center"></HeaderStyle>
                                    <ItemStyle VerticalAlign="top" Wrap="false" CssClass="dgTxtS" HorizontalAlign="center">
                                    </ItemStyle>
                                    <ItemTemplate>
                                        <span style='width: 100%; height: 100%; background-color: <%# setupDocumentModerateStatusColor(DataBinder.Eval(Container.DataItem, "DocumentModerateStatus")) %>;'>
                                            &nbsp; </span>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn HeaderText="DocumentName" DataField="DocumentName" SortExpression="DocumentName">
                                    <HeaderStyle CssClass="dgTxtB" Wrap="false"></HeaderStyle>
                                    <ItemStyle CssClass="dgTxt" Wrap="false"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="DocumentDescription" DataField="DocumentDescription">
                                    <HeaderStyle CssClass="dgTxtB"></HeaderStyle>
                                    <ItemStyle CssClass="dgTxt" Width="100%"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="DocumentSize" DataField="DocumentSizeKb" SortExpression="DocumentSize">
                                    <HeaderStyle CssClass="dgTxtB" Wrap="false"></HeaderStyle>
                                    <ItemStyle CssClass="dgTxt" Width="1" Wrap="false"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Uploaded" SortExpression="DocumentDate_Uploaded">
                                    <HeaderStyle CssClass="dgTxtB" HorizontalAlign="center"></HeaderStyle>
                                    <ItemStyle VerticalAlign="top" Wrap="false" CssClass="dgTxtS" HorizontalAlign="center">
                                    </ItemStyle>
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "DNNUserName_Uploaded") %>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "DNNUserFullName_Uploaded") %>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "DocumentDate_UploadedFormatted") %>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Modified" SortExpression="DocumentDate_Modified">
                                    <HeaderStyle CssClass="dgTxtB" HorizontalAlign="center"></HeaderStyle>
                                    <ItemStyle VerticalAlign="top" Wrap="false" CssClass="dgTxtS" HorizontalAlign="center">
                                    </ItemStyle>
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "DNNUserName_Modified") %>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "DNNUserFullName_Modified") %>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "DocumentDate_ModifiedFormatted") %>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <HeaderStyle CssClass="dgTxtB"></HeaderStyle>
                                    <ItemStyle VerticalAlign="top" Width="1"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="cmdReview" runat="server" EnableViewState="true" CommandName="Review" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <HeaderStyle CssClass="dgTxtB"></HeaderStyle>
                                    <ItemStyle VerticalAlign="top" Width="1"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="cmdDestroy" runat="server" EnableViewState="true" CommandName="Destroy" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <HeaderStyle CssClass="dgTxtB"></HeaderStyle>
                                    <ItemStyle VerticalAlign="top" Width="1"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="lnkDownload" runat="server" EnableViewState="true"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle Visible="False" />
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="ToolbarBackgroundBottom" cellspacing="0">
                            <tr>
                                <td class="ToolbarLeft">&nbsp;</td>
                                <td width="100%">
                                    <table id="tbNav2" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
                                        <tr>
                                            <td>
                                                <img src='<%=ResolveUrl("images/dgBullet.png")%>' alt="" />
                                            </td>
                                            <td nowrap="nowrap" align="left" width="100%">
                                                <asp:Label ID="lblPageCount" runat="server" CssClass="dgTxtS"></asp:Label>
                                            </td>
                                            <td nowrap="nowrap" align="center">
                                                <asp:ImageButton ID="imgFirst" runat="server" CssClass="CommandButton" CommandArgument="F" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                                <asp:ImageButton ID="imgPrevious" runat="server" CssClass="CommandButton" CommandArgument="P" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                                <asp:DropDownList ID="cboJumpToPage" runat="server" AutoPostBack="True" CssClass="dgBox" OnSelectedIndexChanged="cboJumpToPage_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                                                <asp:ImageButton ID="imgNext" CssClass="CommandButton" runat="server" CommandArgument="N" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                                <asp:ImageButton ID="imgLast" runat="server" CssClass="ImageButton" CommandArgument="L" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="ToolbarRight">
                                    &nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <fieldset style="float: right; margin: 2px; width: 10px">
                <legend>
                    <asp:Label ID="lblStatusLegend" resourcekey="lblStatusLegend" runat="server" CssClass="normalbold"></asp:Label>
                </legend>
                <table class="dgTxtS" cellspacing="1" cellpadding="1" border="0">
                    <tr>
                        <td width="30">
                            <span style="width: 100%; height: 100%; background-color: yellow">&nbsp;</span>
                        </td>
                        <td>
                            <asp:Label ID="lblStatusSubmitted" resourcekey="cboStatusSubmitted" runat="server" CssClass="normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="width: 100%; height: 100%; background-color: orange">&nbsp;</span>
                        </td>
                        <td>
                            <asp:Label ID="lblStatusRevise" resourcekey="cboStatusRevise" runat="server" CssClass="normal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="width: 100%; height: 100%; background-color: red">&nbsp;</span>
                        </td>
                        <td>
                            <asp:Label ID="lblStatusRejected" CssClass="normal" runat="server" resourcekey="cboStatusRejected"></asp:Label>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
</table>
