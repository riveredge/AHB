<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_orders_list.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.admin_orders_list" %>
<script type="text/javascript">
    function getOrders() {
        var query = document.getElementById('txtSearch').value;
        var ddlSortCol = document.getElementById('sortColumn');
        var ddlSortDir = document.getElementById('sortDirection');
        var ddlMaxRows = document.getElementById('maxRecords');
        var ddlPaid = document.getElementById('paidStatus');
        var tmp = {};
        tmp.action = 44;
        tmp.Search = query;
        tmp.MaxRows = ddlMaxRows.options[ddlMaxRows.selectedIndex].value;
        tmp.SortColumn = ddlSortCol.options[ddlSortCol.selectedIndex].value;
        tmp.SortDirection = ddlSortDir.options[ddlSortDir.selectedIndex].value;
        tmp.PaidOnly = ddlPaid.options[ddlPaid.selectedIndex].value;
        ap_callback(JSON.stringify(tmp), listOrders);
    };
    
    function listOrders(results) {
        var ul = document.getElementById('ul-orderlist');
        dnn_comm.utils.RemoveChildNodes('ul-orderlist');
        if (results.length > 0) {
            var row = {};
            for (var i = 0; i < results.length; i++) {
                row = results[i];
                var li = document.createElement('li');
                li.setAttribute('id', row.OrderId);
                var rdiv = document.createElement('div');
                rdiv.className = 'floatRight';
                var spanExp = document.createElement('span');
                spanExp.appendChild(document.createTextNode('[RESX:PurchaseDate]:' + row.PurchaseDate));
                rdiv.appendChild(spanExp);
                var divclear = document.createElement('div');
                divclear.className = 'clearDiv';
                rdiv.appendChild(divclear);
                var spanExp = document.createElement('span');
                spanExp.appendChild(document.createTextNode('[RESX:Paid]:'));
                if (row.IsPaid) {
                    spanExp.className = 'paid-icon';
                } else {
                    spanExp.className = 'notpaid-icon';
                };
                rdiv.appendChild(spanExp);
                li.appendChild(rdiv);


                var title = document.createElement('div');
                title.appendChild(document.createTextNode(row.InvoiceNumber + ' - ' + row.CustomerName));
                li.appendChild(title)
                var spanlng = document.createElement('span');
                spanlng.appendChild(document.createTextNode('[RESX:GrandTotal]:' + row.GrandTotal));
                li.appendChild(spanlng)
                li.onclick = function () { LoadView('admin_orders_edit', this.id); };
                ul.appendChild(li);
            };
        };

    };
    
    
</script>
<div class="floatRight buttonArea">
    <a href="#" onclick="LoadView('admin_orders_edit'); return false;"  class="btnadd roundall">[RESX:CreateOrder]</a>
</div>

    <table class="searchbox">
        <tr>
            <td class="searchinput">
                <input type="text" id="txtSearch" value="" autocomplete="off" onkeypress="dnn_comm.admin.Search(event,this,'ul-orderlist',getOrders);"  /></td>
           <td class="searchbutton" onclick="getOrders();"><span>[RESX:Search]</span></td>
           <td style="position:absolute;"><span onclick="dnn_comm.admin.toggleFilters(this);" class="searchToggle"></span> 
           <div id="searchFilters">
            <table>
                <tr>
                    <td style="width:25%;">[RESX:Status]:</td>
                    <td style="width:25%;">[RESX:SortColumn]:</td>
                    <td style="width:25%;">[RESX:SortDirection]:</td>
                    <td style="width:25%;">[RESX:MaxRecords]:</td>
                </tr>
                <tr>
                    <td><select id="paidStatus" onchange="getOrders();" style="width:90%;"><option value="-1">[RESX:All]</option><option value="1">[RESX:Paid]</option><option value="0">[RESX:NotPaid]</option></select></td>
                    <td><select id="sortColumn" onchange="getOrders();"><option value="PurchaseDate">[RESX:PurchaseDate]</option><option value="InvoiceNumber">[RESX:InvoiceNumber]</option><option value="CustomerName">[RESX:CustomerName]</option></select></td>
                    <td><select id="sortDirection" onchange="getOrders();"><option value="ASC">[RESX:ASC]</option><option value="DESC" selected="selected">[RESX:DESC]</option></select></td>
                    <td><select id="maxRecords" onchange="getOrders();"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select></td>
                </tr>
            </table>     
        
        
        
    </div></td>
        </tr>
    </table>
    <ul class="dnn-modcp-datalist" id="ul-orderlist"></ul>
    
<script type="text/javascript">
    getOrders();
</script>
