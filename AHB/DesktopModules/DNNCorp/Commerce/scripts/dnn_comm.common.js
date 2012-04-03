function ap_attachToolTip(id) {
    var t = document.getElementById(id);
    var p = t.parentNode;
    $('#' + id).next().mouseout(function () {
        dnn_comm.tooltip.hide();
    }).mouseover(function () {
        ap_showtip.show(id);
    });
};
var ap_showtip = function () {
    var pos;
    return {
        show: function (id, cls) {
            if (typeof (cls) == 'undefined') {
                cls = 'dnnCart-tooltip-default';
            };
            var obj = document.getElementById(id);
            if ($('#' + id).parent('.form-required').length > 0) {
                cls = 'dnnCart-tooltip-warn';
            }
            if (obj.title != '') {
                var offsetY = -30;
                var offsetX = obj.offsetWidth - 195;
                var pos = $(obj).position(); // dnn_comm.utils.GetPosition(obj);
                pos.top = pos.top - offsetY;
                pos.left = pos.left + offsetX;
                dnn_comm.tooltip.show(obj.title, pos.top, pos.left, obj, cls);
            };
        }
    };
} ();
function ap_processRegForm() {
    var isValid = true;
    if (!dnn_comm.form.Validate('apreg_Username', { 'required': true, 'minlength': 2 })) {
        isValid = false;
    };
    if (!dnn_comm.form.Validate('apreg_Password', { 'required': true, 'minlength': 6 })) {
        isValid = false;
    };
    if (!dnn_comm.form.Validate('apreg_PasswordConfirm', { 'required': true, 'minlength': 6, 'compareId': 'apreg_Password' })) {
        isValid = false;
    };
    if (!dnn_comm.form.Validate('apreg_Email', { 'required': true, 'minlength': 5, 'match': 'email' })) {
        isValid = false;
    };
    if (isValid) {
        var hid = document.createElement('input');
        hid.setAttribute('type', 'hidden');
        hid.setAttribute('name', 'apreg');
        hid.value = 'true';
        document.forms[0].appendChild(hid);
        document.forms[0].submit();
    } else {
        alert('Not Valid');
    };
};
function ap_processLogin() {
    var isValid = true;
    if (!dnn_comm.form.Validate('aplogin_Username', { 'required': true, 'minlength': 2 })) {
        isValid = false;
    };
    if (!dnn_comm.form.Validate('aplogin_Password', { 'required': true, 'minlength': 6 })) {
        isValid = false;
    };
    if (isValid) {
        var hid = document.createElement('input');
        hid.setAttribute('type', 'hidden');
        hid.setAttribute('name', 'aplogin');
        hid.value = 'true';
        document.forms[0].appendChild(hid);
        document.forms[0].submit();
    } else {
        alert('Not Valid');
    };
};
function ap_callback(data, cb) {
    var hid = document.getElementById('amapck');
    if (hid != null) {
        data += '&amapck=' + encodeURIComponent(hid.value);
    };
    
    var http = new XMLHttpRequest();
    var url = '[SERVICESPATH]handlers/services.ashx?PortalId=[PORTALID]&ModuleId=[MODULEID]';
    http.open('POST', url, true);
    http.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
    http.onreadystatechange = function () {
        if (http.readyState == 4 && http.status == 200) {
            try {
                var result = '';
                if (http.responseText != '') {
                     if (http.responseText.indexOf('[') == 0 || http.responseText.indexOf('{') == 0) {
                        result = JSON.parse(http.responseText);
                    } else {
                        result = http.responseText;
                    };

                };
                if (cb != null) {
                    cb(result);
                };

            } catch (err) {
                alert(err.message + '\n' + http.responseText);
            };
        };
    };
    http.send(data);
};
function ap_callback_synch(data) {
    var hid = document.getElementById('amapck');
    if (hid != null) {
        data += '&amapck=' + encodeURIComponent(hid.value);
    };
    var req;
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
    } else {
        req = new ActiveXObject("Microsoft.XMLHTTP");
    };
    if (req) {
        var result = '';
        try {
            var url = '[SERVICESPATH]handlers/services.ashx?PortalId=[PORTALID]&ModuleId=[MODULEID]';
            req.open("POST", url, false);
            req.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
            req.send(data);
            result = req.responseText;
            return JSON.parse(req.responseText);
        } catch (err) {
            alert(err.message + '\n' + req.responseText);
        };

    } else {
        return false;
    };
};
function addItem(sku) {
    var q = 0;
    if (typeof (sku) != 'undefined') {
        q = 1;
        var qi = document.getElementById('qty' + sku);
        if (qi != null && qi.value > 0) {
            q = qi.value;
        };
    };
    if (q > 0) {
        var url = window.location.href;
        if (url.indexOf('?') == -1) {
            url += '?';
        } else {
            url += '&';
        };
        url += 'prodadd=' + encodeURIComponent(sku) + '&apqty=' + q;
        window.location.href = url;
    };
};
function ap_processAccount(obj) {
    var isValid = true;
    if (document.getElementById('apship_Name') != null) {
        if (typeof (formdefs['apbill']) != 'undefined') {
            for (var p in formdefs['apbill']) {
                var el = document.getElementById('apship_' + p);
                if (el != null) {
                    if (!ap_Validate(el, formdefs['apbill'][p], false)) {
                        isValid = false;
                    };
                };
            };
        };
        if (isValid) {
            var hid = document.createElement('input');
            hid.setAttribute('type', 'hidden');
            hid.setAttribute('name', 'apship');
            hid.value = 'true';
            document.forms[0].appendChild(hid);
        };
    };
    if (isValid) {
        ap_proccessForm(obj);
    };
    

};
function ap_proccessForm(obj) {
    var prefix = obj.id.substring(0, obj.id.indexOf('_'));
    var val = { 'required': false };
    var isValid = true;
    if (typeof (formdefs[prefix]) != 'undefined') {
        for (var p in formdefs[prefix]) {
            var el = document.getElementById(prefix + '_' + p);
            if (el != null) {
                if (!ap_Validate(el, formdefs[prefix][p], false)) {
                    isValid = false;
                };
            };
        };
    };
    if (isValid) {
        var hid = document.createElement('input');
        hid.setAttribute('type', 'hidden');
        hid.setAttribute('name', prefix);
        hid.value = 'true';
        document.forms[0].appendChild(hid);
        dnn_comm.utils.DivToModal('ap-wait');
        document.forms[0].submit();
    } else {
       //alert('Not Valid');
    };
};

function ap_Validate(obj, def, onlyDirty) {
    var val = { 'required': false };
    var isdirty = false;
    var prefix = obj.id.substring(0, obj.id.indexOf('_'));
    if (typeof (obj.getAttribute('isdirty')) != 'undefined') {
        isdirty = obj.getAttribute('isdirty');
    };
    if (typeof (onlyDirty) == 'undefined') {
        onlyDirty = true;
    };
    if ((isdirty && onlyDirty) || !onlyDirty) {
        if (typeof (def) == 'undefined') {
            if (typeof (formdefs[prefix]) != 'undefined') {
                var k = obj.id.replace(prefix + '_', '');
                val = formdefs[prefix][k]
            };
        } else {
            val = def;
        };
        $(obj).parent().removeClass('form-valid');
         if (dnn_comm.form.Validate(obj.id, val)) {
            $(obj).parent().addClass('form-valid').removeClass('form-required');
            obj.setAttribute('isdirty', 'false');
            return true;
        } else {
            ap_attachToolTip(obj.id);
            ap_showtip.show(obj.id);
            return false;
        };
    };
};
function ap_fieldaccess(obj) {
    var prefix = obj.id.substring(0, obj.id.indexOf('_'));
    var val = { 'required': false };

    if (typeof (formdefs[prefix]) != 'undefined') {
        var k = obj.id.replace(prefix + '_', '');
        if (typeof (formdefs[prefix][k]) != 'undefined') {
            val = formdefs[prefix][k];
        };
    };

    //if (val.required == true) {
    obj.setAttribute('isdirty', true);
    $(obj).parent().removeClass('form-valid');
    //};

};