<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="SearchSpiderSettings.ascx.cs" Inherits="DotNetNuke.Professional.SearchCrawler.SearchSpider.SearchSpiderSettings" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnnweb" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<div class="dnnForm dnnSearchSpiderSettings dnnClear" id="dnnSearchSpiderSettings">
  <asp:ValidationSummary ID="valSummary" runat="server" CssClass="dnnFormMessage dnnFormValidationSummary"
        EnableClientScript="true" DisplayMode="BulletList" />
	<ul class="dnnAdminTabNav dnnClear">
		<li><a href="#sssUrls"><%=LocalizeString("Paths")%></a></li>
		<li><a href="#sssDocuments"><%=LocalizeString("Documents")%></a></li>
		<li><a href="#sssOptions"><%=LocalizeString("Options")%></a></li>
		<li><a href="#sssSecurity"><%=LocalizeString("Duplicates")%></a></li>
	</ul>
	<div id="sssUrls" class="sssUrls dnnClear">
        <asp:placeholder ID="phPathContent" runat="server">
			<h2 id="dnnSitePanel-sssURLs" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("Urls")%></a></h2>
			<fieldset>
				<dnnweb:DnnGrid id="dgUrls" runat="server" AutoGenerateColumns="false">
					<MasterTableView DataKeyNames="UrlId">
						<Columns>
							<dnnweb:DnnGridButtonColumn ButtonType="ImageButton" IconKey="Edit" UniqueName="imgEdit" CommandName="EditItem" />
							<dnnweb:DnnGridButtonColumn ButtonType="ImageButton" IconKey="Delete" UniqueName="imgDelete" CommandName="DeleteItem" ButtonCssClass="sssDeleteButton" />
							<dnnweb:DnnGridBoundColumn DataField="Url" HeaderText="Url" UniqueName="Url" />
							<dnnweb:DnnGridCheckBoxColumn UniqueName="Active" HeaderText="UrlActive" DataField="UrlActive" />
							<dnnweb:DnnGridCheckBoxColumn UniqueName="DNNImp" HeaderText="UrlDNNRole" />
							<dnnweb:DnnGridCheckBoxColumn UniqueName="WinAuth" HeaderText="UrlWinAuthentication" DataField="UrlWinAuthentication" />
						</Columns>
					</MasterTableView>
				</dnnweb:DnnGrid>
				<ul class="dnnActions dnnClear">
					<li><asp:LinkButton ID="cmdUrlAdd" runat="server" resourcekey="cmdUrlAdd" CssClass="dnnSecondaryAction" CausesValidation="false" /></li>         
				</ul>
			</fieldset>
			<h2 id="dnnSitePanel-sssDirectories" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("Directories")%></a></h2>
			<fieldset>
				<div class="dnnFormItem" id="divDirectoryRoot" runat="server">
					<dnn:label id="plDirectoryRootUrl" runat="server" controlname="ddlDirectoryRootUrl" />
					<asp:DropDownList ID="ddlDirectoryRootUrl" runat="server" />					
				</div>
				<div class="dnnFormItem">
					<dnn:label id="plDirectoryAdd" runat="server" controlname="ddlDirectoryAdd" />
					<asp:DropDownList ID="ddlDirectoryAdd" runat="server" />
					<asp:LinkButton ID="cmdDirectoryAdd" runat="server" resourcekey="cmdDirectoryAdd" CssClass="dnnSecondaryAction" ValidationGroup="AddDirectory" />
                    <asp:RequiredFieldValidator ID="valDirectory" runat="server" Display="Dynamic" resourcekey="DirectoryRequired" ControlToValidate="ddlDirectoryAdd" ValidationGroup="AddDirectory" CssClass="dnnFormMessage dnnFormError" InitialValue="" />
				</div>
				<div class="dnnFormItem">
					<dnn:label id="plIndexedDirectories" runat="server" controlname="lstDirectory" />
					<asp:ListBox ID="lstDirectory" runat="server" />
					<asp:LinkButton ID="cmdDirectoryDelete" runat="server" resourcekey="cmdDirectoryDelete" CausesValidation="false" CssClass="dnnSecondaryAction" />
				</div>
			</fieldset>
        </asp:placeholder>
		<div id="divEditPathContent" runat="server">
			<fieldset>
				<div class="dnnFormItem">
					<dnn:label id="plUrl" controlname="txtUrl" runat="server" />
					<asp:TextBox ID="txtUrl" runat="server" />
					<asp:RequiredFieldValidator ID="valUrl" ControlToValidate="txtUrl" Display="Dynamic" runat="server" CssClass="dnnFormMessage dnnFormError" ValidationGroup="EditURL" />
				</div>
                <div class="dnnFormItem">
                    <dnn:label id="plSitemapUrl" controlname="txtSitemapUrl" runat="server"></dnn:label>
                    <asp:TextBox ID="txtSitemapUrl" runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="valSitemapUrl" runat="server" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="EditURL" />
                </div>
				<div class="dnnFormItem">
					<dnn:label id="plUrlActive" controlname="chxUrlActive" runat="server" />
					<asp:CheckBox ID="chxUrlActive" runat="server" />
				</div>
				<div class="dnnFormItem">
					<dnn:label id="plDNNRoles" controlname="rblDNNRoles" runat="server" />
					<asp:RadioButtonList ID="rblDNNRoles" runat="server" CssClass="sssInputList" RepeatLayout="Flow" RepeatDirection="Vertical" />
				</div>
				<div id="divWinAuth" runat="server">
					<div class="dnnFormItem">
						<dnn:label id="plWindowsAuthentication" controlname="chxWindowsAuthentication" runat="server" />
						<asp:CheckBox ID="chxWindowsAuthentication" runat="server" Checked="False" />
					</div>
					<div class="dnnFormItem">
						<dnn:label id="plWindowsDomain" controlname="txtWindowsDomain" runat="server" />
						<asp:TextBox ID="txtWindowsDomain" runat="server" CssClass="repTable" />
					</div>
					<div class="dnnFormItem">
						<dnn:label id="plWindowsUser" controlname="txtWindowsUser" runat="server" />
						<asp:TextBox ID="txtWindowsUser" runat="server" CssClass="repTable" />
					</div>
					<div class="dnnFormItem">
						<dnn:label id="plWindowsPassword" controlname="txtWindowsPassword" runat="server" />
						<asp:TextBox ID="txtWindowsPassword" runat="server" TextMode="Password" />
					</div>
				</div>
				<ul class="dnnActions">
					<li><asp:LinkButton class="dnnPrimaryAction" ID="cmdUpdateUrlConfig" runat="server" resourcekey="cmdUpdateUrlConfig" ValidationGroup="EditURL" /></li>
					<li><asp:LinkButton class="dnnSecondaryAction" ID="cmdCancelUrlConfig" runat="server" resourcekey="cmdCancelUrlConfig" CausesValidation="false" /></li>
				</ul>
			</fieldset>
		</div>
	</div>
	<div id="sssDocuments" class="sssDocuments dnnClear">
		<div class="dnnFormExpandContent"><a href=""><%=Localization.GetString("ExpandAll", Localization.SharedResourceFile)%></a></div>
		<h2 id="dnnSitePanel-sssdIncluded" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("Included")%></a></h2>
		<fieldset>
			<div class="dnnFormItem">
				<dnn:label id="plSearchSpiderOfficeDocuments" runat="server" controlname="chkList" text="Spider MSOffice Documents:" />
				<asp:CheckBoxList ID="chkList" runat="server" CssClass="sssInputList" RepeatLayout="Flow" RepeatDirection="Horizontal" />
			</div>
			<div class="dnnFormItem">
				<dnn:label id="plSearchSpiderPdf" runat="server" controlname="chxPdf" text="Spider PDF Documents:" />
				<asp:CheckBox ID="chxPdf" runat="server" CssClass="sssInputList" resourcekey="chkPdf" />
			</div>
			<div id="divPdfMsg" runat="server" class="dnnFormMessage dnnFormValidationSummary">
				<asp:Label ID="lbPdfMsg" runat="server" resourcekey="lbPdfMsg" />
			</div>
		</fieldset>
		<h2 id="dnnSitePanel-sssdExcludedExtensions" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("ExcludedExtensions")%></a></h2>
		<fieldset class="dnnFSInfo">
			<div class="dnnFormItem">
				<asp:TextBox ID="txtExcludedDocumentsAdd" runat="server" />
				<asp:LinkButton ID="cmdExcludedDocumentsAdd" runat="server" resourcekey="cmdExcludedDocumentsAdd" ValidationGroup="AddExcluded" CssClass="dnnSecondaryAction" />
				<asp:RequiredFieldValidator ID="valExcludedDocs" runat="server" Display="Dynamic" resourcekey="ExcludedDocumentTypeRequired" ControlToValidate="txtExcludedDocumentsAdd" ValidationGroup="AddExcluded" CssClass="dnnFormMessage dnnFormError" />
			</div>
			<div class="dnnFormItem">
				<asp:ListBox ID="lstExcludedDocumentsList" runat="server" />
				<asp:LinkButton ID="cmdExcludedDocumentsDelete" runat="server" resourcekey="cmdExcludedDocumentsDelete" CausesValidation="false" CssClass="dnnSecondaryAction" />                
			</div>
			<div class="dnnFormMessage dnnFormValidationSummary" id="divInvalidFormat" runat="server" visible="false">
				<asp:Label ID="ExcludedDocumentsInvalidFormat" runat="server" EnableViewState="false" />
			</div>
		</fieldset>
		<h2 id="dnnSitePanel-sssDocumentLibrary" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("DocumentLibrary")%></a></h2>
		<fieldset id="fsDocumentLibrary" runat="server">
			<div class="dnnFormItem">
				<dnn:label id="plEnableDL" runat="server" controlname="chkEnableDL" />
				<asp:CheckBox ID="chkEnableDL" runat="server" />
			</div>
		</fieldset>
	</div>
	<div id="sssOptions" class="sssOptions dnnClear">
		<fieldset>
			<div class="dnnFormItem">
				<dnn:label id="plSearchSpiderIndexPath" runat="server" controlname="txtSearchSpiderIndexPath" text="Spider Index Path:" />
				<asp:TextBox ID="txtSearchSpiderIndexPath" runat="server" />
                <asp:RequiredFieldValidator ID="valSearchIndexPath" ControlToValidate="txtSearchSpiderIndexPath" runat="server" CssClass="dnnFormMessage dnnFormError" ResourceKey="valSpiderIndexPath.ErrorMessage"/>
			</div>
			<div class="dnnFormItem">
				<dnn:label id="plSearchSpiderThreads" runat="server" controlname="txtSearchSpiderThreads" text="Spider Threads:" />
				<asp:TextBox ID="txtSearchSpiderThreads" runat="server" />
			</div>
			<div class="dnnFormItem">
				<dnn:label id="plEncodingMode" runat="server" controlname="ddlEncodingMode" text="Encoding:" />
				<asp:DropDownList ID="ddlEncodingMode" runat="server" />
			</div>
            <div class="dnnFormItem">
                <dnn:label id="plAutoAddAlias" runat="server" controlname="chkAutoAddAlias" text="Auto Add Alias:" />
                <asp:CheckBox ID="chkAutoAddAlias" runat="server" />
            </div>
		</fieldset>
	</div>
	<div id="sssSecurity" class="sssSecurity dnnClear">
		<fieldset id="fsDupeAdd" runat="server" class="dnnFSInfo">
			<dnnweb:DnnGrid id="dgDuplicates" runat="server" AutoGenerateColumns="false">
				<MasterTableView DataKeyNames="Descr">
					<Columns>
						<dnnweb:DnnGridButtonColumn ButtonType="ImageButton" IconKey="Edit" UniqueName="imgEdit" CommandName="EditItem" />
						<dnnweb:DnnGridButtonColumn ButtonType="ImageButton" IconKey="Delete" UniqueName="imgDelete" CommandName="DeleteItem" ButtonCssClass="sssDeleteButton" />
						<dnnweb:DnnGridBoundColumn DataField="Descr" HeaderText="Descr" UniqueName="Descr" />
						<dnnweb:DnnGridTemplateColumn UniqueName="RegexPattern" HeaderText="RegexPattern">
							<ItemTemplate>
								 <%# (DataBinder.Eval(Container.DataItem, "DuplicatePattern_Text")) %>
							</ItemTemplate>
						</dnnweb:DnnGridTemplateColumn>
					</Columns>
				</MasterTableView>
			</dnnweb:DnnGrid>
			<ul class="dnnActions dnnClear">
				<li><asp:LinkButton ID="cmdDupAdd" runat="server" resourcekey="cmdDupAdd" CausesValidation="false" CssClass="dnnSecondaryAction" /></li>
			</ul>
		</fieldset>
		<fieldset id="fsDupeConfig" runat="server">
			<div class="dnnFormItem">
				<dnn:label id="plDupDescr" controlname="txtDupDescr" text="Description:" runat="server" />
				<input type="hidden" id="hidDupDescr" runat="server" name="hidDupDescr" />
				<asp:TextBox ID="txtDupDescr" runat="server" />
				<asp:RequiredFieldValidator ID="valDupeDesc" runat="server" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="Duplicates" ControlToValidate="txtDupDescr" SetFocusOnError="true" resourcekey="valDupeDesc" />
			</div>
			<div class="dnnFormItem">
				<dnn:label id="plDupRegex" controlname="txtDupRegex" text="Regex:" runat="server" />
				<asp:TextBox ID="txtDupRegex" runat="server" CssClass="repTable" TextMode="MultiLine" Rows="5" />
				<asp:RequiredFieldValidator ID="valDupeRegex" runat="server" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="Duplicates" ControlToValidate="txtDupRegex" SetFocusOnError="true" resourcekey="valDupeRegex" />
				<asp:CustomValidator ID="valDup" ControlToValidate="txtDupRegex" runat="server" CssClass="dnnFormMessage dnnValidationSummary" ValidationGroup="Duplicates" />
			</div>
			<ul class="dnnActions">
				<li id="liSaveDupe" runat="server"><asp:LinkButton class="dnnPrimaryAction" ID="cmdSaveDupConfig" runat="server" resourcekey="cmdSaveDupConfig" ValidationGroup="Duplicates" /></li>
				<li id="liUpdateDupe" runat="server"><asp:LinkButton class="dnnPrimaryAction" ID="cmdUpdateDupConfig" runat="server" resourcekey="cmdUpdateDupConfig" ValidationGroup="Duplicates" /></li>
				<li><asp:LinkButton class="dnnSecondaryAction" ID="cmdCancelDupConfig" runat="server" resourcekey="cmdCancelDupConfig" CausesValidation="false" /></li>
			</ul>
		</fieldset>
	</div>
	<ul class="dnnActions dnnClear" id="ulActions" runat="server">
		<li><asp:LinkButton class="dnnPrimaryAction" ID="cmdUpdate" runat="server" resourcekey="cmdUpdate" ValidationGroup="Module" /></li>
	</ul>
</div>
<script type="text/javascript">
/*globals jQuery, window, Sys */
(function ($, Sys) {
	function setupDnnSearchSpiderSettings() {
	    $('#dnnSearchSpiderSettings').dnnTabs()
	        .find('#sssUrls').dnnPanels().end()
			.find('#sssDocuments').dnnPanels().end()
    		.find('.sssDeleteButton').each(function () {
				$(this).dnnConfirm({
					text: '<%= LocalizeString("DeleteItem") %>',
					yesText: '<%= Localization.GetString("Yes.Text", Localization.SharedResourceFile) %>',
					noText: '<%= Localization.GetString("No.Text", Localization.SharedResourceFile) %>',
					title: '<%= Localization.GetString("Confirm.Text", Localization.SharedResourceFile) %>',
					isButton: true
				});
			});

	    $('#sssDocuments .dnnFormExpandContent a').dnnExpandAll({
	        expandText: '<%=Localization.GetString("ExpandAll", Localization.SharedResourceFile)%>',
	        collapseText: '<%=Localization.GetString("CollapseAll", Localization.SharedResourceFile)%>',
	        targetArea: '#sssDocuments'
	    });
	}

	$(document).ready(function () {
		setupDnnSearchSpiderSettings();
		Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
			setupDnnSearchSpiderSettings();
		});
	});
}(jQuery, window.Sys));
</script>