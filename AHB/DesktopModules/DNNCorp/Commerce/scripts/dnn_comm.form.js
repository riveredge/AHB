dnn_comm.form = {
    hc: 'form-required',
    dc: '',
    pt: 'DIV',
    email: /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/,
    reqs: { 'required': true, 'func': null, 'msg1': '', 'msg2': '', 'msg3': '', 'minlength': 0, 'maxlength': -1, 'match': '', 'compareId': '', 'compareType': '', 'regex': '' },
    BindForm: function (data, prefix) {
        var pref = '';
        if (typeof (prefix) != 'undefined') {
            pref = prefix;
        };
        var missing = '';
        var x = 0;
        for (var p in data) {
            var el = document.getElementById(pref + p);
            if (el != null) {
                switch (el.tagName) {
                    case 'INPUT':
                        switch (el.type) {
                            case 'text':
                                el.value = data[p];
                                break;
                            case 'hidden':
                                el.value = data[p];
                                break;
                            case 'checkbox':
                                el.checked = data[p];
                                break;
                        };
                        break;
                    case 'SELECT':
                        dnn_comm.utils.SetSelected(el.id, data[p]);
                        break;
                    case 'TEXTAREA':
                        el.value = decodeURIComponent(unescape(data[p]));
                        break;
                    case 'SPAN':
                        el.innerHTML = data[p];
                    case 'A':
                        el.innerHTML = data[p];

                };

            } else {
                x += 1
                missing += x + ': ' + pref + p + '\n';
                var elems = document.getElementsByName(pref + p);
                if (elems.length > 0) {
                    for (rd in elems) {
                        if (elems[rd].type == 'radio') {
                            if (elems[rd].value == data[p].toString()) {
                                elems[rd].checked = true;
                                elems[rd].setAttribute('checked', 'checked');
                            } else {
                                elems[rd].checked = false;
                                elems[rd].removeAttribute('checked');
                            };
                        };
                    };
                };

            };

        };
     },
    BuildForm: function (id, data) {
        var ul = document.createElement('ul');
        ul.className = 'am-ui-form';
        for (var p in data) {
            var li = document.createElement('li');
            var label = document.createElement('label');
            label.setAttribute('for', p);
            label.appendChild(document.createTextNode(p));
            li.appendChild(label);
            var tp = typeof (data[p]);
            var inp = document.createElement('input');
            inp.setAttribute('id', p);
            if (tp == 'string' || tp == 'number') {
                inp.setAttribute('type', 'text');
                inp.value = data[p];
            } else if (tp == 'boolean') {
                inp.setAttribute('type', 'checkbox');
                if (data[p] == true) {
                    inp.checked = true;
                };
            };
            li.appendChild(inp);
            ul.appendChild(li);
        };
        var li = document.createElement('li');
        var btnSave = document.createElement('span');
        btnSave.appendChild(document.createTextNode('Save'));
        btnSave.onclick = function () { lm_saveLicenseType(); };
        li.appendChild(btnSave);
        var btnReset = document.createElement('input');
        btnReset.setAttribute('type', 'reset');
        btnReset.value = 'Reset';
        li.appendChild(btnReset);
        ul.appendChild(li);
        document.getElementById(id).appendChild(ul);
    },
    PackageForm: function (prop, prefix) {
        if (typeof (prefix) == 'undefined') {
            prefix = '';
        };
        var missing = '';
        var x = 0;
        var obj = dnn_comm.utils.CreateObject(prop);
        for (var p in obj) {
            var el = document.getElementById(prefix + p);
            if (el !== null) {
                if (el.type == 'text' || el.tagName == 'TEXTAREA' || el.type == 'hidden') {
                    obj[p] = escape(el.value);
                } else if (el.tagName == 'SELECT') {
                    if (el.selectedIndex != -1) {
                        obj[p] = escape(el.options[el.selectedIndex].value);
                    } else {
                        obj[p] = -1;
                    };
                } else {
                    obj[p] = el.checked;
                };
            } else {
                x += 1
                missing += x + ': ' + prefix + p + '\n';
                el = document.getElementsByName(prefix + p);
                if (el.length > 0) {
                    for (rd in el) {
                        if (el[rd].type == 'radio' && el[rd].checked) {
                            obj[p] = el[rd].value;
                        };
                    };
                };
            };
        };
        return obj;
    },
    ShowRequired: function (id) {
        var el = document.getElementById(id);
        //el.focus();
        $('#' + id).parent().removeClass('form-valid').addClass(dnn_comm.form.hc);
        /*if (p.className == '') {
        p.className = dnn_comm.form.hc;
        } else {
        p.className = p.className.replace('form-valid', '');
        if (p.className.indexOf(dnn_comm.form.hc) == -1) {
        p.className += ' ' + dnn_comm.form.hc;
        };
        };*/
    },
    IsValid: function (id) {
        var el = document.getElementById(id);
        var p = dnn_comm.utils.GetParentByTagName(el, dnn_comm.form.pt);
        if (p.className == dnn_comm.form.hc) {
            p.className = '';
        } else {
            p.className = p.className.replace(dnn_comm.form.hc, '');
        };
        el.title = '';
    },
    Validate: function (id, reqs) {
        var options = dnn_comm.utils.CreateObject(dnn_comm.form.reqs);
        if (typeof (reqs) != 'undefined') {
            for (var p in reqs) {
                options[p] = reqs[p];
            };
        };
        var isValid = true;
        var el = document.getElementById(id);
        var val = '';
        if (el.type == 'text' || el.tagName == 'TEXTAREA' || el.type == 'password') {
            val = dnn_comm.utils.Trim(el.value);
        };
        if (el.tagName == 'SELECT') {
            val = el.options[el.selectedIndex].value;
        };
        if (el.type == 'checkbox') {
            val = el.checked;
        };
        if (options.required && val == '') {
            isValid = false;
            el.title = options.msg1;
        };
        if (isValid && val != '') {
            if (val.length < options.minlength) {
                isValid = false;
            };
            if (val.length > options.maxlength && options.maxlength > -1) {
                isValid = false;
            };
            if (options.compareId != '') {
                var cel = document.getElementById(options.compareId);
                var celVal = cel.value;
                if (options.compareType == '') {
                    options.compareType = 'equal';
                };
                if (options.compareType == 'equal') {
                    if (celVal != val) {
                        isValid = false;
                    };
                };
            };
            if (options.match == 'email' && !dnn_comm.form.email.test(val)) {
                isValid = false;
            };
            if (options.regex != '' && val != '') {
                if (!val.match(options.regex)) {
                    isValid = false;
                };
            };
            if (!isValid) {
                el.title = options.msg2;
            };
            if (options.func != null) {
                if (!options.func(id)) {
                    isValid = false;
                    el.title = options.msg3;
                };
            };
        };

        if (!isValid) {
            dnn_comm.form.ShowRequired(el.id);
            //el.onblur = new Function('am.Form.Validate(\'' + el.id + '\',' + JSON.stringify(options) + ')');
        } else {
            dnn_comm.form.IsValid(el.id);
        };
        return isValid;
    }
};