<%@ Control Language="c#" AutoEventWireup="true" CodeBehind="GridDocument.ascx.cs" Inherits="DotNetNuke.Professional.DocumentLibrary.GridDocument" %>
<%@ Register TagPrefix="anthem" Namespace="DotNetNuke.Professional.Anthem" Assembly="DotNetNuke.Professional.Anthem" %>
<div id="divGridDocument" style="display: none" runat="server">
    <anthem:Panel ID="pnlDL" runat="server">
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
                                            <asp:Label ID="lblTotalRecords" runat="server" EnableViewState="false" CssClass="dgTxtS"></asp:Label>
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
                                            <asp:Label ID="lblPageSize" runat="server" EnableViewState="false" CssClass="dgTxtS"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td align="left" width="100%">
                                            <anthem:DropDownList ID="cboPageSize" runat="server" CssClass="dgBox" AutoCallBack="True" OnSelectedIndexChanged="cboPageSize_SelectedIndexChanged"></anthem:DropDownList>
                                        </td>
                                        <td nowrap="nowrap" align="right">
                                            <anthem:ImageButton ID="imgFirstTop" runat="server" CommandArgument="F" CssClass="CommandButton" OnCommand="imgNavigation_Command"></anthem:ImageButton>&nbsp;
                                            <anthem:ImageButton ID="imgPreviousTop" runat="server" CommandArgument="P" CssClass="CommandButton" OnCommand="imgNavigation_Command"></anthem:ImageButton>&nbsp;
                                            <anthem:DropDownList ID="cboJumpToPageTop" runat="server" CssClass="dgBox" AutoCallBack="True" OnSelectedIndexChanged="cboJumpToPage_SelectedIndexChanged"></anthem:DropDownList>&nbsp;
                                            <anthem:ImageButton ID="imgNextTop" runat="server" CommandArgument="N" CssClass="CommandButton" OnCommand="imgNavigation_Command"></anthem:ImageButton>&nbsp;
                                            <anthem:ImageButton ID="imgLastTop" runat="server" CommandArgument="L" CssClass="ImageButton" OnCommand="imgNavigation_Command"></anthem:ImageButton>&nbsp;
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
                <td>
                    <div align="center"><asp:Label ID="lblDocumentGrid" runat="server" EnableViewState="false" CssClass="normal"></asp:Label></div>
                    <asp:Repeater ID="repFolder" runat="server" EnableViewState="false">
                        <ItemTemplate>
                            &nbsp; <a class="dgTxtR" href="javascript:void(0);" onclick="noTree_ev_Click('<%# GetTreeNodeFolderId(DataBinder.Eval(Container.DataItem, "FolderId"))%>');">
                                <img src='<%=ResolveUrl("images/tFolder.png")%>' border="0" align="absmiddle" alt="" />&nbsp;<%# DataBinder.Eval(Container.DataItem, "FolderName") %>
                            </a>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Repeater ID="repCategory" runat="server" EnableViewState="false">
                        <ItemTemplate>
                            &nbsp; <a class="dgTxtR" href="javascript:void(0);" onclick="noTree_ev_Click('<%# GetTreeNodeCategoryId(DataBinder.Eval(Container.DataItem, "CategoryId"))%>');">
                                <img src='<%=ResolveUrl("images/tCategory.png")%>' border="0" align="absmiddle" alt="" />&nbsp;<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>
                            </a>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                    <anthem:DataGrid ID="dgDocument" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" PageSize="10" Width="100%" AllowCustomPaging="True"
                        CellPadding="4" GridLines="none" CssClass="dgTbl" OnItemDataBound="dgDocument_ItemDataBound"
                        OnSortCommand="dgDocument_SortCommand" OnItemCommand="dgDocument_ItemCommand">
                        <HeaderStyle CssClass="dgDBar"></HeaderStyle>
                        <Columns>
                            <asp:TemplateColumn HeaderText="DocumentEdit">
                                <HeaderTemplate>
                                    <center><anthem:ImageButton ID="cmdAdd" runat="server" CommandArgument="Add" CausesValidation="false"></anthem:ImageButton></center>
                                </HeaderTemplate>
                                <HeaderStyle CssClass="dgTxtB"></HeaderStyle>
                                <ItemStyle VerticalAlign="top" Width="1"></ItemStyle>
                                <ItemTemplate>
                                    <table cellspacing="0" cellpadding="0" class="dgTblInt">
                                        <tr>
                                            <td>
                                                <asp:ImageButton ID="cmdEdit" runat="server" EnableViewState="false" CommandArgument="Edit" CausesValidation="false"></asp:ImageButton>
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="cmdVersions" runat="server" EnableViewState="false" CommandArgument="Versions" CausesValidation="false"></asp:ImageButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="DocumentName" SortExpression="DocumentName">
                                <HeaderStyle CssClass="dgTxtB" Wrap="false"></HeaderStyle>
                                <ItemStyle CssClass="dgTxt" Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <table cellspacing="0" cellpadding="0" width="100%" class="dgTblInt" border="0">
                                        <tr>
                                            <td valign="top" nowrap="nowrap">
                                                <table cellpadding="0" cellspacing="2" border="0" width="<%# (int.Parse(ThumbnailWidth)+15).ToString() %>">
                                                    <tr>
                                                        <td style='border: solid 1px #999; width: <%# (int.Parse(ThumbnailWidth)+15).ToString() %>px;
                                                            height: <%# (int.Parse(ThumbnailHeight)+15).ToString() %>px; vertical-align: middle;
                                                            text-align: center;'>
                                                            <asp:HyperLink ID="lnkPlayThumbnail" runat="server" EnableViewState="false"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap="nowrap">
                                                            <asp:HyperLink ID="lnkDownload" runat="server" EnableViewState="false"></asp:HyperLink>
                                                            <asp:HyperLink ID="lnkWebDav" runat="server" EnableViewState="false"></asp:HyperLink>
                                                            <asp:Image ImageUrl='<%# SetIconUrl(DataBinder.Eval(Container.DataItem, "DocumentName"))%>' runat="server" ID="DocumentIcon"></asp:Image>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top" width="100%" style="padding-left: 10px; padding-right: 10px;">
                                                <strong><asp:HyperLink ID="lnkDocumentName" runat="server" commandname="View" Text='<%# SetDisplayLength(DataBinder.Eval(Container.DataItem, "DocumentName")) %>'></asp:HyperLink></strong>
                                                <br />
                                                <br />
                                                <asp:Label ID="DocumentDescription" runat="server" EnableViewState="false"><%# DataBinder.Eval(Container.DataItem, "DocumentDescription")%></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <table cellspacing="0" cellpadding="0" width="1" style="margin-left: 6px;" class="dgTxt"
                                                    border="0">
                                                    <tr class="dgTxtS" runat="server" id="DocumentSize">
                                                        <td valign="top" nowrap="nowrap">
                                                            <strong><asp:Label ID="lblDocumentSize" runat="server" EnableViewState="false">Size</asp:Label>:&nbsp;</strong>
                                                        </td>
                                                        <td nowrap="nowrap" valign="top" align="left" width="60px">
                                                            <%# DataBinder.Eval(Container.DataItem, "DocumentSizeKb")%>
                                                        </td>
                                                    </tr>
                                                    <tr class="dgTxtS" runat="server" id="Uploaded">
                                                        <td valign="top" nowrap="nowrap">
                                                            <strong><asp:Label ID="lblUploaded" runat="server" EnableViewState="false">Uploaded</asp:Label>:&nbsp;</strong>
                                                        </td>
                                                        <td valign="top" nowrap="nowrap" width="100px">
                                                            <%# DataBinder.Eval(Container.DataItem, "DNNUserFullName_Uploaded") %><br />
                                                            <%# DataBinder.Eval(Container.DataItem, "DocumentDate_UploadedFormatted") %>
                                                        </td>
                                                    </tr>
                                                    <tr class="dgTxtS" runat="server" id="Modified">
                                                        <td valign="top">
                                                            <strong><asp:Label ID="lblModified" runat="server" EnableViewState="false">Modified</asp:Label>:&nbsp;</strong>
                                                        </td>
                                                        <td nowrap="nowrap" valign="top" width="100px">
                                                            <%# DataBinder.Eval(Container.DataItem, "DNNUserFullName_Modified") %><br />
                                                            <%# DataBinder.Eval(Container.DataItem, "DocumentDate_ModifiedFormatted") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Track">
                                <HeaderTemplate>
                                    <asp:ImageButton ID="cmdTrack" runat="server" EnableViewState="false" CommandArgument="Track" CausesValidation="false"></asp:ImageButton>
                                </HeaderTemplate>
                                <HeaderStyle CssClass="dgTxtB"></HeaderStyle>
                                <ItemStyle VerticalAlign="top" Width="1"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton ID="cmdTrackDoc" runat="server" EnableViewState="false" CommandArgument="TrackDoc" CausesValidation="false"></asp:ImageButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle Visible="False" />
                    </anthem:DataGrid>
                </td>
            </tr>
            <tr id="trNav2" runat="server">
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
                                            <asp:Label ID="lblPageCount" runat="server" EnableViewState="false" CssClass="dgTxtS"></asp:Label>
                                        </td>
                                        <td nowrap="nowrap" align="center">
                                            <anthem:ImageButton ID="imgFirst" runat="server" CommandArgument="F" CssClass="CommandButton" OnCommand="imgNavigation_Command"></anthem:ImageButton>&nbsp;
                                            <anthem:ImageButton ID="imgPrevious" runat="server" CommandArgument="P" CssClass="CommandButton" OnCommand="imgNavigation_Command"></anthem:ImageButton>&nbsp;
                                            <anthem:DropDownList ID="cboJumpToPage" runat="server" CssClass="dgBox" AutoCallBack="True" OnSelectedIndexChanged="cboJumpToPage_SelectedIndexChanged"></anthem:DropDownList>&nbsp;
                                            <anthem:ImageButton ID="imgNext" runat="server" CommandArgument="N" CssClass="CommandButton" OnCommand="imgNavigation_Command"></anthem:ImageButton>&nbsp;
                                            <anthem:ImageButton ID="imgLast" runat="server" CommandArgument="L" CssClass="ImageButton" OnCommand="imgNavigation_Command"></anthem:ImageButton>&nbsp;
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
    </anthem:Panel>
</div>
