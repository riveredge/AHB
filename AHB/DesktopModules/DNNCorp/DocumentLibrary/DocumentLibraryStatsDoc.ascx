<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="DocumentLibraryStatsDoc.ascx.cs" Inherits="DotNetNuke.Professional.DocumentLibrary.DocumentLibraryStatsDoc" %>
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
                                    <asp:DropDownList ID="cboFolder" DataTextField="FolderName" DataValueField="FolderID" runat="server" Width="180" CssClass="Box100"></asp:DropDownList>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" nowrap="nowrap" width="150">
                                    <asp:Label ID="lblUser" runat="server" resourcekey="lblUser" EnableViewState="false"></asp:Label><br />
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
                                    <asp:CustomValidator ID="valUser" resourcekey="valUser.ErrorMessage" OnServerValidate="ValidateDataUser"
                                        ErrorMessage="user not found" EnableClientScript="false" ControlToValidate="txtUser"
                                        Display="Static" runat="server"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" nowrap="nowrap" width="150">
                                    <asp:Label ID="lblDateStart" runat="server" resourcekey="lblDateStart" EnableViewState="false"></asp:Label><br />
                                    <dnn:DnnDatePicker ID="datepickerStartDate" runat="server"/>&nbsp;
                                    <asp:CompareValidator ID="valDateStartCompare" runat="server" resourcekey="valDateStartCompare.ErrorMessage"
                                        ErrorMessage="start date must be less or equal to end date" EnableClientScript="false"
                                        ControlToValidate="datepickerStartDate" Display="Static" Type="Date" ControlToCompare="datepickerEndDate"
                                        Operator="LessThanEqual"></asp:CompareValidator><asp:CompareValidator ID="valDateStartDataType"
                                            runat="server" resourcekey="valDateStartDataType.ErrorMessage" ErrorMessage="invalid date"
                                            EnableClientScript="true" ControlToValidate="datepickerStartDate" Display="Static" Type="Date"
                                            Operator="DataTypeCheck"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" nowrap="nowrap" width="150">
                                    <asp:Label ID="lblDateEnd" runat="server" resourcekey="lblDateEnd" EnableViewState="false"></asp:Label><br />
                                    <dnn:DnnDatePicker ID="datepickerEndDate" runat="server" />&nbsp;
                                    <asp:CompareValidator ID="valDateEndCompare" runat="server" resourcekey="valDateEndCompare.ErrorMessage"
                                        ErrorMessage="end date must be greater or equal to start date" EnableClientScript="false"
                                        ControlToValidate="datepickerEndDate" Display="Static" Type="Date" ControlToCompare="datepickerStartDate"
                                        Operator="GreaterThanEqual"></asp:CompareValidator><asp:CompareValidator ID="valDateEndDataType"
                                            runat="server" resourcekey="valDateEndDataType.ErrorMessage" ErrorMessage="invalid date"
                                            EnableClientScript="true" ControlToValidate="datepickerEndDate" Display="Static" Type="Date"
                                            Operator="DataTypeCheck"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:LinkButton ID="cmdViewStatistics" CssClass="dnnPrimaryAction" resourcekey="cmdViewStatistics" runat="server" Text="view statistics" OnClick="cmdViewStatistics_Click"></asp:LinkButton>
                                    &nbsp;
                                    <asp:HyperLink ID="cmdBack" CssClass="dnnSecondaryAction" resourcekey="cmdBack" runat="server"></asp:HyperLink>
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
                                <td width="100%">&nbsp;<asp:Label ID="lblDownloadDetails" resourcekey="lblDownloadDetails" runat="server" Text="Download Details"></asp:Label></td>
                                <td class="ToolbarRight">&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="1" cellpadding="1" width="100%" border="0">
                            <tr>
                                <td class="dgRowH" nowrap="nowrap" width="150">
                                    <asp:Label ID="lblDetFolderHierarchy" runat="server" CssClass="SubHead" resourcekey="lblDetFolderHierarchy"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDetFolderHierarchyValue" runat="server" CssClass="Normal"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="dgRowH" nowrap="nowrap" width="150">
                                    <asp:Label ID="lblDetDocumentName" runat="server" CssClass="SubHead" resourcekey="lblDetDocumentName"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDetDocumentNameValue" runat="server" CssClass="Normal"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="dgRowH" valign="top" nowrap="nowrap" width="150">
                                    <asp:Label ID="lblDetDocumentDownloads" runat="server" CssClass="SubHead" resourcekey="lblDetDocumentDownloads"></asp:Label>
                                </td>
                                <td>
                                    <asp:Repeater ID="repDetDocumentDownloads" runat="server">
                                        <HeaderTemplate>
                                            <table cellpadding="2" cellspacing="1" width="100%">
                                                <tr>
                                                    <td class="dgRowH" nowrap="nowrap">
                                                        <asp:Label CssClass="SubHead" ID="lblDetTabName" resourcekey="lblDetTabName" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="dgRowH" nowrap="nowrap">
                                                        <asp:Label CssClass="SubHead" ID="lblDetDNNUserName" resourcekey="lblDetDNNUserName"
                                                            runat="server"></asp:Label>
                                                    </td>
                                                    <td class="dgRowH" width="100%">
                                                        <asp:Label CssClass="SubHead" ID="lblDetDocumentStatsTimestamp" resourcekey="lblDocumentStatsTimestamp"
                                                            runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td nowrap="nowrap">
                                                    <span class="normal">
                                                        <%# DataBinder.Eval(Container.DataItem, "TabName") %>
                                                    </span>
                                                </td>
                                                <td nowrap="nowrap">
                                                    <span class="normal">
                                                        <%# DataBinder.Eval(Container.DataItem, "DNNUserFullName") %>
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="normal">
                                                        <%# DataBinder.Eval(Container.DataItem, "DocumentStatsTimestamp") %>
                                                    </span>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
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
                                                <asp:Label ID="lblTotalRecords" CssClass="dgTxtS" runat="server"></asp:Label>
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
                                                <asp:Label ID="lblPageSize" CssClass="dgTxtS" runat="server"></asp:Label>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td align="left" width="100%">
                                                <asp:DropDownList ID="cboPageSize" runat="server" AutoPostBack="True" CssClass="dgBox" OnSelectedIndexChanged="cboPageSize_SelectedIndexChanged"></asp:DropDownList>
                                            </td>
                                            <td nowrap="nowrap" align="right">
                                                <asp:ImageButton ID="imgFirstTop" runat="server" CssClass="CommandButton" CommandArgument="F" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                                <asp:ImageButton ID="imgPreviousTop" runat="server" CssClass="CommandButton" CommandArgument="P" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                                <asp:DropDownList ID="cboJumpToPageTop" runat="server" AutoPostBack="True" CssClass="dgBox" OnSelectedIndexChanged="cboJumpToPage_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                                                <asp:ImageButton ID="imgNextTop" runat="server" CssClass="CommandButton" CommandArgument="N" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
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
                        <asp:Label ID="lblDocument" CssClass="normal" runat="server"></asp:Label>
                        <asp:DataGrid ID="dgDocument" runat="server" CssClass="dgTbl" CellPadding="2" AllowCustomPaging="True"
                            Width="100%" PageSize="10" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                            OnItemCommand="dgDocument_ItemCommand" OnSortCommand="dgDocument_SortCommand"
                            OnItemDataBound="dgDocument_ItemDataBound">
                            <HeaderStyle CssClass="dgRowH"></HeaderStyle>
                            <Columns>
                                <asp:BoundColumn HeaderText="FolderHierarchy" DataField="FolderHierarchy" SortExpression="FolderHierarchy">
                                    <HeaderStyle CssClass="dgTxtB" Wrap="false"></HeaderStyle>
                                    <ItemStyle CssClass="dgTxt" Wrap="false"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="DocumentName" DataField="DocumentName" SortExpression="DocumentName">
                                    <HeaderStyle CssClass="dgTxtB" Wrap="false"></HeaderStyle>
                                    <ItemStyle CssClass="dgTxt" Wrap="false"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="DocumentDownloadCount" DataField="DocumentDownloadCount"
                                    SortExpression="DocumentDownloadCount">
                                    <HeaderStyle CssClass="dgTxtB" Wrap="false"></HeaderStyle>
                                    <ItemStyle CssClass="dgTxt" Wrap="false" HorizontalAlign="right"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn>
                                    <HeaderStyle CssClass="dgTxtB"></HeaderStyle>
                                    <ItemStyle VerticalAlign="top" Width="1"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="cmdDetails" runat="server" CommandArgument="Details"></asp:ImageButton>
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
                                                <asp:ImageButton ID="imgNext" runat="server" CssClass="CommandButton" CommandArgument="N" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
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
        </td>
    </tr>
</table>
