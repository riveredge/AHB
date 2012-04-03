<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_products_list.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.admin_products_list" %>
<script type="text/javascript">
    function getProducts() {
        
        var ddlSortCol = document.getElementById('sortColumn');
        var ddlSortDir = document.getElementById('sortDirection');
        var ddlMaxRows = document.getElementById('maxRecords');
        var ddlPaid = document.getElementById('paidStatus');
        var tmp = {};
        tmp.action = 14;
        tmp.query = '';
        ap_callback(JSON.stringify(tmp), listProducts);
    };

    function listProducts(results) {
        $('#prodList').remove('li');
        if (results.length > 0) {
            var row = {};
            for (var i = 0; i < results.length; i++) {
                row = results[i];
                var li = document.createElement('li');
                li.setAttribute('id', row.ProductId);
                var rdiv = document.createElement('div');
                rdiv.className = 'floatRight';
                var spanExp = document.createElement('span');
                spanExp.appendChild(document.createTextNode('[RESX:Price]:' + row.Price));
                rdiv.appendChild(spanExp);
                li.appendChild(rdiv);
                var title = document.createElement('b');
                title.appendChild(document.createTextNode(unescape(row.ProductName) + ' '));
                li.appendChild(title)
                var sku = document.createElement('i');
                sku.appendChild(document.createTextNode(unescape(row.ProductSKU)));
                li.appendChild(sku)

                li.onclick = function () { LoadView('admin_products_edit', this.id); };
                $('#prodList').append(li);
            };
        };
    };
   

</script>
<div class="floatRight buttonArea">
    <a href="#" onclick="LoadView('admin_products_edit'); return false;"  class="btnadd roundall">[RESX:CreateProduct]</a>
</div>
<div>
    <a href="#" onclick="LoadView('admin_products_list'); return false;">[RESX:Products]</a>
</div>
<div style="margin-top:32px;">
<ul id="prodList" class="dnn-modcp-datalist">
</ul>
</div>
<script type="text/javascript">
    $(document).ready(function () {

        getProducts();

    });
  </script>