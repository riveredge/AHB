<div id="{id}" style="display:none;" class="modalForm">
    <div class="dnn-modcp-modal-inner" style="height:{height};">
        <div class="dnn-modcp-tabstrip">
        <ul id="{id}Tabs">
                <li id="{id}Tab1">[RESX:Search]</li>
                <li id="{id}Tab2">[RESX:NewUser]</li>
            </ul>
        </div>
        <div class="dnn-modcp-form">
            <div id="{id}Tab1-content" class="dnn-modcp-tab-content">
                <div>[RESX:Search]:<input type="text" id="CustSearch" autocomplete="off" onkeypress="dnn_comm.admin.Search(event,this,'custsearch',custSearch);" value="" style="width:98%;" /></div>
                <div style="height:275px;overflow:auto;">
                <ul id="custsearch" class="dnn-modcp-datalist" style="padding-left:0px;">
                </ul>
                </div>
            </div>
            <div id="{id}Tab2-content" class="dnn-modcp-tab-content">
                <div class="dnnForm">
                <table>
                    <tr>
                        <td>[RESX:UserId]:</td>
                        <td><span id="UserId"></span></td>
                    </tr>
                    <tr>
                        <td>[RESX:FirstName]:</td>
                        <td><input type="text" id="FirstName" value="" class="dnnFormRequired" /></td>
                    </tr>
                    <tr>
                        <td>[RESX:LastName]:</td>
                        <td><input type="text" id="LastName" value="" class="dnnFormRequired" /></td>
                    </tr>
                    <tr>
                        <td>[RESX:Email]:</td>
                        <td><input type="text" id="Email" value="" class="dnnFormRequired" /></td>
                    </tr>
                    <tr>
                        <td>[RESX:Username]:</td>
                        <td><input type="text" id="Username" value="" /></td>
                    </tr>
                    <tr>
                        <td>[RESX:DisplayName]:</td>
                        <td><input type="text" id="DisplayName" value="" /></td>
                    </tr>
                    
                </table>
                    <ul class="dnnActions dnnClear">
                        <li><a href="#" onclick="saveCustomer(); return false;" class="dnnPrimaryAction">[RESX:Save]</a></li>
                        <li><a href="#" onclick="dnn_comm.admin.DialogClose('{id}'); return false;" class="dnnSecondaryAction">[RESX:Cancel]</a></li>
                    </ul>
                </div>
            </div>
            
        </div>
       
    </div>
</div>
<script type="text/javascript">
    function {id}_InitView() {
        dnn_comm.admin.TabsInit('{id}Tabs');
        var wrap = document.getElementById('{id}Tab2-content');
        var els = wrap.getElementsByTagName('input');
        var len = els.length;
        for (var i=0; i < len; i++) {
            var elm = els[i];
            elm.value = '';
        }
    };
    {id}_InitView();
    function saveCustomer() {
        dnn_comm.admin.TabsInit('{id}Tabs');
        var cust = {};
        cust.action = 21;
        cust.UserID = -1;
        cust.Username = document.getElementById('Username').value;
        cust.DisplayName = document.getElementById('DisplayName').value;
        cust.FirstName = document.getElementById('FirstName').value;
        cust.LastName = document.getElementById('LastName').value;
        cust.Email = document.getElementById('Email').value;
        ap_callback(JSON.stringify(cust), saveCustomerComplete);
    };
    function saveCustomerComplete(result) {
        if (typeof(result.UserID) != 'undefined') {
            getCustomerComplete(result);
        };
    };
    function custSearch() {
        var query = document.getElementById('CustSearch').value;
        if (query.length > 2) {
            var tmp = {};
            tmp.action = 20;
            tmp.Search = query;
            ap_callback(JSON.stringify(tmp), searchComplete);
        };
        
    };
    function searchComplete(result) {
        var ul = document.getElementById('custsearch');
        dnn_comm.utils.RemoveChildNodes('custsearch');
        for (var i = 0; i < result.length; i++) {
            var u = result[i];
            var li = document.createElement('li');
            li.setAttribute('id', u.UserID);
            li.onclick = new Function('setCustomer(' + u.UserID + ');');
            var spanTerm = document.createElement('span');
            spanTerm.appendChild(document.createTextNode(u.Email));
            spanTerm.className = 'am-ui-row-property';
            li.appendChild(spanTerm);
            var sp = document.createElement('span');
            sp.className = 'am-ui-row-title';
            sp.appendChild(document.createTextNode(u.FirstName + ' ' + u.LastName + ' (' + u.DisplayName + ')'));
            li.appendChild(sp);
            ul.appendChild(li);
        };
    };    
</script>