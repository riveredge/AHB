<%@ Control language="C#" Inherits="DotNetNuke.Modules.HtmlPro.HtmlModule" CodeBehind="HtmlModule.ascx.cs" AutoEventWireup="false"  %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke.WebControls" %>
<asp:Panel ID="pnlSummary" runat="server" Visible="false" CssClass="summary">
	<div runat="server">
		
		<script type="text/javascript">
			(function ($) {
				$(document).ready(function () {
					var btnMore = $('<a href="#" class="toggleMore"><%=LocalizeString("More") %></a>');
					var btnSummary = $('<a href="#" class="toggleMore"><%=LocalizeString("Summary") %></a>');
					$("#<%=pnlSummary.ClientID %>").append(btnMore);
					$("#<%=lblContent.ClientID %>").append(btnSummary);
					
					btnMore.click(function (e) {
						$("#<%=pnlSummary.ClientID %>").slideUp();
						$("#<%=lblContent.ClientID %>").slideDown();
						e.preventDefault();
					});

					btnSummary.click(function (e) {
						$("#<%=pnlSummary.ClientID %>").slideDown();
						$("#<%=lblContent.ClientID %>").slideUp();
						e.preventDefault();
					});

				});
			})(jQuery);
		</script>
	</div>
</asp:Panel>
<dnn:DNNLabelEdit id="lblContent" runat="server" cssclass="Normal" enableviewstate="False" MouseOverCssClass="LabelEditOverClassML"
	LabelEditCssClass="LabelEditTextClass" EditEnabled="False" MultiLine="True" RichTextEnabled="True"
	ToolBarId="tbEIPHTML" RenderAsDiv="True" EventName="none" LostFocusSave="False" CallBackType="Simple" ClientAPIScriptPath="" LabelEditScriptPath="" WorkCssClass=""></dnn:DNNLabelEdit>
<DNN:DNNToolBar id="editorDnnToobar" runat="server" CssClass="eipbackimg" ReuseToolbar="true"
	DefaultButtonCssClass="eipbuttonbackimg" DefaultButtonHoverCssClass="eipborderhover">
	<DNN:DNNToolBarButton ControlAction="edit" ID="tbEdit" ToolTip="Edit" CssClass="eipbutton_edit" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="save" ID="tbSave" ToolTip="Save" CssClass="eipbutton_save" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="cancel" ID="tbCancel" ToolTip="Cancel" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="bold" ID="tbBold" ToolTip="Bold" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="italic" ID="tbItalic" ToolTip="Italic" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="underline" ID="tbUnderline" ToolTip="Underline" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="justifyleft" ID="tbJustifyLeft" ToolTip="JustifyLeft" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="justifycenter" ID="tbJustifyCenter" ToolTip="JustifyCenter" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="justifyright" ID="tbJustifyRight" ToolTip="JustifyRight" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="insertorderedlist" ID="tbOrderedList" ToolTip="OrderedList" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="insertunorderedlist" ID="tbUnorderedList" ToolTip="UnorderedList" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="outdent" ID="tbOutdent" ToolTip="Outdent" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="indent" ID="tbIndent" ToolTip="Indent" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="createlink" ID="tbCreateLink" ToolTip="CreateLink" runat="server"/>
</DNN:DNNToolBar>