<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_discounts_list.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.admin_discounts_list" %>
<script type="text/javascript">

    function getDiscounts() {
        var query = document.getElementById('txtSearch').value;
        var ddlSortCol = document.getElementById('sortColumn');
        var ddlSortDir = document.getElementById('sortDirection');
        var ddlMaxRows = document.getElementById('maxRecords');
        var tmp = {};
        tmp.action = 50;
        tmp.Search = query;
        tmp.MaxRows = ddlMaxRows.options[ddlMaxRows.selectedIndex].value;
        tmp.SortColumn = ddlSortCol.options[ddlSortCol.selectedIndex].value;
        tmp.SortDirection = ddlSortDir.options[ddlSortDir.selectedIndex].value;
        if (document.getElementById('activeOnly').checked) {
            tmp.ActiveOnly = true;
        } else {
            tmp.ActiveOnly = false;
        };

        ap_callback(JSON.stringify(tmp), buildList);

    };
    function buildList(result) {
        var ul = document.getElementById('ul-discountlist');
        dnn_comm.utils.RemoveChildNodes('ul-discountlist');
        for (var i = 0; i < result.length; i++) {
            var d = result[i];
            var li = document.createElement('li');
            li.setAttribute('id', d.DiscountId);

            li.onclick = new Function('LoadView("admin_discounts_edit",' + d.DiscountId + ');');
            var rdiv = document.createElement('div');
            rdiv.className = 'floatRight';

            var spanTerm = document.createElement('span');
            spanTerm.appendChild(document.createTextNode('[RESX:UsageCount]: ' + d.TotalUsageCount));
            rdiv.appendChild(spanTerm);
            var divclear = document.createElement('div');
            divclear.className = 'clearDiv';
            rdiv.appendChild(divclear);
            var spanTerm = document.createElement('span');
            var disc = d.DiscountAmount;
            if (disc.replace(',','').replace('.') > 0) {
                disc = d.DiscountAmount;
            } else {
                disc = d.DiscountPercent + '%';
            };
            spanTerm.appendChild(document.createTextNode('[RESX:Discount]: ' + disc));
            rdiv.appendChild(spanTerm);
            li.appendChild(rdiv);

            rdiv = document.createElement('div');
            rdiv.className = 'floatRight';
            rdiv.style.marginRight = '20px';
            var spanTerm = document.createElement('span');
            spanTerm.appendChild(document.createTextNode('[RESX:StartDate]: ' + dnn_comm.utils.FormatDate(d.StartDate, dateFormat)));
            rdiv.appendChild(spanTerm);
            var divclear = document.createElement('div');
            divclear.className = 'clearDiv';
            rdiv.appendChild(divclear);
            var spanTerm = document.createElement('span');
            spanTerm.appendChild(document.createTextNode('[RESX:EndDate]: ' + dnn_comm.utils.FormatDate(d.EndDate, dateFormat)));
            rdiv.appendChild(spanTerm);
            li.appendChild(rdiv);

            var sp = document.createElement('b');
            sp.appendChild(document.createTextNode(decodeURIComponent(d.Description)));
            li.appendChild(sp);
            var spanlng = document.createElement('div');
            spanlng.appendChild(document.createTextNode('[RESX:DiscountCode]:' + decodeURIComponent(d.DiscountCode)));
            //spanlng.className = 'am-ui-row-body';
            li.appendChild(spanlng)
            ul.appendChild(li);
        };
    };

    function toggleFilters(obj) {
        var d = document.getElementById('searchFilters');
        if (dnn_comm.utils.GetStyle(d.id, 'display') == 'none') {
            d.style.display = 'block';
            obj.className = 'searchToggle_select';
        } else {
            d.style.display = 'none';
            obj.className = 'searchToggle';
        };
    };
</script>
<div class="floatRight buttonArea">
    <a href="#" onclick="LoadView('admin_discounts_edit'); return false;"  class="btnadd roundall">[RESX:CreateDiscount]</a>
</div>
<div>
    <a href="#" onclick="LoadView('admin_discounts_list'); retrun false;">[RESX:Discounts]</a>
</div>
    <table class="searchbox">
        <tr>
            <td class="searchinput">
                <input type="text" id="txtSearch" value="" autocomplete="off" onkeypress="dnn_comm.admin.Search(event,this,'ul-discountlist', getDiscounts);" /></td>
           <td class="searchbutton" onclick="getDiscounts();"><span>[RESX:Search]</span></td><td style="position:absolute;"><span onclick="toggleFilters(this);" class="searchToggle"></span> <div id="searchFilters">
        [RESX:ActiveOnly]:<input type="checkbox" id="activeOnly" checked="checked" onclick="getDiscounts();" />
        [RESX:SortColumn]:<select id="sortColumn" onchange="getDiscounts();"><option value="DateCreated">[RESX:DateCreated]</option><option value="DiscountCode">[RESX:DiscountCode]</option><option value="Description">[RESX:Description]</option></select>
        [RESX:SortDirection]:<select id="sortDirection" onchange="getDiscounts();"><option value="ASC">[RESX:ASC]</option><option value="DESC">[RESX:DESC]</option></select>
        [RESX:MaxRecords]:<select id="maxRecords" onchange="getDiscounts();"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select>
    </div></td>
        </tr>
    </table>
    <ul class="dnn-modcp-datalist" id="ul-discountlist"></ul>
    
<script type="text/javascript">
    getDiscounts();
</script>