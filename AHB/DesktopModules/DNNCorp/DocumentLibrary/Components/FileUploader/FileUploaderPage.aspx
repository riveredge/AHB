<%@ Page Language="c#" CodeBehind="FileUploaderPage.aspx.cs" AutoEventWireup="true" Inherits="DotNetNuke.Professional.DocumentLibrary.FileUploaderPage" %>
<%@ Register TagPrefix="dl" TagName="FileUploader" Src="FileUploader.ascx" %>
<%@ Register TagPrefix="dnncrm" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title></title>
	<asp:PlaceHolder runat="server" ID="ClientDependencyHeadCss"></asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="ClientDependencyHeadJs"></asp:PlaceHolder>
    <asp:placeholder id="CSS" runat="server"></asp:placeholder>
    <asp:placeholder id="SCRIPTS" runat="server"></asp:placeholder>
</head>
<body>
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
		<asp:PlaceHolder ID="BodySCRIPTS" runat="server" />
        <br />
        <dl:FileUploader ID="dlFileUploader" runat="server" OnFileUploaderExecuted="FileUploader_FileUploaderExecuted"></dl:FileUploader>
    </form>
	<asp:placeholder runat="server" id="ClientResourceIncludes" />
	<dnncrm:ClientResourceLoader runat="server" id="ClientResourceLoader">
        <Paths>
            <dnncrm:ClientResourcePath Name="SharedScripts" Path="~/Resources/Shared/Scripts/" />
        </Paths>
    </dnncrm:ClientResourceLoader>
</body>
</html>
