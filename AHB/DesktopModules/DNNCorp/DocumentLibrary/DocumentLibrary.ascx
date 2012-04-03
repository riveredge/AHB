<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="DocumentLibrary.ascx.cs" Inherits="DotNetNuke.Professional.DocumentLibrary.DocumentLibrary" %>
<%@ Register TagPrefix="anthem" Namespace="DotNetNuke.Professional.Anthem" Assembly="DotNetNuke.Professional.Anthem" %>
<a name="dltop"></a>
<table class="OT" cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr class="OTTR1">
        <td class="OTTD1_1">&nbsp;</td>
        <td class="OTTD1_2">&nbsp;</td>
        <td class="OTTD1_3">&nbsp;</td>
    </tr>
    <tr class="OTTR2">
        <td class="OTTD2_1">&nbsp;</td>
        <td class="OTTD2_2">
            <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="white">
                <tr>
                    <td align="left" valign="top" id="tdTree" runat="server" height="100%" class="Tree">
                        <table cellspacing="0" cellpadding="0" border="0" style="height:100%;">
                            <tr>
                                <td valign="top">
                                    <table class="ToolbarBackgroundTop" cellspacing="0">
                                        <tr>
                                            <td class="ToolbarLeft">&nbsp;</td>
                                            <td>
                                                <table runat="server" id="tbMode" cellspacing="0" cellpadding="1" width="100%" border="0">
                                                    <tr>
                                                        <td>
                                                            <asp:HyperLink ID="lnkByFolder" runat="server"></asp:HyperLink>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <asp:HyperLink ID="lnkByCategory" runat="server"></asp:HyperLink>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="100%">
                                                <asp:PlaceHolder ID="plhMenu" runat="server" EnableViewState="False"></asp:PlaceHolder>
                                            </td>
                                            <td class="ToolbarRight">
                                                &nbsp;&nbsp;&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" height="100%">
                                    <div id="divTree" runat="server">
                                        <asp:Panel ID="plhTree" runat="server"></asp:Panel>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:PlaceHolder ID="plhTreeInfo" runat="server"></asp:PlaceHolder>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left" valign="top" width="100%">
                        <div id="divDocumentLibrary" class="OuterTable" style="height: 100%" runat="server">
                            <table class="ToolbarBackgroundTop" cellspacing="0">
                                <tr>
                                    <td class="ToolbarLeft">&nbsp;</td>
                                    <td width="100%">&nbsp;</td>
                                    <td class="ToolbarRight">&nbsp;</td>
                                </tr>
                            </table>
                            <anthem:Label ID="lblMessage" CssClass="normal" runat="server"></anthem:Label>
                        </div>
                        <table class="Details" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="100%">
                                    <asp:PlaceHolder ID="plhDetails" runat="server"></asp:PlaceHolder>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table cellspacing="0" cellpadding="0" width="100%" class="StatusBar">
                            <tr>
                                <td>
                                    &nbsp;
                                    <div class="normal" id="divProcessRequest" style="display: none; color: orange" runat="server">
                                        <asp:Image ID="imgProcessRequest" runat="server" ImageAlign="middle"></asp:Image>&nbsp;
                                        <asp:Label ID="lblProcessRequest" runat="server">processing request...</asp:Label>
                                    </div>
                                    <asp:Label ID="lblStatus" runat="server" CssClass="Normal"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td class="OTTD2_3">&nbsp;</td>
    </tr>
    <tr class="OTTR3">
        <td class="OTTD3_1">&nbsp;</td>
        <td class="OTTD3_2">&nbsp;</td>
        <td class="OTTD3_3">&nbsp;</td>
    </tr>
</table>
