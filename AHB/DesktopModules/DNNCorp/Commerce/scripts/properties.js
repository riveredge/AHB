var ap_prop = {
    PropertyDefId: -1,
    ObjectType: 0,
    ObjectOwnerKey: '',
    PropertyName: '',
    DataType: 'text',
    IsRequired: false,
    ValidationExpression: '',
    SortPriority: 0,
    DefaultValue: '',
    Label: '',
    IsEnabled: true
};

var ap_prop_temp = {};
var ap_prop_data = [];
function apadmin_saveProperty() {
    var tmp = apadmin_getPropertyInput();
    if (typeof (tmp) != 'undefined') {
        tmp.action = 7;
        ap_callback(JSON.stringify(tmp), apadmin_savePropertyComplete);
    };
};
function apadmin_savePropertyComplete(result) {
    apadmin_cancelPropForm();
    apadmin_getProperties();
};
function apadmin_getPropertyInput() {
    var prop = dnn_comm.form.PackageForm(ap_prop);
    if (prop.PropertyName.trim() == '') {
        return;
    };
    if (prop.DataType.indexOf('list') >= 0) {
        var lname = document.getElementById('drpLists');
        if (lname.options.length == 0) {
            return;
        } else {
            prop.DataType += '|' + lname.options[lname.selectedIndex].value;
        };
    }  
    prop.ValidationExpression = encodeURIComponent(escape(prop.ValidationExpression));
    prop.Label = encodeURIComponent(escape(prop.Label));
    prop.PropertyName = encodeURIComponent(escape(prop.PropertyName));
    return prop;
};
function apadmin_getProperties(objectType,objectKey) {
    var ul = document.getElementById('proplist');
    ul.style.display = 'block';
    if (typeof (objectType) == 'undefined') {
        objectType = document.getElementById('ObjectType').value;
    };
    if (typeof (objectKey) == 'undefined') {
        objectKey = document.getElementById('ObjectOwnerKey').value;
    };
    ap_prop.ObjectOwnerKey = objectKey;
    document.getElementById('ObjectOwnerKey').value = objectKey;
    apadmin_cancelPropForm()
    var req = {};
    req.action = 9;
    req.ObjectType = objectType;
    req.ObjectOwnerKey =  objectKey;
    ap_callback(JSON.stringify(req), apadmin_buildProperties);
};
function apadmin_buildProperties(result) {
    ap_prop_data = result;
    var ul = document.getElementById('proplist');
    var licur = dnn_comm.utils.GetElementsByClassName('candrag');

    if (typeof (licur) != 'undefined') {
        var cn = licur.length;

        for (var x = 0; x < cn; x++) {
            var el = licur[x];
            var p = el.parentNode;

            if (typeof (p) != 'undefined') {
                p.removeChild(el);
            };
        };
    };

    var p = {};
    for (var i = 0; i < ap_prop_data.length; i++) {
        p = ap_prop_data[i];
        var l = createLI(p);
        ul.appendChild(l);

    };
    var options = {
        itemHoverClass: 'myItemHover',
        dragTargetClass: 'myDragTarget',
        dropTargetClass: 'myDropTarget',
        useDefaultDragHandle: true
    };
    if (ap_prop_data.length > 1) {
        var lists = jQuery('#proplist').ListReorder(options);
        lists.bind('listorderchanged', function (evt, jqList, listOrder) {
            var props = '';
            for (var i = 0; i < listOrder.length; i++) {
                var idx = listOrder[i];
                var tmpprop = ap_prop_data[idx];
                if (tmpprop.SortOrder != i) {
                    ap_prop_data[idx]['SortOrder'] = i;
                    props += tmpprop.PropertyDefId + '|' + i + '^';
                };
            };
            if (props.length > 0) {
                var tmp = {};
                tmp.action = 10;
                tmp.props = props;
                ap_callback(JSON.stringify(tmp), apadmin_sortSaveComplete);
            };

        });
    }
};
function apadmin_sortSaveComplete(sender, result) {
    return;
};

function apadmin_cancelPropForm() {
    ap_prop_temp = dnn_comm.utils.CreateObject(ap_prop);
    dnn_comm.form.BindForm(ap_prop);
    dnn_comm.admin.DialogClose('propview');
    

};
function createLI(prop) {
    var l = document.createElement('li');
    l.setAttribute('id', prop.PropertyDefId);
    l.setAttribute('class', 'candrag am-ui-roundall');
    var dr = document.createElement('span');
    if (prop.IsEnabled) {
        dr.className = 'row-title';
    } else {
        dr.className = 'row-title disabled';
    }
    
    dr.appendChild(document.createTextNode(unescape(prop.PropertyName)));
    l.appendChild(dr);
    l.onclick = function () { apadmin_loadPropForm(this); };
    
    return l;
};
function apadmin_deleteProp() {
    if (confirm('[RESX:WARN:DeleteProperty]')) {
        var tmp = {};
        tmp.action = 8;
        tmp.PropertyDefId = document.getElementById('PropertyDefId').value;
        ap_callback(JSON.stringify(tmp), apadmin_getProperties);
    };
};
function apadmin_loadPropForm(obj) {
    if (typeof (obj) != 'undefined') {
        for (var prop in ap_prop_data) {
            if (ap_prop_data[prop].PropertyDefId == obj.id) {
                ap_prop_temp = ap_prop_data[prop];
            };
        };
    } else {
    ap_prop_temp = ap_prop;
    };
 

    if (typeof (ap_prop_temp) != 'undefined') {
        ap_prop_temp.ValidationExpression = decodeURIComponent(ap_prop_temp.ValidationExpression)
        ap_prop_temp.Label = unescape(ap_prop_temp.Label);
        ap_prop_temp.PropertyName = unescape(ap_prop_temp.PropertyName);
        dnn_comm.form.BindForm(ap_prop_temp);
        var enabledNo = document.getElementById('IsEnabledNo');
        var enabledYes = document.getElementById('IsEnabled');
        if (ap_prop_temp.IsEnabled) {
            enabledNo.checked = false;
            enabledYes.checked = true;
            enabledNo.removeAttribute('checked');
            enabledYes.setAttribute('checked', 'checked');

        } else {
            enabledNo.checked = true;
            enabledYes.checked = false;
            enabledNo.setAttribute('checked', 'checked');
            enabledYes.removeAttribute('checked');
        }
        var li = dnn_comm.utils.GetParentByTagName(document.getElementById('DataType'), 'DIV');
        var tr = li.nextSibling;
        if (typeof (tr.tagName) == 'undefined') {
            tr = li.nextSibling.nextSibling;
        };
        tr.style.display = 'none';
        if (ap_prop_temp.DataType.indexOf("|") > 0) {
            var datatype = ap_prop_temp.DataType.split('|')[0];
            var list = ap_prop_temp.DataType.split('|')[1];
            dnn_comm.utils.SetSelected('DataType', datatype);
            apadmin_propDataTypeChange(list);

        } else {
            dnn_comm.utils.SetSelected('DataType', ap_prop_temp.DataType);
        };
        dnn_comm.admin.DialogOpen('propview', propEditModalOptions);
    };
};
function apadmin_LoadPropForm() {
    ap_prop_temp = dnn_comm.utils.CreateObject(ap_prop);
    dnn_comm.form.BindForm(ap_prop_temp);
    dnn_comm.admin.DialogOpen('propview', propEditModalOptions);
};