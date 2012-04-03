<%@ Control Language="c#" AutoEventWireup="true" Inherits="DotNetNuke.Professional.DocumentLibrary.FileUploader" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="upload" Namespace="DotNetNuke.Professional.Brettle.Web.NeatUpload" Assembly="DotNetNuke.Professional.Brettle.Web.NeatUpload"%>
<div class="dnnForm dnnFileUploader dnnClear" id="dnnFileUploader">
    <div class="FileUploaderContent dnnClear">
        <div id="exFileUploader" class="exFileUploader dnnClear">
            <div class="exfuContent dnnClear">
                <fieldset>
                    <div class="dnnFormItem">
                        <div class="dnnTooltip">
                            <label>
                                <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentFile" runat="server"></asp:Label></a>
                            </label>
                            <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                <asp:Label ID="DocumentFileHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                <a href="#" class="pinHelp"></a>
	                        </div>
                        </div>
                        <input id="fileUpload" type="file" runat="server" name="filFileUpload" />
                        <upload:InputFile id="bigFileUpload" runat="server" name="filFileUpload1" url="~/DNNNeatUpload/Progress.aspx" />
                    </div>
                    <div class="dnnFormItem">
                        <div class="dnnTooltip">
                            <label>
                                <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentUnzip" runat="server"></asp:Label></a>
                            </label>
                            <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                <asp:Label ID="DocumentUnzipHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                <a href="#" class="pinHelp"></a>
	                        </div>
                        </div>
                        <asp:CheckBox ID="chxDocumentUnzip" Runat="server"></asp:CheckBox>
                    </div>
                    <div class="dnnFormItem">
                        <div class="dnnTooltip">
                            <label>
                                <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="DocumentOverwrite" runat="server"></asp:Label></a>
                            </label>
                            <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                <asp:Label ID="DocumentOverwriteHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                <a href="#" class="pinHelp"></a>
	                        </div>
                        </div>
                        <asp:CheckBox ID="chxDocumentOverwrite" Runat="server" Checked="true"></asp:CheckBox>
                    </div>
                    <div class="dnnFormItem" id="progressBarItem" runat="server">
                        <div class="dnnTooltip">
                            <label>
                                <a tabindex="-1" class="dnnFormHelp" href="#"><asp:Label ID="UploadProgress" runat="server"></asp:Label></a>
                            </label>
                            <div class="dnnFormHelpContent dnnClear" style="display: none;">
                                <asp:Label ID="UploadProgressHelp" runat="server" CssClass="dnnHelpText"></asp:Label>
                                <a href="#" class="pinHelp"></a>
	                        </div>
                        </div>
                        <upload:ProgressBar id="progressBarId" runat="server" inline="true" height="35" width="97%" />
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <ul class="dnnActions dnnClear">
        <li><dnn:CommandButton ID="cmdUpload" runat="server" CssClass="dnnPrimaryAction" CausesValidation="false" /></li>
        <li><dnn:CommandButton ID="cmdCancel" runat="server" CssClass="dnnSecondaryAction" CausesValidation="false" /></li>
    </ul>
</div>
<script language="javascript" type="text/javascript">
/*globals jQuery, window, Sys */
(function ($, Sys) {
	function setUpFileUploader() {
	    $('.dnnTooltip').dnnTooltip()
	}

   	$(document).ready(function () {
   	    setUpFileUploader();
		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
		    setUpFileUploader();
		});
	});
} (jQuery, window.Sys));
</script>