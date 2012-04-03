<%@ Control language="C#" Inherits="DotNetNuke.Professional.UserSwitcher.View" AutoEventWireup="false"  Codebehind="View.ascx.cs" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<div class="dnnForm dnnUserSwitcher dnnClear" ID="dnnUserSwitcher">
	<fieldset class="usContent dnnClear">
		<div class="dnnFormItem">
			<asp:TextBox ID="txtSearch" runat="server" />
			<asp:DropDownList ID="ddlSearchType" runat="server" />
			<asp:LinkButton ID="btnSearch" runat="server" ResourceKey="Search" CssClass="dnnPrimaryAction" />
		</div>
	</fieldset>
	<ul class="usLetterSearch">
		<asp:Repeater ID="rptLetterSearch" runat="server">
			<ItemTemplate>
				<li><asp:HyperLink ID="hlLetter" runat="server" NavigateUrl='<%# FilterURL((string)Container.DataItem,"1") %>' Text='<%# Container.DataItem %>' /></li>
			</ItemTemplate>
		</asp:Repeater>
	</ul>
	<div>
		<asp:DataGrid ID="grdUsers" AutoGenerateColumns="False" GridLines="None" CssClass="dnnUserSwitcherGrid" runat="server">
			<HeaderStyle CssClass="dnnGridHeader" />
			<ItemStyle CssClass="dnnGridItem" />
			<AlternatingItemStyle CssClass="dnnGridAltItem" />
			<EditItemStyle CssClass="dnnFormInput" />
			<SelectedItemStyle CssClass="dnnFormError" />
			<FooterStyle CssClass="dnnGridFooter" />
			<PagerStyle CssClass="dnnGridPager" />
			<Columns>
				<dnn:ImageCommandColumn CommandName="Impersonate" IconKey="Search" EditMode="Command" KeyField="UserID" ShowImage="True" />
				<asp:TemplateColumn>
					<ItemTemplate>
						<dnn:DnnImage ID="imgOnline" runat="server" IconKey="UserOnline" />		
					</ItemTemplate>
				</asp:TemplateColumn>
				<dnn:TextColumn DataField="UserName" HeaderText="Username" />
				<dnn:TextColumn DataField="FirstName" HeaderText="FirstName" />
				<dnn:TextColumn DataField="LastName" HeaderText="LastName" />
				<dnn:TextColumn DataField="DisplayName" HeaderText="DisplayName" />
				<asp:TemplateColumn HeaderText="Address">
					<ItemTemplate>
						<asp:Label runat="server" Text='<%#DisplayAddress(((DotNetNuke.Entities.Users.UserInfo)Container.DataItem).Profile.Unit,((DotNetNuke.Entities.Users.UserInfo)Container.DataItem).Profile.Street, ((DotNetNuke.Entities.Users.UserInfo)Container.DataItem).Profile.City, ((DotNetNuke.Entities.Users.UserInfo)Container.DataItem).Profile.Region, ((DotNetNuke.Entities.Users.UserInfo)Container.DataItem).Profile.Country, ((DotNetNuke.Entities.Users.UserInfo)Container.DataItem).Profile.PostalCode)%>' />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="Email">
					<ItemTemplate>
						<asp:Label runat="server" Text='<%#DisplayEmail(((DotNetNuke.Entities.Users.UserInfo)Container.DataItem).Email)%>' />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="CreatedDate">
					<ItemTemplate>
						<asp:Label runat="server" Text='<%#DisplayDate(((DotNetNuke.Entities.Users.UserInfo)Container.DataItem).Membership.CreatedDate)%>' />
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn HeaderText="LastLogin">
					<ItemTemplate>
						<asp:Label runat="server" Text='<%#DisplayDate(((DotNetNuke.Entities.Users.UserInfo)Container.DataItem).Membership.LastLoginDate)%>' />
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</asp:DataGrid>
		<dnn:PagingControl ID="ctlPagingControl" runat="server" />
	</div>
</div>
