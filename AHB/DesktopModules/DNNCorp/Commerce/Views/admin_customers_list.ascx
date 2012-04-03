<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_customers_list.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.admin_customers_list" %>
<script type="text/javascript">
    function getCustomers() {
        var o = {};
        o.action = 20;
        o.Search = document.getElementById('txtSearch').value;
        ap_callback(JSON.stringify(o), listCustomers);
    };
    function listCustomers(results) {
        var ul = document.getElementById('ul-custlist');
        dnn_comm.utils.RemoveChildNodes('ul-custlist');
        if (results.length > 0) {
            var row = {};
            for (var i = 0; i < results.length; i++) {
                row = results[i];
                var li = document.createElement('li');
                li.setAttribute('id', row.UserID);
                var span = document.createElement('b');
                span.appendChild(document.createTextNode(row.FirstName + ' ' + row.LastName + '  (' + row.DisplayName + ')'));
                li.appendChild(span)
                var spanlng = document.createElement('div');
                spanlng.appendChild(document.createTextNode(row.Username));
                li.appendChild(spanlng)
                var spanlng = document.createElement('div');
                spanlng.appendChild(document.createTextNode(row.Email));
                li.appendChild(spanlng)
                li.onclick = function () { loadCustomer(this.id); };
                ul.appendChild(li);
            };
        };
    };
    function loadCustomer(cid) {
        LoadView('admin_customers_view', cid);
    };
</script>
    <table class="searchbox">
        <tr>
            <td class="searchinput">
                <input type="text" id="txtSearch" value="" autocomplete="off" onkeypress="dnn_comm.admin.Search(event,this,'ul-custlist', getCustomers);" /></td>
           <td class="searchbutton" onclick="getCustomers();"><span>[RESX:Search]</span></td></tr></table>
    <ul class="dnn-modcp-datalist" id="ul-custlist"></ul>