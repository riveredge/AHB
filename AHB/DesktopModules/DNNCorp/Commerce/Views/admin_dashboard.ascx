<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_dashboard.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.admin_dashboard" %>
<div class="amcpcontrols">
<table>
    <tr>
       <td valign="top"  style="width:100%">
            <table cellpadding="0" cellspacing="0" class="dashOuter"  style="width:100%">
                <tr>
                    <td class="dashOuterHeader">[RESX:RecentSales]</td>
                </tr>
                <tr>
                    <td><asp:Literal ID="litRecentSales" runat="server" /></td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="dashOuter" style="width:100%">
                <tr>
                    <td class="dashOuterHeader">[RESX:RecentCustomers]</td>
                </tr>
                <tr>
                    <td><asp:Literal ID="litRecentCustomers" runat="server" /></td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="dashOuter" style="width:100%">
                <tr>
                    <td class="dashOuterHeader">[RESX:TopProducts]</td>
                </tr>
                <tr>
                    <td><asp:Literal ID="litTopProducts" runat="server" /></td>
                </tr>
            </table>
            
        </td>
        <td valign="top">
            <table cellpadding="0" cellspacing="0" class="dashOuter" style="width:225px;">
                <tr>
                    <td class="dashOuterHeader">[RESX:QuickLinks]</td>
                </tr>
                <tr>
                    <td>
                        <table class="dashInner" cellpadding="2" style="width:100%">
                            <tr>
                                <td class="dashRow"><a href="javascript:void(0);" onclick="LoadView('admin_products_edit','');">[RESX:AddProducts]</a><br /></td>
                            </tr>
                            <tr>
                                <td class="dashRow"><a href="javascript:void(0);" onclick="LoadView('admin_orders_edit','');">[RESX:CreateInvoice]</a><br /></td>
                            </tr>
                            <tr>
                                <td class="dashRow"><a href="javascript:void(0);" onclick="LoadView('admin_discounts_edit','');">[RESX:CreateDiscount]</a><br /></td>
                            </tr>
                        </table>
                        
                        
                        
                        
                        
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="dashOuter" style="width:225px;">
                <tr>
                    <td class="dashOuterHeader">[RESX:QuickStats]</td>
                </tr>
                <tr>
                    <td><asp:Literal ID="litQuickStats" runat="server" /></td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="dashOuter" style="width:225px;">
                <tr>
                    <td class="dashOuterHeader">[RESX:PendingOrders]</td>
                </tr>
                <tr>
                    <td><asp:Literal ID="litPendingOrders" runat="server" /></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>