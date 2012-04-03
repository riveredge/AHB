jQuery.fn.zebratable = function(options) {

    var defaults = {
        tblClass: 'licxGrid',
        altClass: 'licxGridAlt'
    };
    var options = jQuery.extend(defaults, options);

    return this.each(function() {
        jQuery(this).addClass(options.tblClass);
        jQuery(this)
            .find(':has(th)')
            .find('tr:odd')
            .addClass(options.altClass);

        jQuery(this)
            .find(':not(:has(th))')
            .find('tr:even')
            .addClass(options.altClass);
    });
};

/*
// Simple JavaScript Templating
// John Resig - http://ejohn.org/ - MIT Licensed
// Mods by Joe Brinkman - DotNetNuke Corp.
*/
var _cache = {};

jQuery(document).ready(function() {
	jQuery.template = function template(str, data) {
		// Figure out if we're getting a template, or if we need to
		// load the template - and be sure to cache the result.
		var fn = !/\W/.test(str) ?
			_cache[str] = cache[str] ||
			template(document.getElementById(str).innerHTML) :

		// Generate a reusable function that will serve as a template
		// generator (and which will be cached).
		  new Function("obj",
			"var p=[],print=function(){p.push.apply(p,arguments);};" +

		// Introduce the data as local variables using with(){}
			"with(obj){p.push('" +

		// Convert the template into pure JavaScript
			str
			  .replace(/[\r\t\n]/g, " ")
			  .split("<#").join("\t")
			  .replace(/((^|#>)[^\t]*)'/g, "$1\r")
			  .replace(/\t=(.*?)#>/g, "',$1,'")
			  .split("\t").join("');")
			  .split("#>").join("p.push('")
			  .split("\r").join("\\'")
		  + "');}return p.join('');");

		// Provide some basic currying to the user
		return data ? fn(data) : fn;
	};

	var dlg = jQuery.template('<div id="<#=id#>" style="width:400px;" ><#=msg#></div>');

	var noData = jQuery('table.licxGrid:has(.NoData)')

	if (!noData) jQuery('table.licxGrid').zebratable();

	noData.css({ 'border-style': 'none' });

	var statusMessage = dnn.getVar('statusMessage');

	if (statusMessage && statusMessage.length > 0) {
		Boxy.ask(statusMessage
            , ['Close']
            , function () { }
            , { title: 'Status', closable: true, unloadOnHide: true }
            );
	}

	// clean up to avoid memory leaks in certain versions of IE 6
	jQuery(window).bind('unload', function() {
		jQuery('#licxtablist > li > a').unbind('click');
	});

});

