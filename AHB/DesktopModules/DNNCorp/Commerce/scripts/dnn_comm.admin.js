if (typeof (dnn_comm) == 'undefined') {
    dnn_comm = {};
};
if (typeof (dnn_comm.admin) == 'undefined') {
    dnn_comm.admin = {};
};
dnn_comm.admin = {
    toggleFilters: function (obj) {
        var d = document.getElementById('searchFilters');
        if (dnn_comm.utils.GetStyle(d.id, 'display') == 'none') {
            d.style.display = 'block';
            obj.className = 'searchToggle_select';
        } else {
            d.style.display = 'none';
            obj.className = 'searchToggle';
        };
    },
    ToggleNav: function (obj) {
        var selClass = 'selected';
        var menu = this.GetParentByTagName(obj, 'DIV');
        var sels = dnn_comm.utils.GetElementsByClassName(selClass, menu);
        for (var i = 0; i < sels.length; i++) {
            var el = sels[i];
            var curClass = el.className;
            curClass = curClass.replace(selClass, '');
            el.className = dnn_comm.utils.Trim(curClass, ' ');
        };

        if (obj.className != '') {
            obj.className += ' ';
        };
        obj.className += selClass;
    },
    GetParentByTagName: function (obj, tag) {
        var cmt = obj;
        var i = 0;
        do {
            cmt = cmt.parentNode;
            i++
        } while (cmt.tagName != tag || i == 100);
        return cmt;
    },
    TabsInit: function (tabStripId) {
        var ul = document.getElementById(tabStripId);
        var items = ul.getElementsByTagName('LI');
        for (var i = 0; i < items.length; i++) {
            var li = items[i];
            li.onclick = new Function('dnn_comm.admin.TabsToggle(this,\'' + tabStripId + '\')');
            var cnt = document.getElementById(li.id + '-content');
            if (cnt != null) {
                cnt.style.display = 'none';
            };
            if (i == 0) {
                this.TabsToggle(li, ul.id);
            };
        };

    },
    TabsToggle: function (obj, tabStripId) {
        var selClass = 'tab-selected';
        var cnt = document.getElementById(obj.id + '-content');
        var sels = dnn_comm.utils.GetElementsByClassName(selClass, tabStripId);
        var currDiv = '';
        for (var i = 0; i < sels.length; i++) {
            var el = sels[i];
            var curClass = el.className;
            curClass = curClass.replace(selClass, '');
            el.className = dnn_comm.utils.Trim(curClass, ' ');
            if (el.tagName == 'DIV') {
                currDiv = el.id;
            } else {
                currDiv = el.id + '-content';
            };
        };

        if (obj.className != '') {
            obj.className += ' ';
        };
        obj.className += selClass;

        //cnt.className += selClass;

        if (currDiv != '') {
            $('#' + currDiv).fadeOut('fast', function () {
                $('#' + cnt.id).fadeIn('fast');
            });
        } else {
            $('#' + cnt.id).show('fast');
        };

        //        cnt.style.display = 'block';
        //        cnt.style.visibility = 'visible';
    },
    ShowMsg: function (text, cls) {
        var w = $('#dnn-modcp-msgarea').parent().css('width');
        $('#dnn-modcp-msgarea div:first')
            .removeClass()
            .addClass(cls)
            .text(text);
        $('#dnn-modcp-msgarea').css('width', w).show('slow');
    },
    HideMsg: function (callback) {

        $("#dnn-modcp-msgarea").hide('fast', function () {
            $('#dnn-modcp-msgarea div:first')
            .removeClass()
            .text();
            if (typeof (callback) === 'function') {
                callback.call(this);
            };
        });


    },
    Search: function (event, obj, ul, callback) {
        var query = obj.value;
        var charCode = (event.which != undefined) ? event.which : event.keyCode;
        var KEY = {
            BACKSPACE: 8,
            TAB: 9,
            RETURN: 13,
            ESC: 27,
            LEFT: 37,
            UP: 38,
            RIGHT: 39,
            DOWN: 40,
            COMMA: 188
        };
        switch (event.keyCode) {
            case KEY.LEFT:
            case KEY.RIGHT:
            case KEY.UP:
            case KEY.DOWN:
            case KEY.BACKSPACE:
                if (query.length >= 1) {
                    setTimeout(function () { callback.call(this); }, 5);
                } else if (query == '') {
                    var ullist = document.getElementById(ul);
                    dnn_comm.utils.RemoveChildNodes(ul);
                };
                break;
            case KEY.TAB:
            case KEY.RETURN:
            case KEY.COMMA:
            case KEY.ESC:
            default:
                if (this.IsPrintableCharacter(charCode) && query.length >= 1) {
                    // set a timeout just long enough to let this function finish.
                    setTimeout(function () { callback.call(this) }, 5);
                };
                break;
        };
    },
    IsPrintableCharacter: function (keycode) {
        if ((keycode >= 48 && keycode <= 90) ||      // 0-1a-z
           (keycode >= 96 && keycode <= 111) ||     // numpad 0-9 + - / * .
           (keycode >= 186 && keycode <= 192) ||    // ; = , - . / ^
           (keycode >= 219 && keycode <= 222)       // ( \ ) '
          ) {
            return true;
        } else {
            return false;
        };
    },
    DialogOpen: function (id, options) {
        var $modal = $('#' + id);
        var width = $modal.width();
        var height = $modal.height();
        var modtitle = document.getElementById(id).getAttribute('title');
        if (typeof (options) != 'undefined') {
            width = options.width;
            height = options.height;
            modtitle = options.title;
        }
        $modal.dialog({
            modal: true,
            autoOpen: true,
            dialogClass: "dnnFormPopup",
            position: "center",
            minWidth: width,
            minHeight: height,
            maxWidth: width,
            maxHeight: height,
            resizable: false,
            closeOnEscape: true,
            title: modtitle,
            close: function (event, ui) {
                $(this).dialog("destroy");
            }
        });
        //.width(width - 11)
        //.height(height - 11);

        if (typeof (options.loadEvent) != 'undefined') {
            eval(options.loadEvent);
        }
    },
    DialogClose: function (id) {
        $("#" + id).dialog("close");
        //$("#" + id).dialog("destroy");
    },
    CheckNumber: function (num, samp) {

        var decType = samp.substring(samp.length - 3, samp.length - 2);
        var numDec = num.substring(num.length - 3, num.length - 2);
        if (numDec != ',' && numDec != '.') {
            num = num + decType + '00';
            numDec = decType;
        };
        if (num.toString().indexOf(',') > -1 || num.toString().indexOf('.') > -1) {
            if (numDec != decType) {
                return false;
            }
        };
        return true;
    },
    CheckCurrency: function (obj, samp) {
        var value = obj.value;
        if (value == '') {
            value = '0';
        };
        if (checkNumber(value, samp)) {
            obj.style.backgroundColor = '';
        } else {
            obj.style.backgroundColor = '#fbc2c4';
        };
    }
};

function ap_callback(data, cb) {
    if (typeof (data) == "object") {
        data = JSON.stringify(data);
    };
    for (var obj in data) {
        data[obj] = encodeURIComponent(data[obj]);
    };
    var http = new XMLHttpRequest();
    var url = '[SERVICESPATH]handlers/adminhelper.ashx?PortalId=[PORTALID]&ModuleId=[MODULEID]&language=[LANGUAGE]';
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
    var req;
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
    } else {
        req = new ActiveXObject("Microsoft.XMLHTTP");
    };
    if (req) {
        var result = '';
        try {
            var url = '[SERVICESPATH]handlers/adminhelper.ashx?PortalId=[PORTALID]&ModuleId=[MODULEID]&language=[LANGUAGE]';
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
AIM = {
    frame: function (c) {
        var n = 'f' + Math.floor(Math.random() * 99999);
        var d = document.createElement('DIV');
        d.innerHTML = '<iframe style="display:none" src="about:blank" id="' + n + '" name="' + n + '" onload="AIM.loaded(\'' + n + '\')"></iframe>';
        document.body.appendChild(d);
        var i = document.getElementById(n);
        if (c && typeof (c.onComplete) == 'function') {
            i.onComplete = c.onComplete;
        }
        return n;
    },
    form: function (f, name) {
        f.setAttribute('target', name);
    },
    submit: function (f, c) {
        AIM.form(f, AIM.frame(c));
        if (c && typeof (c.onStart) == 'function') {
            return c.onStart();
        } else {
            return true;
        }
    },
    loaded: function (id) {
        var i = document.getElementById(id);
        if (i.contentDocument) {
            var d = i.contentDocument;
        } else if (i.contentWindow) {
            var d = i.contentWindow.document;
        } else {
            var d = window.frames[id].document;
        }
        if (d.location.href == "about:blank") {
            return;
        }
        if (typeof (i.onComplete) == 'function') {
            if (d.body !== null) {
                i.onComplete(d.body.innerHTML);
            };
        }
    }
};
dnn_comm.history = {
    Change: function (newLocation, historyData) {
        var historyMsg = (typeof historyData == "object" && historyData != null
		? historyStorage.toJSON(historyData)
		: historyData
	);
        if (newLocation.indexOf("cpview") >= 0) {
            var tmp = newLocation.split("&");
            var view = tmp[0].split("=")[1];
            var param = tmp[1];
            if (param.indexOf('!') >= 0) {
                param = param.replace('params=', '');
            } else {
                param = param.split("=")[1];
            };

            LoadView(view, param);
        };
    },
    Add: function (loc, data) {
        window.dhtmlHistory.add(loc, data);
    },
    Init: function () {
        try {
            window.dhtmlHistory.initialize();
            window.dhtmlHistory.addListener(dnn_comm.history.Change);
        } catch (e) {
        }
        
    }
}
function checkNumber(num, samp) {
    
    var decType = samp.substring(samp.length - 3, samp.length - 2);
    var numDec = num.substring(num.length - 3, num.length - 2);
    if (numDec != ',' && numDec != '.') {
        num = num + decType + '00';
        numDec = decType;
    };
    if (num.toString().indexOf(',') > -1 || num.toString().indexOf('.') > -1) {
        if (numDec != decType) {
            return false;
        }
    };
    return true;
};
function checkCurrency(obj, samp) {
    var value = obj.value;
    if (value == '') {
        value = '0';
    };
    if (checkNumber(value)) {
        obj.style.backgroundColor = '';
    } else {
        obj.style.backgroundColor = '#fbc2c4';
    };
};