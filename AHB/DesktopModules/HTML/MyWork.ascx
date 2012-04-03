<%@ Control language="C#" Inherits="DotNetNuke.Modules.HtmlPro.MyWork" CodeBehind="MyWork.ascx.cs" AutoEventWireup="false"  %>
<%@ Register TagPrefix="dnnweb" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<div class="dnnForm dnnMyWork dnnClear">
	<div class="dnnFormMessage dnnFormInfo"><asp:Label ID="lblMessage" runat="server" resourcekey="lblMessage" /></div>
    <dnnweb:DnnGrid ID="dgTabs" runat="server" AutoGenerateColumns="False" AllowPaging="false" EnableViewState="true" CssClass="dnnGrid">
        <MasterTableView>
            <Columns>
                <dnnweb:DnnGridTemplateColumn HeaderText="Page">
                    <ItemTemplate><%#FormatURL(Container.DataItem)%></ItemTemplate>
                </dnnweb:DnnGridTemplateColumn>
            </Columns>
            <NoRecordsTemplate>
                <div class="dnnFormMessage dnnFormWarning"><asp:Label ID="lblNoRecords" resourcekey="lblNoRecords" runat="server" /></div>
            </NoRecordsTemplate>
        </MasterTableView>
    </dnnweb:DnnGrid>
	<ul class="dnnActions dnnClear"><li><asp:HyperLink id="cmdCancel" runat="server" class="dnnPrimaryAction" resourcekey="cmdCancel" /></li></ul>
</div>