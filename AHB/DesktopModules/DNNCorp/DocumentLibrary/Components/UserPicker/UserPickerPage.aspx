<%@ Page Language="c#" CodeBehind="UserPickerPage.aspx.cs" AutoEventWireup="true" Inherits="DotNetNuke.Professional.DocumentLibrary.UserPickerPage" %>
<%@ Register TagPrefix="dl" TagName="UserPicker" Src="UserPicker.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title></title>
    <asp:placeholder id="CSS" runat="server"></asp:placeholder>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <table width="100%">
        <tr>
            <td>
                <dl:UserPicker ID="userPicker" runat="server"></dl:UserPicker>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:HyperLink CssClass="dnnSecondaryAction" ID="lnkClose" runat="server" NavigateUrl="javascript:window.close();" resourcekey="lnkClose"></asp:HyperLink>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
