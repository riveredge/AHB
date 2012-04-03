(function($) {
    $.delegate = function(rules) {
        return function(e) {
            var target = $(e.target);
            for (var selector in rules)
                if (target.is(selector)) {
                return rules[selector].apply(this, $.makeArray(arguments));
            }
        }
    }

    $(function() {
        $('#dnnHealthView').dnnTabs();
        $("#dhvDetails>.dnnGrid").click($.delegate({
            '.healthrow': function(event) {
                $(event.target).next().slideToggle('normal');
            },
            '.healthDate': function(event) {
                $(event.target).parent().next().slideToggle('normal');
            },
            '.healthPortal': function(event) {
                $(event.target).parent().next().slideToggle('normal');
            }
        }));
    });
})(jQuery);