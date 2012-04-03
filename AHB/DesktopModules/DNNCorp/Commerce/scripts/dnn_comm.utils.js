if (typeof (dnn_comm) == 'undefined') {
	dnn_comm = {};
};
if (typeof (dnn_comm.utils) == 'undefined') {
	dnn_comm.utils = {};
};
dnn_comm.utils = {
	GetStyle: function (id, propName) {
		var x = document.getElementById(id);
		var y = '';
		if (x.currentStyle) {
			y = x.currentStyle[propName];
		} else if (window.getComputedStyle) {
			y = document.defaultView.getComputedStyle(x, null).getPropertyValue(propName);
		};
		return y;
	},
	CreateObject: function (obj) {
		var func = function () { };
		func.prototype = obj;
		return new func();
	},
	Callback: function (data, url, cb) {
		if (typeof (data) == 'Object') {

			data = JSON.stringify(data);
		};

		var http = new XMLHttpRequest();
		if (url == '') {
			url = window.location.href;
			if (url.indexOf('#') > 0) {
				url = url.substring(0, url.indexOf('#'));
			}
		};
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
	},
	RemoveChildNodes: function (id) {
		var p = document.getElementById(id);
		if (p.hasChildNodes()) {
			while (p.childNodes.length >= 1) {
				p.removeChild(p.firstChild);
			};
		};
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
	Trim: function (str, chars) {
		return this.LTrim(this.RTrim(str, chars), chars);
	},
	LTrim: function (str, chars) {
		chars = chars || "\\s";
		return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
	},
	RTrim: function (str, chars) {
		chars = chars || "\\s";
		return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
	},
	GetElementsByClassName: function (clsName, parent) {
		var retVal = new Array();
		var elements;
		if (typeof (parent) == 'undefined') {
			elements = document.getElementsByTagName("*");
		} else if (typeof (parent) == 'string') {
			parent = document.getElementById(parent);
			elements = parent.getElementsByTagName("*");
		} else {
			elements = parent.getElementsByTagName("*");
		};
		for (var i = 0; i < elements.length; i++) {
			if (elements[i].className.indexOf(" ") >= 0) {
				var classes = elements[i].className.split(" ");
				for (var j = 0; j < classes.length; j++) {
					if (classes[j] == clsName) {
						retVal.push(elements[i]);
					};
				};
			} else if (elements[i].className == clsName) {
				retVal.push(elements[i]);
			};
		};
		return retVal;
	},
	GetGuid: function () {
		return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
			var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
			return v.toString(16);
		}).toUpperCase();
	},
	OnlyNumbers: function (evt) {
		var charCode = (evt.which != undefined) ? evt.which : evt.keyCode;
		if (charCode > 31 && (charCode < 48 || charCode > 57) && (charCode != 46 && charCode != 44 && charCode != 45)) {
			return false;
		};
		return true;
	},
	SetSelected: function (obj, value) {
		var drp;
		if (typeof (obj) == 'object') {
			drp = obj;
		} else {
			drp = document.getElementById(obj);
		};
		for (var x = 0; x < drp.options.length; x++) {
			if (drp.options[x].value == value) {
				drp.options[x].setAttribute('selected', 'selected');
				drp.selectedIndex = x;
			} else {
				drp.options[x].removeAttribute('selected');
			};
		};
	},
	FormatDate: function (d, f) {
		d = new Date(d);
		return f.replace(/(yyyy|MMMM|MMM|MM|M|dddd|ddd|dd|d|hh|h|HH|mm|m|ss|s|tt|t)/gi,
			function ($1) {
				switch ($1) {
					case 'yyyy': return d.getFullYear();
					case 'M': return (d.getMonth() + 1);
					case 'MM': return (d.getMonth() + 1);
					case 'd': return d.getDate();
					case 'dd': return d.getDate();
					case 'h': return ((h = d.getHours() % 12) ? h : 12);
					case 'm': return d.getMinutes();
					case 's': return d.getSeconds();
					case 'tt': return d.getHours() < 12 ? 'AM' : 'PM';
					case 't': return d.getHours() < 12 ? 'a' : 'p';
				}
			}
		);
	},
	FormatCurrency: function (num, curr, showSymbol) {
		if (typeof (am.currency) == 'undefined') {
			if (curr == '') {
				curr = 'usd';
			};
		} else {
			curr = am.currency;
		};
		
		if (num.toString().indexOf(',') > -1 && curr != 'usd') {
			return num;
		};
		var symbPrefix = '$';
		var symbSuffix = '';
		var dec = '.';
		var group = ',';
		if (curr == 'eur') {
			symbPrefix = '';
			symbSuffix = ' €'
			dec = ',';
			group = '.';
		} else if (curr == 'gbp') {
			symbPrefix = '£';
			symbSuffix = '';
			dec = '.';
			group = ',';

		};
		if (showSymbol == false) {
			symbPrefix = '';
			symbSuffix = '';
		};
		num = num.toString().replace(/\$|\,/g, '');
		if (isNaN(num)) {
			num = "0";
		};
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num * 100 + 0.50000000001);
		cents = num % 100;
		num = Math.floor(num / 100).toString();
		if (cents < 10) {
			cents = "0" + cents;
		};
		for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++) {
			num = num.substring(0, num.length - (4 * i + 3)) + group + num.substring(num.length - (4 * i + 3));
		};
		return (((sign) ? '' : '-') + symbPrefix + num + dec + cents + symbSuffix);
	},
	ObjectToParams: function (obj) {
		var out = '';
		for (var p in obj) {
			out += p + '=' + encodeURIComponent(obj[p]) + '&';
		};
		out = out.substring(0, out.length - 1);
		return out;
	},
	GetScroll: function () {
		var w = document.body.scrollWidth || document.body.scrollLeft || document.documentElement.scrollLeft;
		w = w ? w : 0;
		var h = document.body.scrollHeight || document.body.scrollTop || document.documentElement.scrollTop;
		h = h ? h : 0;
		return { "h": h, "w": w };
	},
	GetViewPort: function () {
		var w = 0;
		var h = 0;
		if (window.innerHeight != window.undefined) {
			h = window.innerHeight;
		} else if (document.compatMode == 'CSS1Compat') {
			h = document.documentElement.clientHeight;
			w = document.documentElement.clientWidth;
		} else if (document.body) {
			h = document.body.clientHeight;
			w = document.body.clientWidth;
		};
		if (window.innerWidth != window.undefined && w == 0) {
			w = window.innerWidth;
		};
		return { "h": h, "w": w };
	},
	DivToModal: function (id) {
		var div = jQuery('#' + id);
		var cmt = document.getElementById(id);
		var i = 0;
		do {
			cmt = cmt.parentNode;
			i++
		} while (cmt.style.position == 'relative' || i == 1000 || cmt.tagName == 'body');

		var winH = $(cmt).height();
		var winW = $(cmt).width();

		div.css('top', ((winH - div.outerHeight()) / 2) + jQuery(cmt).scrollTop() + "px");
		$('#' + id).css('left', (winW / 2) - ($('#' + id).width() / 2));
		$('#' + id).fadeIn();
	},
	CloseDiv: function (id) {
		$('#' + id).fadeOut();
	},
	BuildList: function (result, templateId, rowid) {
		var temp = document.getElementById(templateId);
		var p = temp.parentNode;
		for (var i = 0; i < result.length; i++) {
			var row = result[i];
			var tr = temp.cloneNode(true);
			tr = this.Bind(row, tr);
			tr.style.display = '';
			tr.style.visibility = 'visible';
			tr.id = row[rowid];
			p.appendChild(tr);
		};
	},
	GetPosition: function (obj) {
		var left = 0;
		var top = 0;
		while (obj.offsetParent) {
			left += obj.offsetLeft;
			top += obj.offsetTop;
			obj = obj.offsetParent;
		}
		left += obj.offsetLeft;
		top += obj.offsetTop;
		return { x: left, y: top };
	},
	Bind: function (obj, elem) {
		for (var i = 0; i < elem.childNodes.length; i++) {
			var child = elem.childNodes[i];
			if (typeof (child.tagName) != 'undefined') {
				var tmp = child.innerHTML;

				if (typeof (tmp) != 'undefined') {
					tmp = decodeURIComponent(tmp);
					for (var p in obj) {
						if (tmp.indexOf(p) > 0) {
							tmp = tmp.replace('{' + p + '}', decodeURIComponent(obj[p]));
						};
					};
					if (child.className == 'dnn-modcp-money') {
						tmp = this.FormatCurrency(tmp, '', true);
					};
					elem.childNodes[i].innerHTML = tmp;
				};
			};
		};
		return elem;
	},
	addOption: function (select, text, value, obj) {
		var dd;
		if (select == '') {
			dd = obj;
		} else {
			dd = document.getElementById(select);
		};
		if (document.all) {
			dd.options.add(new Option(text, value));
		} else {
			var opt = document.createElement('option');
			opt.text = text;
			opt.value = value;
			dd.appendChild(opt);
		};
	},
	filterInput: function (obj, evt, shadow) {
		var dest = null;
		if (typeof (shadow) != 'undefined') {
			dest = document.getElementById(shadow);
		};
		var charCode = (evt.which != undefined) ? evt.which : evt.keyCode;
		if (obj.value.length > 50 && charCode != 8) {
			return false;
		};
		if (dest !== null && charCode != 8 && charCode != 46) {
			dest.value += String.fromCharCode(charCode);
		};
		var k = '';
		if (
			(charCode == 32) ||
			(charCode > 47 && charCode < 91) ||
			(charCode > 96 && charCode < 123) ||
			(charCode == 8) ||
			(charCode == 0)
			) {
			if (charCode == 32) {
				k = '-';
				if (specchar) {
					return false;
				};
				specchar = true;
				obj.value = obj.value.toString().trim() + k;
				return false;

			} else if (charCode > 8 && charCode != 32) {
				k = String.fromCharCode(charCode);
				specchar = false;
			};

		} else {
			return false;
		};
	},
	updateShadow: function (obj, evt, shadow) {
		var dest = null;
		if (typeof (shadow) != 'undefined') {
			dest = document.getElementById(shadow);
		};
		var charCode = (evt.which != undefined) ? evt.which : evt.keyCode;
		if (charCode == 8 || charCode == 46) {
			dest.value = obj.value.replace('-', ' ');
		};
	},
	CleanNumber: function (number) {
		number = this.Trim(number.toString());
		if ((number.length - number.lastIndexOf(',')) == 3) {
			number = number.replace(/\./g, '#');
			number = number.replace(/,/g, '.');
			number = number.replace(/#/g, ',');
			number = number.replace(/,/g, '');
		} else {
			number = number.replace(/,/g, '');
		};
		return parseFloat(number);

	}

};
dnn_comm.RolePicker = {
    id: null,
    roles: [],
    currentRoles: null,
    key: '',
    store: null,
    Init: function (id, roles) {
        this.id = id;
        this.key = this.id + 'Picker';
        this.roles = roles;
        this.store = document.getElementById(this.id);
        if (this.currentRoles == null) {
            this.currentRoles = this.store.value;
        };
        this.Bind();
    },
    Bind: function () {
        dnn_comm.utils.addOption('drp' + this.key, '', '');
        for (var i = 0; i < this.roles.length; i++) {

            dnn_comm.utils.addOption('drp' + this.key, this.roles[i].itemName, this.roles[i].itemId);
        };
        if (this.currentRoles != '') {
            var cr = this.currentRoles.split(';');
            for (var i = 0; i < cr.length; i++) {
                if (cr[i] != '') {
                    this.Add(this.GetRole(cr[i]), cr[i]);
                };
            };
        };
    },
    Add: function (item, roleKey) {
        var drp = document.getElementById('drp' + this.key);
        var rname = '';
        var rid = -1;
        if (typeof (item) == 'undefined') {
            rid = drp.options[drp.selectedIndex].value;
            rname = drp.options[drp.selectedIndex].text;
        } else {
            rid = item.itemId;
            rname = item.itemName;
        };
        if (typeof (roleKey) != 'undefined') {
            if (roleKey.indexOf('|') > 0) {
                rname += ' ' + roleKey.split('|')[1] + ' ' + roleKey.split('|')[2];
            }
        };
        if (rname != '') {

            var ul = document.getElementById(this.key);
            var itemId = this.key + '-' + rid;
            if (document.getElementById(this.id + '-units') != null) {
                var units = document.getElementById(this.id + '-units').value;
                var interval = document.getElementById(this.id + '-interval').value;
                if (units != '' && interval != '') {
                    itemId = itemId.toString() + '|' + units + '|' + interval;
                }
            }
            if (document.getElementById(itemId) == null) {
                ul.appendChild(this.CreateTokenElement(itemId, rname));
            };
            this.store.value = this.Selected();

        }
    },
    Remove: function (id) {
        var li = document.getElementById(id);
        if (li != null) {
            var p = document.getElementById(this.key);
            p.removeChild(li);
        };
        this.store.value = this.Selected();
    },
    Selected: function () {
        var roleIds = '';
        var p = document.getElementById(this.key);
        var items = p.getElementsByTagName('LI');
        for (var i = 0; i < items.length; i++) {
            roleIds += items[i].id.replace(this.key + '-', '') + ';'
        };
        return roleIds;
    },
    CreateTokenElement: function (id, text) {
        var li = document.createElement('li');
        li.className = 'am-ui-token';
        var b = document.createElement('b');
        b.onclick = new Function(this.key + '.Remove(\'' + id + '\')');
        li.appendChild(b);
        var sp = document.createElement('span');
        sp.appendChild(document.createTextNode(text));
        li.appendChild(sp);
        li.setAttribute('id', id);
        return li;
    },
    GetRole: function (rid) {
        if (rid.indexOf('|') > 0) {
            rid = rid.substring(0, rid.indexOf('|'));
        }
        for (var i = 0; i < this.roles.length; i++) {
            if (this.roles[i].itemId == rid) {
                return this.roles[i];
            };
        };
    }
};
