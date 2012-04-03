
function ap_checkUname(id) {
    var obj = document.getElementById(id);
    var tmp = {};
    tmp.action = "checkuname";
    tmp.u = obj.value.trim();
    var r = ap_callback_synch(JSON.stringify(tmp));
    return r.result;

};
var ap_DL = function () {
    return {
        Init: function (countryId, regionId) {
            var prefix = this.getprefix(countryId);
            if (typeof (countries) != 'undefined') {
                var c = countries.Countries.length;
                var drpC = document.getElementById(countryId.replace(prefix, prefix + 'drp_'));
                dnn_comm.utils.RemoveChildNodes(drpC.id);
                dnn_comm.utils.addOption('', '', '', drpC);

                for (var i = 0; i < c; i++) {
                    var cnt = countries.Countries[i].Country[0];
                    dnn_comm.utils.addOption('', cnt.Name, cnt.Abbr, drpC);
                };
                var currCountry = document.getElementById(countryId).value;

                if (currCountry == 'N/A' || currCountry == '') {
                    currCountry = 'US';
                };
                dnn_comm.utils.SetSelected(drpC.id, currCountry);
                this.buildRegions(currCountry, countryId, regionId);

            };
        },
        regionChange: function (obj) {
            var prefix = this.getprefix(obj.id);
            var regionId = obj.id.replace(prefix + 'drp_', prefix);
            var countryId = regionId.replace('Region', 'Country');
            document.getElementById(regionId).value = obj.options[obj.selectedIndex].value;
            ap_fieldaccess(document.getElementById(regionId));
        },
        countryChange: function (obj) {
            var prefix = this.getprefix(obj.id);
            var countryId = obj.id.replace(prefix + 'drp_', prefix);
            var regionId = countryId.replace('Country', 'Region');
            var selected = obj.options[obj.selectedIndex].value;
            ap_fieldaccess(document.getElementById(countryId));
            this.buildRegions(selected, countryId, regionId);
        },
        getprefix: function (id) {
            return id.substring(0, id.indexOf('_') + 1);
        },
        buildRegions: function (country, countryId, regionId) {
            var bRegions = false;
            var prefix = this.getprefix(regionId);
            var drpC = document.getElementById(regionId.replace(prefix, prefix + 'drp_'));
            document.getElementById(countryId).value = country;
            if (typeof (countries) != 'undefined' && country != '') {
                var c = countries.Countries.length;

                dnn_comm.utils.RemoveChildNodes(drpC.id);
                dnn_comm.utils.addOption('', '', '', drpC);
                for (var i = 0; i < c; i++) {
                    var cnt = countries.Countries[i].Country[0];
                    if (cnt.Abbr == country) {
                        var regions = cnt.Regions;
                        var r = regions.length;
                        if (r > 0) {
                            for (var x = 0; x < r; x++) {
                                bRegions = true;
                                var reg = regions[x];
                                dnn_comm.utils.addOption('', reg.Name, reg.Name, drpC);
                            };
                        };

                    };

                };
                if (bRegions) {
                    document.getElementById(regionId).style.display = 'none';
                    drpC.style.display = 'inline-block';
                    dnn_comm.utils.SetSelected(drpC.id, document.getElementById(regionId).value);
                } else {
                    document.getElementById(regionId).style.display = 'inline-block';
                    drpC.style.display = 'none';
                };
            };
        }
    };
} ();

function ap_checkNameComplete(result) {
    var r = result;

    if (r.result == false) {
        dnn_comm.form.ShowRequired('apreg_Username');
        ap_showtip.show(document.getElementById('apreg_Username'), 'Invalid Username invalid user name please enter a valid user name', 'am-ui-tooltip-warn');
    } else {
        am.ToolTip.hide();
        dnn_comm.form.IsValid('apreg_Username');
    };
};
function showLogin() {
    ap_loginShowForm();
    dnn_comm.utils.DivToModal('dnnCart-login');
};
function ap_Login() {
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
        var tmp = {};
        tmp.action = 'login';
        tmp.u = document.getElementById('aplogin_Username').value;
        tmp.p = document.getElementById('aplogin_Password').value;
        document.getElementById('dnnCart-login-form').style.display = 'none';
        document.getElementById('dnnCart-login-loading').style.display = 'block';
        ap_callback(JSON.stringify(tmp), ap_Login_complete);

    } else {
        //alert('Not Valid');
    };
};
function ap_Login_complete(result) {
    document.getElementById('dnnCart-login-loading').style.display = 'none';
    if (result.result == true) {
        document.getElementById('dnnCart-login-message-success').style.display = 'block';
        setTimeout(function () { ap_LoginSuccess(); }, 2000);
    } else {
        if (typeof (result.message) != 'undefined') {
            document.getElementById('allf-msg').innerHTML = result.message;
        };
        document.getElementById('dnnCart-login-message-failed').style.display = 'block';

    };
};
function ap_LoginCancel() {
    dnn_comm.utils.CloseDiv('dnnCart-login');
    ap_loginShowForm();
};
function ap_loginShowForm() {
    document.getElementById('dnnCart-login-loading').style.display = 'none';
    document.getElementById('dnnCart-login-message-success').style.display = 'none';
    document.getElementById('dnnCart-login-message-failed').style.display = 'none';
    document.getElementById('dnnCart-login-password').style.display = 'none';
    document.getElementById('dnnCart-login-password-success').style.display = 'none';
    document.getElementById('dnnCart-login-password-failed').style.display = 'none';
    document.getElementById('dnnCart-login-form').style.display = 'block';
    document.getElementById('dnnCart-login-section').style.display = 'block';
};
function ap_passShowForm() {
    document.getElementById('dnnCart-login-section').style.display = 'none';
    document.getElementById('dnnCart-login-form').style.display = 'none';
    document.getElementById('dnnCart-login-loading').style.display = 'none';
    document.getElementById('dnnCart-login-message-failed').style.display = 'none';
    document.getElementById('dnnCart-login-password').style.display = 'block';
    document.getElementById('dnnCart-login-password-success').style.display = 'none';
    document.getElementById('dnnCart-login-password-failed').style.display = 'none';
    document.getElementById('dnnCart-pass').style.display = 'block';
};
function ap_LoginSuccess() {
    dnn_comm.utils.CloseDiv('dnnCart-login');
    window.location.href = window.location.href;
};
function ap_Pass() {
    var q = document.getElementById("appass_Username").value;
    if (q.trim() != '') {
        var tmp = {};
        tmp.action = 'pass';
        tmp.s = q;
        document.getElementById('dnnCart-login-password').style.display = 'none';
        document.getElementById('dnnCart-pass-loading').style.display = 'block';
        ap_callback(JSON.stringify(tmp), ap_Pass_complete);
    };
};
function ap_Pass_complete(results) {
    document.getElementById('dnnCart-pass-loading').style.display = 'none';
    if (typeof (results) != 'undefined') {
        if (results.result == true) {
            document.getElementById('alps-msg').innerHTML = results.message;
            document.getElementById('dnnCart-login-password-success').style.display = 'block';
        } else {
            document.getElementById('alpf-msg').innerHTML = results.message;
            document.getElementById('dnnCart-login-password-failed').style.display = 'block';
        };
    };
};
function ap_deleteItem(obj) {
    var p = dnn_comm.utils.GetParentByTagName(obj, 'TR');
    if (p != null) {
        itemid = p.id;
        var tmp = {};
        tmp.action = 'del';
        tmp.cartitem = itemid;
        var out = ap_callback_synch(JSON.stringify(tmp));
        if (out.result == true) {
            window.location = window.location.href;

        };
    };
};
function ap_changeQty(obj, inc, prodid) {
    var p = dnn_comm.utils.GetParentByTagName(obj, 'TR');
    var itemid = '';
    if (p != null) {
        itemid = p.id;
    };
    var qty = document.getElementById(itemid + '-qty').innerHTML;
    var tmp = {};
    tmp.action = 'qty';
    tmp.count = inc;
    tmp.cartitem = itemid;
    tmp.prod = prodid;
    tmp.qty = qty;
    ap_callback(JSON.stringify(tmp), ap_changeQty_complete);
};
function ap_changeQty_complete(results) {
    
    if (typeof (results.items) != 'undefined') {
        for (var i = 0; i < results.items.length; i++) {
            var row = results.items[i];
            var itemid = row.OrderItemId;
            var qty = document.getElementById(itemid + '-qty');
            if (qty != null) {
                qty.innerHTML = row.Qty;
            };
            var price = document.getElementById(itemid + '-price');
            if (price != null) {
                price.innerHTML = row.Price;
            };
            var disc = document.getElementById(itemid + '-disc');
            if (disc != null) {
                disc.innerHTML = row.Discount;
            };
            var subt = document.getElementById(itemid + '-subtotal');
            if (subt != null) {
                subt.innerHTML = row.SubTotal;
            };
        };
        var st = document.getElementById('cartSubTotal');
        var tx = document.getElementById('cartTax');
        var ds = document.getElementById('cartDiscount');
        var sh = document.getElementById('cartShipping');
        var gt = document.getElementById('cartGrandTotal');
        if (st != null && typeof (results.SubTotal) != 'undefined') {
            st.innerHTML = results.SubTotal;
        };
        if (tx != null && typeof (results.Tax) != 'undefined') {
            tx.innerHTML = results.Tax;
        };
        if (ds != null && typeof (results.Discount) != 'undefined') {
            ds.innerHTML = results.Discount;
        };
        if (sh != null && typeof (results.Shipping) != 'undefined') {
            sh.innerHTML = results.Shipping;
        };
        if (gt != null && typeof (results.GrandTotal) != 'undefined') {
            gt.innerHTML = results.GrandTotal;
        };
        if (typeof (results.GrandTotal) != 'undefined') {
            var np = document.getElementById('divNoPay');
            var yp = document.getElementById('divPay');
            if (np != null) {
                if (parseFloat(results.GrandTotal) == 0) {
                    np.style.display = 'block';
                    yp.style.display = 'none';
                } else {
                    np.style.display = 'none';
                    yp.style.display = 'block';
                };
            };
            
        };
       

    };
};
function ap_getCart() {
    var tmp = {};
    tmp.action = 'cart';
    ap_callback(JSON.stringify(tmp), ap_loadCart);
};
function ap_loadCart(results) {
    //alert(JSON.stringify(results));
};
function ap_applyDisc() {
    var dc = document.getElementById('apDiscountCode');
    if (dc != null) {
        if (dc.value != '') {
            var tmp = {};
            tmp.action = 'disc';
            tmp.code = dc.value;
            ap_callback(JSON.stringify(tmp), ap_applyDisc_complete);
        };
    };
};
function ap_applyDisc_complete(results) {
    if (results.success == false) {
        var $tt = $('#apDiscountCode').parent();
        $tt.find('.dnnCart-tooltip-text').text(results.message);
        $tt.find('.dnnCart-form-tooltip').fadeIn();
    } else {
    window.location.href = window.location.href;
    };
};
function ap_processPayment() {
    var isValid = true;
    var ppopt = document.getElementById('appay_PaymentMethod');
    if (ppopt == null) {
        ppopt = document.getElementById('defaultPaymethod').value;
    } else {
        if (ppopt.selectedIndex == 0) {
            return;
        }
        ppopt = ppopt.options[ppopt.selectedIndex].value;
        if (ppopt == 'VISA' || ppopt == 'MASTERCARD' || ppopt == 'AMERICAN EXPRESS' || ppopt == 'DISCOVER') {
            ppopt = 'CC';
        };
    }
    if (ppopt == 'PAYPAL') {
        var hid = document.createElement('input');
        hid.setAttribute('type', 'hidden');
        hid.setAttribute('name', 'appay');
        hid.value = 'PP';
        document.forms[0].appendChild(hid);
        dnn_comm.utils.DivToModal('ap-wait');
        document.forms[0].submit();
    } else if (ppopt == 'CC') {
        if (!dnn_comm.form.Validate('appay_NameOnCard', { 'required': true, 'minlength': 2 })) {
            isValid = false;
        };
        if (!dnn_comm.form.Validate('appay_CardNumber', { 'required': true, 'minlength': 12 })) {
            isValid = false;
        };
        if (!dnn_comm.form.Validate('appay_CCV', { 'required': true, 'minlength': 3 })) {
            isValid = false;
        };
        if (isValid) {
            var hid = document.createElement('input');
            hid.setAttribute('type', 'hidden');
            hid.setAttribute('name', 'appay');
            hid.value = 'CC';
            document.forms[0].appendChild(hid);
            dnn_comm.utils.DivToModal('ap-wait');
            document.forms[0].submit();
        };
    } else {
        var hid = document.createElement('input');
        hid.setAttribute('type', 'hidden');
        hid.setAttribute('name', 'appay');
        hid.value = ppopt;
        document.forms[0].appendChild(hid);
        dnn_comm.utils.DivToModal('ap-wait');
        document.forms[0].submit();
    };
    
};
function ap_processOrder() {
    var hid = document.createElement('input');
    hid.setAttribute('type', 'hidden');
    hid.setAttribute('name', 'appay');
    hid.value = 'NP';
    document.forms[0].appendChild(hid);
    dnn_comm.utils.DivToModal('ap-wait');
    document.forms[0].submit();
};