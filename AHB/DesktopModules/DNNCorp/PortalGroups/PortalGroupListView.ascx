<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PortalGroupListView.ascx.cs" Inherits="DotNetNuke.Professional.PortalGroups.Views.PortalGroupListView" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<div class="dnnForm dnnPortalGroups dnnClear">
    <div id="noPortalGroupsMessage" runat="server" class="dnnFormMessage dnnFormInfo"><%=LocalizeString("NoPortalGroups") %></div>
    <dnn:DnnGrid ID="groupsGrid" runat="server" AutoGenerateColumns="false" Width="750px" 
        GridLines="None" >
        <MasterTableView DataKeyNames="PortalGroupId">
            <Columns>
                <dnn:DnnGridTemplateColumn UniqueName="EditItem" HeaderStyle-Width="80">
                    <ItemTemplate>
                        <asp:HyperLink ID="editLink" runat="server" CommandName="Edit" >
                            <dnn:DnnImage IconKey="Edit" id="editImage" runat="server" 
                                        AlternateText="<%$ dnnLoc: editPortalGroup %>" 
                                        ToolTip="<%$ dnnLoc: editPortalGroup %>" 
                                        />
                        </asp:HyperLink>
                    </ItemTemplate>
                </dnn:DnnGridTemplateColumn>
                <dnn:DnnGridBoundColumn DataField="PortalGroupName" HeaderText="PortalGroupName" HeaderStyle-Width="200" ItemStyle-Wrap="false" />
                <dnn:DnnGridBoundColumn DataField="PortalGroupDescription" HeaderText="PortalGroupDescription" HeaderStyle-Width="250" ItemStyle-Wrap="false" />
                <dnn:DnnGridBoundColumn DataField="MasterPortalName" HeaderText="MasterPortalName" HeaderStyle-Width="200" ItemStyle-Wrap="false" />
            </Columns>
        </MasterTableView>
    </dnn:DnnGrid>
    <ul id="buttonRow" runat="server" class="dnnActions dnnClear">
	    <li><asp:Hyperlink id="createButton" runat="server" CssClass="dnnPrimaryAction" resourcekey="createPortalGroup" /></li>
    </ul>
    <div id="notEnoughPortalsMessage" runat="server" class="dnnFormMessage dnnFormWarning"><%=LocalizeString("NotEnoughPortals") %></div>
</div>
