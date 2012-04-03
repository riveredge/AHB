<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_customers_view.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.admin_customers_view" %>
<div>
    <a href="#" onclick="LoadView('admin_customers_list'); return false;">[RESX:Customers]</a>
    > [RESX:Details]
</div>
<div class="dnnForm" id="divCust">
   <h2 id="Panel-CustDetails" class="dnnFormSectionHead"><a href="" class="">[RESX:Customer]</a></h2>
        <div>
        <fieldset>
    	    <legend></legend>
    	    <div class="dnnFormItem">
                <label>[RESX:Name]:</label>
                <input type="text" value="<%= Customer.FirstName%> <%= Customer.LastName%>" />
            </div>
            <div class="dnnFormItem">
                <label>[RESX:DisplayName]:</label>
                <input type="text" value="<%= Customer.DisplayName%>" />
            </div>
            <div class="dnnFormItem">
                <label>[RESX:UserId]:</label>
                <input type="text" value="<%= Customer.UserID%>" />
            </div>
            <div class="dnnFormItem">
                <label>[RESX:UserName]:</label>
                <input type="text" value="<%= Customer.Username%>" />
            </div>
            <div class="dnnFormItem">
                <label>[RESX:Email]:</label>
                <input type="text" value="<%= Customer.Email%>" />
            </div>
            <div class="dnnFormItem">
                <label>[RESX:DateCreated]:</label>
                <input type="text" value="<%= MemberSince%>" />
            </div>
        </fieldset>
   </div>
    <h2 id="Panel-CustHistory" class="dnnFormSectionHead"><a href="" class="">[RESX:OrderHistory]</a></h2>
        <div>
    <fieldset>
        <legend></legend>
             <asp:Repeater ID="rptOrders" runat="server">
			    <HeaderTemplate>
                    <table class="dnn-modcp-grid">
                        <thead>
                            <tr>
                                <td></td>
                                <td>[RESX:OrderNumber]</td>
                                <td style="text-align:center;">[RESX:PurchaseDate]</td>
                                <td style="text-align:center;">[RESX:GrandTotal]</td>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
				<ItemTemplate>
                    <tr>
                        <td></td>
                        <td><a href="#" onclick="LoadView('admin_orders_edit','<%#Eval("OrderId")%>'); return false;"><%# Eval("InvoiceNumber")%></a></td>
                        <td style="text-align:center;"><%# FormatDate(Eval("PurchaseDate").ToString())%></td>
                        <td style="text-align:right;"><%# FormatMoney(Eval("GrandTotal").ToString())%></td>
                    </tr>
                </ItemTemplate>
				<FooterTemplate></tbody></table></FooterTemplate>
			</asp:Repeater>
    </fieldset>
    </div>
     <h2 id="Panel-CustRoles" class="dnnFormSectionHead"><a href="" class="">[RESX:SecurityRoles]</a></h2>
    <div>
     <fieldset>
        <legend></legend>
                  <asp:Repeater ID="rptRoles" runat="server">
			    <HeaderTemplate><table class="dnn-modcp-grid"><thead><tr><td></td><td>[RESX:RoleName]</td><td>[RESX:EffectiveDate]</td><td>[RESX:ExpirationDate]</td></tr></thead><tbody></HeaderTemplate>
				<ItemTemplate>
                    <tr>
                        <td></td>
                        <td><%#Eval("RoleName") %></td>
                        <td style="text-align:center;"><%#FormatDate(Eval("EffectiveDate").ToString()) %></td>
                        <td style="text-align:center;"><%#FormatDate(Eval("ExpiryDate").ToString())%></td>
                    </tr>
                </ItemTemplate>
				<FooterTemplate></tbody></table></FooterTemplate>
			</asp:Repeater>
     </fieldset>
   </div>
</div>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $("#divCust").dnnPanels({ regionToToggleSelector: 'div' });
    });
</script>