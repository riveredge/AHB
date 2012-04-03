<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="UploadDocument.ascx.cs" Inherits="DotNetNuke.Professional.DocumentLibrary.UploadDocument" %>
<%@ Register TagPrefix="anthem" Namespace="DotNetNuke.Professional.Anthem" Assembly="DotNetNuke.Professional.Anthem" %>
<div id="divUploadDocument" style="display: none" runat="server" class="OuterTable" width="1">
    <anthem:Panel ID="pnlDL" runat="server" UpdateAfterCallBack="true">
        <table class="OuterTable" id="tbFileUplaod" style="width: 100%" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>
                    <table class="ToolbarBackgroundTop" cellspacing="0">
                        <tr>
                            <td class="ToolbarLeft">&nbsp;</td>
                            <td width="100%">
                                <asp:Label ID="lblTitleFileUpload" runat="server">Upload Document</asp:Label>
                                <asp:Label ID="lblTitleModerate" runat="server" CssClass="normalRed"> - Moderated</asp:Label>
                            </td>
                            <td class="ToolbarRight">
                                &nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" height="100%">
                    <anthem:PlaceHolder ID="plhIFrame" runat="server">
                        <iframe id="ifFileUpload" style="display: none; overflow: visible; width: 100%" marginwidth="0" hspace="0" vspace="0" marginheight="0" frameborder="0" scrolling="no" runat="server"></iframe>
                    </anthem:PlaceHolder>
                </td>
            </tr>
        </table>
    </anthem:Panel>
</div>
