<%@ Control Language="c#" AutoEventWireup="true" CodeBehind="UserPicker.ascx.cs" Inherits="DotNetNuke.Professional.DocumentLibrary.UserPicker" %>
<table cellspacing="0" cellpadding="0" width="100%" bgcolor="white" border="0">
    <tr>
        <td>
            <div align="center">
                <asp:Repeater ID="repUserLetterFilter" runat="server">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" CssClass="CommandButton" NavigateUrl='<%# GetUserLetterFilterURL(Container.DataItem,"0") %>' Text='<%# Container.DataItem %>' ID="hypUserLetterFilter"></asp:HyperLink>&nbsp;
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <br />
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" width="100%">
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
                                                <img src='<%=ResolveUrl("../../images/dgBullet.png")%>' alt="" />
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
                                                <img src='<%=ResolveUrl("../../images/dgBullet.png")%>' alt="" />
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
                        <asp:Label ID="lblDocument" runat="server" CssClass="normal"></asp:Label>
                        <asp:DataGrid ID="dgDocument" runat="server" CssClass="dgTbl" CellPadding="2" AllowCustomPaging="True"
                            Width="100%" PageSize="10" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                            OnItemCommand="dgDocument_ItemCommand" OnSortCommand="dgDocument_SortCommand"
                            OnItemDataBound="dgDocument_ItemDataBound">
                            <HeaderStyle CssClass="dgRowH"></HeaderStyle>
                            <Columns>
                                <asp:BoundColumn HeaderText="UserName" DataField="UserName">
                                    <HeaderStyle CssClass="dgTxtB" Wrap="false"></HeaderStyle>
                                    <ItemStyle CssClass="dgTxt" Wrap="false"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="FirstName" DataField="FirstName">
                                    <HeaderStyle CssClass="dgTxtB" Wrap="false"></HeaderStyle>
                                    <ItemStyle CssClass="dgTxt" Wrap="false"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="LastName" DataField="LastName">
                                    <HeaderStyle CssClass="dgTxtB" Wrap="false"></HeaderStyle>
                                    <ItemStyle CssClass="dgTxt" Wrap="false"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn>
                                    <HeaderStyle CssClass="dgTxtB"></HeaderStyle>
                                    <ItemStyle VerticalAlign="top" Width="1"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="cmdSelect" runat="server" CausesValidation="False" CommandArgument="Select">
                                        </asp:ImageButton>
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
                                                <img src='<%=ResolveUrl("../../images/dgBullet.png")%>' alt="" />
                                            </td>
                                            <td nowrap="nowrap" align="left" width="100%">
                                                <asp:Label ID="lblPageCount" runat="server" CssClass="dgTxtS"></asp:Label>
                                            </td>
                                            <td nowrap="nowrap" align="center">
                                                <asp:ImageButton ID="imgFirst" runat="server" CssClass="CommandButton" CommandArgument="F" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                                <asp:ImageButton ID="imgPrevious" runat="server" CssClass="CommandButton" CommandArgument="P" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
                                                <asp:DropDownList ID="cboJumpToPage" runat="server" AutoPostBack="True" CssClass="dgBox" OnSelectedIndexChanged="cboJumpToPage_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                                                <asp:ImageButton ID="imgNext" runat="server" CommandArgument="N" CssClass="CommandButton" OnCommand="imgNavigation_Command"></asp:ImageButton>&nbsp;
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
