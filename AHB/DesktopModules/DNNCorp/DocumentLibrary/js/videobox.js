var Videobox =
{
	init: function (options)
	{
		// init default options
		this.options = Object.extend(
		{
			resizeDuration: 400, // Duration of height and width resizing (ms)
			initialWidth: 250, // Initial width of the box (px)
			initialHeight: 250, // Initial height of the box (px)
			defaultWidth: 425, // Default width of the box (px)
			defaultHeight: 350, // Default height of the box (px)
			animateCaption: true, // Enable/Disable caption animation
			flvplayer: MainFlvPlayer
		}, options || {});

		this.anchors = [];
		Moo.$A(Moo.$$('a')).each(function(el)
		{
			if (el.rel && el.href && el.rel.test('^vidbox', 'i'))
			{
				el.addEvent('click', function (e)
				{
                    e = new Moo.Event(e);
                    e.stop();
                    this.click(el);
				}.bind(this));
				this.anchors.push(el);
			}
        }, this);

		this.overlay = new Moo.Element('div').setProperty('id', 'lbOverlay').injectInside(document.body);
		this.center = new Moo.Element('div').setProperty('id', 'lbCenter').setStyles({width: this.options.initialWidth+'px', height: this.options.initialHeight+'px', marginLeft: '-'+(this.options.initialWidth/2)+'px', display: 'none'}).setStyle('border', 'solid 1px #000').injectInside(document.body);

		this.bottomContainer = new Moo.Element('div').setProperty('id', 'lbBottomContainer').setStyle('display', 'none').setStyle('border', 'solid 1px #000').injectInside(document.body);
		this.bottom = new Moo.Element('div').setProperty('id', 'lbBottom').injectInside(this.bottomContainer);
		new Moo.Element('a').setProperties({id: 'lbCloseLink', href: '#'}).injectInside(this.bottom).onclick = this.overlay.onclick = this.close.bind(this);
		this.caption = new Moo.Element('div').setProperty('id', 'lbCaption').injectInside(this.bottom);
		this.number = new Moo.Element('div').setProperty('id', 'lbNumber').injectInside(this.bottom);
		new Moo.Element('div').setStyle('clear', 'both').injectInside(this.bottom);

		var nextEffect = this.nextEffect.bind(this);
		this.fx =
		{
			overlay: this.overlay.effect('opacity', {duration: 500}).hide(),
			center: this.center.effects({duration: 500, transition: Moo.Fx.Transitions.sineInOut, onComplete: nextEffect}),
			bottom: this.bottom.effect('margin-top', {duration: 400})
		};
	},

	click: function(link)
	{
        return this.open (link.href, link.title, link.rel);
    },
	
	open: function(sLinkHref, sLinkTitle, sLinkRel)
	{
	    var caption = decodeURI(sLinkHref.substring(sLinkHref.indexOf("fn=") + 3));
		this.href = sLinkHref;
		this.title = caption;
		this.rel = sLinkRel;
		this.position();
		this.setup();
		this.video(this.href);
		this.top = Moo.Window.getScrollTop() + (Moo.Window.getHeight() / 15);
		this.center.setStyles({top: this.top+'px', display: ''});
		this.step = 1;
		//this.center.setStyle('background','#fff url(loading.gif) no-repeat center');
		this.center.className = 'lbLoading';
		this.caption.innerHTML = caption;
		this.fx.center.start({'height': [this.options.contentsHeight]});
	},

	setup: function(){
		var aDim = this.rel.match(/[0-9]+/g);
		this.options.contentsWidth = (aDim && (aDim[0] > 0)) ? aDim[0] : this.options.defaultWidth;
		this.options.contentsHeight = (aDim && (aDim[1] > 0)) ? aDim[1] : this.options.defaultHeight;
	},

	position: function()
	{
        this.overlay.setStyles({'top': window.getScrollTop()+'px', 'height': window.getHeight()+'px'});
	},

	video: function(sLinkHref)
	{
		if (sLinkHref.match(/\.mov$/i) || sLinkHref.match(/\.qt$/i))
		{
            this.flash = false;
			if (navigator.plugins && navigator.plugins.length)
			{
                this.other ='<object id="qtboxMovie" type="video/quicktime" codebase="http://www.apple.com/qtactivex/qtplugin.cab" data="'+sLinkHref+'" width="'+(this.options.contentsWidth)+'" height="'+(this.options.contentsHeight)+'"><param name="src" value="'+sLinkHref+'" /><param name="scale" value="aspect" /><param name="controller" value="true" /><param name="autoplay" value="true" /><param name="bgcolor" value="#000000" /><param name="enablejavascript" value="true" /></object>';
            }
            else
            {
                this.other = '<object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" width="'+(this.options.contentsWidth-12)+'" height="'+(this.options.contentsHeight-12)+'" id="qtboxMovie"><param name="src" value="'+sLinkHref+'" /><param name="scale" value="aspect" /><param name="controller" value="true" /><param name="autoplay" value="true" /><param name="bgcolor" value="#000000" /><param name="enablejavascript" value="true" /></object>';
            }
		}
		else if (sLinkHref.match(/\.avi$/i) || sLinkHref.match(/\.asf$/i) || sLinkHref.match(/\.wmv$/i) || sLinkHref.match(/\.mpg$/i) || sLinkHref.match(/\.wav$/i) || sLinkHref.match(/\.aif$/i) || sLinkHref.match(/\.wma$/i) || sLinkHref.match(/\.mp3$/i) || sLinkHref.match(/\.mpa$/i) || sLinkHref.match(/\.mid$/i) || sLinkHref.match(/\.midi$/i))
		{
            this.flash = false;
            if (navigator.plugins && navigator.plugins.length)
            {
                this.other = '<object id="player" type="application/x-mplayer2" width="'+(this.options.contentsWidth-12)+'" height="'+(this.options.contentsHeight-12)+'"><param name="URL" value="'+sLinkHref+'"><param name="AutoStart" value="true"><param name="StretchToFit" value="true"></object>'
            }
            else
            {
                this.other = '<object id="player" type="application/x-oleobject" width="'+(this.options.contentsWidth-12)+'" height="'+(this.options.contentsHeight-12)+'" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"><param name="URL" value="'+sLinkHref+'"><param name="AutoStart" value="true"><param name="StretchToFit" value="true"></object>'
            }
		}
		else if (sLinkHref.match(/\.flv$/i) || sLinkHref.match(/\.mp4$/i))
		{
            this.flash = true;

            var date = new Date();
            date.setTime(date.getTime()+(60000));
            var expires = "; expires="+date.toGMTString();
            document.cookie = "MediaFileDownload="+sLinkHref+expires+"; path=/";

            sLinkHref = sLinkHref.replace(/FileDownloaderPage.aspx/i, "MediaFileDownloaderPage.aspx").substring(0, sLinkHref.indexOf("&", sLinkHref.indexOf("?")) + 5);

            this.so = new SWFObject(this.options.flvplayer+"?hiddenGui=true&showScaleModes=false&flvToPlay="+sLinkHref, "flvvideo", this.options.contentsWidth-12, this.options.contentsHeight-12, "9", "#FFFFFF");
            // Use other flash player for IE 6
            /*
            if (/msie|MSIE 6/.test(navigator.userAgent))
            {
                this.so = new SWFObject(this.options.flvplayer.replace(/player_flv_maxi/i, "flvplayer")+"?hiddenGui=true&showScaleModes=false&flvToPlay="+sLinkHref, "flvvideo", this.options.contentsWidth-12, this.options.contentsHeight-12, "9", "#FFFFFF");
            }
            else
            {
                this.so = new SWFObject(this.options.flvplayer, "flvvideo", this.options.contentsWidth-12, this.options.contentsHeight-12, "9", "#FFFFFF");
                this.so.addParam("movie", sLinkHref);
                this.so.addParam("allowFullScreen", "true");
                this.so.addParam("FlashVars", "width=" + this.options.contentsWidth-12 + "&amp;height=" + this.options.contentsHeight-12 + "&amp;autoplay=1&amp;margin=0&amp;bgcolor1=ffffff&amp;bgcolor2=ffffff&amp;showstop=1&amp;showvolume=1&amp;showtime=2&amp;showfullscreen=1&amp;playertimeout=2000&amp;playercolor=ffffff&amp;loadingcolor=ff2929&amp;buttoncolor=000000&amp;buttonovercolor=9c9c9c&amp;slidercolor1=000000&amp;slidercolor2=000000&amp;sliderovercolor=9c9c9c&amp;showiconplay=1&amp;videobgcolor=ffffff&amp;flv=" + sLinkHref);
            }
            */
		}
		else
		{
            this.flash = false;
            // check width or height
            if (sLinkHref.indexOf("width") != -1)
            {
                // set width
                var indexOfWidth = sLinkHref.indexOf("width");
                var width = sLinkHref.substring(indexOfWidth+6, sLinkHref.indexOf("&", indexOfWidth));

                this.other = '<img src="'+sLinkHref+'" width="'+width+'" />'
            }
            else if (sLinkHref.indexOf("height") != -1)
            {
                // set height
                var indexOfHeight = sLinkHref.indexOf("height");
                var height = sLinkHref.substring(indexOfHeight+7, sLinkHref.indexOf("&", indexOfHeight));

                this.other = '<img src="'+sLinkHref+'" height="'+height+'" />'
            }
            else
            {
			    this.other = '<img src="'+sLinkHref+'" />'
			}
		}
	},

	nextEffect: function()
	{
		switch (this.step++)
		{
            case 1:
                this.fx.center.start({'width': [this.options.contentsWidth], 'marginLeft': [this.options.contentsWidth/-2]});
                break;
                this.step++;
            case 2:
                this.center.setStyle('background','#fff');
                this.flash ? this.so.write(this.center) : this.center.setHTML(this.other) ;
                this.bottomContainer.setStyles({top: (this.top + this.center.clientHeight)+'px', height: '0px', marginLeft: this.center.style.marginLeft, width: this.options.contentsWidth+'px',display: ''});
                if (this.options.animateCaption)
                {
                    this.fx.bottom.set(-this.bottom.offsetHeight);
                    this.bottomContainer.style.height = '';
                    this.fx.bottom.start(0);
                    break;
                }
                this.bottomContainer.style.height = '';
                this.step++;
		}
	},

	close: function()
	{
		this.fx.overlay.start(0);
		this.center.style.display = this.bottomContainer.style.display = 'none';
		this.center.innerHTML = '';
		return false;
	}
};

window.addEvent('domready', Videobox.init.bind(Videobox));
