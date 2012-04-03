<%@ Page Language="c#" CodeBehind="FileDownloaderPage.aspx.cs" AutoEventWireup="true" Inherits="DotNetNuke.Professional.DocumentLibrary.FileDownloaderPage" %>
<%@ Register TagPrefix="dl" TagName="FileDownloader" Src="FileDownloader.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Download</title>
    <asp:placeholder id="CSS" runat="server"></asp:placeholder>
</head>
<body>
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
    <div class="boxpanel">
        <div class="boxhead">
            <h2>
                <asp:Label ID="lblTitleDownload" resourcekey="lblDownloadTitle" runat="server">File Download</asp:Label>
            </h2>
        </div>
        <div class="boxbody">
            <div class="boxcontent">
                <div style="padding-right: 5px; padding-left: 5px; padding-bottom: 0px; padding-top: 63px; height: 275px">
                    <table cellspacing="0" cellpadding="20" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:Label CssClass="normal" ID="lblDownload" runat="server" resourcekey="lblDownload"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <dl:FileDownloader ID="dlFileDownloader" runat="server" LocalResourceFile='<%# LocalResourceFile %>'></dl:FileDownloader>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div align="right" style="padding: 10;">
                <asp:HyperLink CssClass="CommandButton" ID="lnkClose" runat="server" NavigateUrl="javascript:window.close();" resourcekey="lnkClose"></asp:HyperLink>
            </div>
        </div>
        <div class="boxfooter"></div>
    </div>
    </form>
</body>
</html>
