/**
* nlsmenu.js v3.0
* Copyright 2005-2006, addobject.com. All Rights Reserved
* Author Jack Hermanto, www.addobject.com
*/
nlsMenu={};nlsMenuMgr={};nlsWinElmt=[];ag0=navigator.userAgent;nls_isIE=(ag0.indexOf("MSIE")>=0);nls_isIE5=(ag0.indexOf("MSIE 5.0")>=0);nls_isSafari=(ag0.indexOf("Safari")>=0);nls_isOpera=(ag0.indexOf("Opera")>=0);if(nls_isOpera){nls_isIE=false;nls_isIE5=false};function NlsMenuManager(mgr){this.mgrId=mgr;this.menus={};this.menubar=null;this.timeout=1000;this.flowOverFormElement=false;this.assocMenuMgr=[];this.defaultEffect=null;this.icPath="";this.memorizeSel=false;this.rt={};this.tmId=null;this.setTimeout=function(a,t){this.tmId=window.setTimeout(a,t);};this.clearTimeout=function(){if(this.tmId!=null){window.clearTimeout(this.tmId);this.tmId=null}};nlsMenuMgr[mgr]=this;if(nls_isIE)window.attachEvent("onload",function(){nlsMenuMgr[mgr].init();});return this};NlsMnMgr=NlsMenuManager.prototype;NlsMnMgr.createMenu=function(mId){var m=new NlsMenu(mId);m.mgr=this;m.mgrId=this.mgrId;m.icPath=this.icPath;m.useEffect(this.defaultEffect);if(this.design){m.$menuItemClick=NlsMenu.$dsItemClick}this.menus[mId]=m;return m};NlsMnMgr.createMenubar=function(mbarId){if(this.menubar)alert("Menubar already exists!");var m=new NlsMenubar(mbarId);m.mgr=this;m.mgrId=this.mgrId;m.icPath=this.icPath;if(this.design){m.$menuItemClick=NlsMenu.$dsItemClick}this.menubar=m;return m};NlsMnMgr.renderMenus=function(plc){if(plc&&plc!=""){var d=NlsMenu.$GE(plc),s="";if(!d){d=document.createElement("SPAN");d.id=plc;document.body.insertBefore(d,document.body.childNodes[0]);}for(it in this.menus){s+=this.menus[it].renderMenu();}d.innerHTML=s;d.style.display=""}else{for(it in this.menus){document.write(this.menus[it].renderMenu());}}};NlsMnMgr.renderMenubar=function(plc,incSub){if(this.menubar){var mbar=this.menubar.renderMenubar();if(plc&&plc!=""){var d=NlsMenu.$GE(plc);d.style.display="";d.innerHTML=mbar}else{document.write(mbar);}if(incSub!=false){this.renderMenus(this.mgrId);}}if(this.memorizeSel)this.loadPath();};NlsMnMgr.hideMenus=function(){for(var it in this.menus){if(this.menus[it].rt.active)this.menus[it].hideMenu();}if(this.menubar)this.menubar.hideMenu();};NlsMnMgr.addAssocMenuMgr=function(frm,mgrId){this.assocMenuMgr[this.assocMenuMgr.length]=[frm,mgrId]};NlsMnMgr.getMenu=function(mId){return this.menus[mId]};NlsMnMgr.init=function(){if(this.menubar)this.menubar.init();};NlsMnMgr.setMenusProperties=function(opts){var mn;for(var m in opts){mn=nlsGetMenu(m);if(mn)mn.setProperties(opts[m]);}};function listAllWinElmt(){nlsWinElmt=[];var arrWinEl=document.getElementsByTagName("SELECT");var elm;var tmp;var x;var y;for(var i=0;i<arrWinEl.length;i++){elm=arrWinEl[i];tmp=elm;x=0;y=0;while(tmp!=null){x+=tmp.offsetLeft;y+=tmp.offsetTop;tmp=tmp.offsetParent}nlsWinElmt[nlsWinElmt.length]={e:elm,x1:x,y1:y,x2:x+elm.offsetWidth,y2:y+elm.offsetHeight}}};function NlsMenuItem(id,capt,url,ico,enb,xtra,subId,title){this.id=id;this.intKey="";this.capt=capt;this.url=$aonvl(url,"");this.ico=(ico==null||ico==""||ico.length==0)?null:ico;this.enable=$aonvl(enb,true);this.xtra=xtra;this.stlprf="";this.target=null;this.title=title==null?"":title;this.itemEffect=null;this.visible="false";this.state=1;this.selected=false;this.subMenuId=$aonvl(subId,"");this.crsFrame=false;this.subFrame=null;this.subPos=[null,null];this.subPosAdj=[0,0];this.subDir=["right","down"];this.useItemEffect=function(effName){this.itemEffect=new NlsMenuItemEffect(this.intKey,effName);};this.rt={subUrl:null,loaded:0};return this};function NlsMenuSeparator(cstSeparator){this.stlprf="";this.intKey="";this.seprt=$aonevl(cstSeparator,"");this.render=function(){if(this.seprt!="")return this.seprt;return("<table border=0 cellpadding=0 cellspacing=0 width='100%' height='0%'><tr>"+"<td class=\""+this.stlprf+"nlsseparator\"></td>"+"</tr></table>");};return this};function NlsCustomMenuItem(cst){this.intKey="";this.cstMenu=$aonvl(cst,"&nbsp;");return this};function NlsMenu(mId){var o={lsItm:null,mgrId:"",mgr:null,winElmt:null,container:null,customBorder:null,shadow:new NlsMenuShadow("none","5px",mId),count:0,effect:null,srItems:[],rt:{ready:true,active:false},mId:mId,stlprf:"",subMenuIc:null,target:"_self",icPath:"",itemSpc:"",stretchItem:true,selection:false,showIcon:false,showSubIcon:true,absWidth:"",orient:"V",defItmEff:null,defPos:[0,0],maxItemCol:100,zIndex:100,wnd:window,itemIco:null};this.setProperties(o);this.items={};nlsMenu[mId]=this;return this};function NlsMenubar(mId){var mnBar=new NlsMenu(mId);mnBar.isMenubar=true;mnBar.isMenuOpened=false;mnBar.firstClickOnly=true;mnBar.dropOnClick=false;mnBar.renderMenubar=function(){return mnBar.renderMenu();};mnBar.rt.active=true;return mnBar};NLSMENU=NlsMenu.prototype;NLSMENU.addItem=function(key,capt,url,ico,enb,xtra,subId,title){key=(key?key:this.count+1);var intKey=this.mId+"_"+key,it=new NlsMenuItem(key,capt,url,ico,enb,xtra,subId,title);this.add(intKey,it);if(this.defItmEff!=null&&typeof(NlsMenuItemEffect)!="undefined"){it.useItemEffect(this.defItmEff);}return it};NLSMENU.addSeparator=function(sepr){var intKey="sep_"+this.count;var it=new NlsMenuSeparator(sepr?sepr:null);it.stlprf=this.stlprf;this.add(intKey,it);return it};NLSMENU.addSubmenu=function(key,subId,crsFrame,subFrame,subPos,subPosAdj,subDir){var it=this.getItemById(key);it.subMenuId=subId;it.subFrame=$aonvl(subFrame,null);it.crsFrame=$aonvl(crsFrame,false);it.subPos=$aonvl(subPos,[null,null]);it.subPosAdj=$aonvl(subPosAdj,[0,0]);it.subDir=$aonvl(subDir,["right","down"]);return it};NLSMENU.addCustomMenu=function(custom){var intKey="cst_"+this.count;var it=new NlsCustomMenuItem(custom);this.add(intKey,it);return it};NLSMENU.add=function(intKey,it){it.mId=this.mId;it.intKey=intKey;this.items[intKey]=it;this.srItems[this.srItems.length]=it;this.count++};NLSMENU.getItemById=function(key){return this.items[this.mId+"_"+key]};NLSMENU.setItemStyle=function(key,stlprf){this.getItemById(key).stlprf=stlprf};NLSMENU.setItemText=function(key,tx){var it=this.getItemById(key);it.capt=tx;var oD=NlsMenu.$GE(it.intKey+"x2");if(oD)oD.innerHTML=tx};NLSMENU.enableItem=function(key,b){var it=this.getItemById(key);it.enable=b;setMnStyle(NlsMenu.$GE(it.intKey),(b?(it.selected?"S":"N"):"D"),NlsMenu.getPrf(it,this));setMnIcon(this,it,"N");};NLSMENU.dropShadow=function(pos,offset){if(this.shadow){this.shadow.pos=pos;this.shadow.offset=(offset?offset:"5px");}else{this.shadow=new NlsMenuShadow(pos,offset,this.mId);}};NLSMENU.useEffect=function(efN){if(efN!=null&&efN!=""){this.effect=new NlsMenuEffect(this.mId,efN);}};NLSMENU.renderMenu=function(){var scPath="",sbIc=null;if(this.subMenuIc){sbIc=[this.icPath+this.subMenuIc[0]];if(this.subMenuIc[1])sbIc[1]=this.icPath+this.subMenuIc[1]}var cs="<table cellpadding='0' cellspacing='0' ";var sAbs=(this.absWidth==""?"":"width='"+this.absWidth+"'");var usel="unselectable='on' style='-moz-user-select:none;user-select:none;'";var s=["<table cellpadding='0' cellspacing='"+$aonevl(this.itemSpc,"0")+"' width='100%'>"];var tmpCnt=0,prf,it,mn,ic,j=1,k=1,l,ts,isV=(this.orient=="V");for(var i=0;i<this.srItems.length;i++){it=this.srItems[i];mn=nlsMenu[it.subMenuId];if(!it.crsFrame){if(mn)mn.prIt=it.intKey;if(!mn&&it.rt&&!it.rt.subUrl){it.subMenuId=""}}prf=NlsMenu.getPrf(it,this);if(it.constructor==NlsMenuSeparator){it.stlprf=prf;ts="<td class='"+prf+"nlsseparatorcontainer'>"+it.render()+"</td>";s[j++]=(isV?("<tr>"+ts+"</tr>"):ts);}else if(it.constructor==NlsCustomMenuItem){ts="<td>"+it.cstMenu+"</td>";s[j++]=isV?("<tr>"+ts+"</tr>"):ts}else{if(isV)s[j++]="<tr>";else{if(tmpCnt==0)s[j++]="<tr>";tmpCnt++}l=[];k=0;l[k++]="<td align='center' id=\"@itId\" class=\""+prf+"nlsitemcontainer\" onmouseover=\"$nlsItemOver(event,'@mId','@itId')\" onclick=\"return nlsMenu['@mId'].$menuItemClick(event, '@itId');\" onmouseout=\"$nlsItemOut(event, '@mId')\">";l[k++]=cs+(this.stretchItem?"width='100%'":"")+" height='100%'><tr style=\"cursor:pointer;\" title=\""+it.title+"\">";if(this.showIcon){l[k++]="<td id=\"@itIdx1\" class=\""+prf+"nlsiconcell\" align=\"center\" nowrap "+usel+">";ic=$aonevl(it.ico,this.itemIco);if(ic){if(ic[0])l[k++]="<img id=\"ic_@itId\" "+(it.enable?"":"style='display:none'")+" src=\""+this.icPath+ic[0]+"\">";if(ic[1])l[k++]="<img id=\"icovr_@itId\" style='display:none' src=\""+this.icPath+ic[1]+"\">";if(ic[2])l[k++]="<img id=\"icdis_@itId\" "+(!it.enable?"":"style='display:none'")+" src=\""+this.icPath+ic[2]+"\">"}l[k++]="</td>"}l[k++]="<td align='left' id=\"@itIdx2\" class=\""+prf+(it.enable?"nlsitem\"":"nlsitemdisable\"")+" nowrap "+usel+">"+it.capt+"</td>";if(this.showSubIcon&&it.subMenuId!=""){l[k++]="<td id=\"@itIdx3\" class=\""+prf+"nlssubmenucell\" align=\"center\" nowrap>"+(it.subMenuId!=""?"<img id='subic_@itId' src=\""+sbIc[0]+"\">"+(sbIc.length>1?"<img id='subicovr_@itId' style='display:none' src=\""+sbIc[1]+"\">":""):"")+"</td>"}l[k++]="</tr></table>";l[k++]="</td>";s[j++]=l.join("").replace(/@itId/g,it.intKey);if(isV)s[j++]="</tr>";else if(!isV&&tmpCnt==this.maxItemCol){s[j++]="</tr>";tmpCnt=0}}}if(!isV&&tmpCnt!=0){if(this.srItems.length>this.maxItemCol)while(++tmpCnt<=this.maxItemCol)s[j++]="<td class=\""+prf+"nlsitemcontainer\">&nbsp;</td>";s[j++]="</tr>"}s[j++]="</table>";l=[];l=[cs+"class='"+this.stlprf+"nlsmenu' "+sAbs+">"],j=1;l[j++]="<tr><td><div id='mcnt_@mId'>"+s.join("")+"</div></td></tr>";l[j++]="</table>";ts=l.join("");if(this.customBorder!=null)ts=this.customBorder.applyBorder(ts,this.stlprf);ts=this.shadow.dropShadow(ts);s=[];j=0;s[j++]="<div "+(nls_isIE&&!this.isMenubar?"style='position:absolute;z-index:"+(this.zIndex-1)+";'":"")+">"+ts;if(!this.isMenubar&&nls_isIE&&!nls_isIE5&&this.mgr.flowOverFormElement){s[j++]="<iframe id='@mIdifrm' scrolling='no' frameborder=0 width='1' height='1' style='position:absolute;top:0px;left:0px;z-index:-1;filter:alpha(opacity=0)' src='"+scPath+"img/blank.gif"+"'></iframe>"}s[j++]="</div>";ts=s.join("");if(arguments[0]=="content"){}else{ts="<div id='@mId' style="+(this.isMenubar?"''":"'position:absolute;z-index:"+this.zIndex+";display:none;'")+" onmouseover=\"$nlsMenuOver('"+this.mgrId+"', '@mId')\" onmouseout=\"$nlsMenuOut('"+this.mgrId+"')\">"+ts+"</div>"}return ts.replace(/@mId/g,this.mId);};NLSMENU.init=function(){var v=this.rt.vshade;if(!v)v=NlsMenu.$GE("vshade_"+this.mId);var itm=this.rt.actmn;if(!itm)itm=NlsMenu.$GE("actmn_"+this.mId);if(v){var o=itm.childNodes[0].offsetHeight-parseInt(this.shadow.offset);if(o>=0)v.style.height=o+"px"}this.rt.actmn=itm;this.rt.vshade=v};function NlsMenuShadow(pos,offset,mId){this.pos=pos;this.offset=offset;this.mId=mId;this.dropShadow=function(smenu){var mn=nlsMenu[this.mId];var cs="<table cellpadding=0 cellspacing=0 ";var shadow="<div>"+cs+"id='effwin_"+this.mId+"' height='0px'>";var hshadow="<td style='padding-@@PAD:"+this.offset+";'>"+cs+"width='100%' height='5px' class='"+mn.stlprf+"horzshadow'><tr><td></td></tr></table></td>";var vshadow="<td style='padding-@@PAD:"+this.offset+";height:100%;'>"+cs+"id='vshade_"+this.mId+"' width='5px' height='100%' class='"+mn.stlprf+"vertshadow'><tr><td></td></tr></table></td>";var menutd="<td id='actmn_"+this.mId+"'>"+smenu+"</td>";var cornertd="<td class='"+mn.stlprf+"cornshadow' width='5px' height='5px'></td>";var av=[vshadow.replace(/@@PAD/gi,"top"),vshadow.replace(/@@PAD/gi,"bottom")];var ah=[hshadow.replace(/@@PAD/gi,"left"),hshadow.replace(/@@PAD/gi,"right")];switch(this.pos){case"none":shadow+="<tr>"+menutd+"</tr>";break;case"bottomright":shadow+="<tr>"+menutd+av[0]+"</tr><tr>"+ah[0]+cornertd+"</tr>";break;case"bottomleft":shadow+="<tr>"+av[0]+menutd+"</tr><tr>"+cornertd+ah[1]+"</tr>";break;case"topleft":shadow+="<tr>"+cornertd+ah[1]+"</tr><tr>"+av[1]+menutd+"</tr>";break;case"topright":shadow+="<tr>"+ah[0]+cornertd+"</tr><tr>"+menutd+av[1]+"</tr>";break}return shadow+"</table></div>"}};function $mPos(p1,p2,c,m,adj,scr,dr,drIdx,drVal){var v=0;if(drVal=="left"||drVal=="up"){if(p2+m>c){if(p1>=m){v=p1-m+adj+scr;dr[drIdx]=drVal}else{v=(c<m?m:c)-m-1+scr}}else{v=p2+scr-adj}}else{if(p1-m<0){if(p2+m<c){v=p2-adj+scr;dr[drIdx]=drVal}else{v=scr}}else{v=p1-m+adj+scr}}return v}NLSMENU.showMenu=function(x1,y1,x2,y2,orn,subDir,subAdj){this.mgr.clearTimeout();if(this.menuOnShow(this.mId)==false)return;var ctx=NlsMenu.$GE(this.mId);if(!ctx){var dv=document.createElement("div");dv.innerHTML=this.renderMenu();document.body.insertBefore(dv,document.body.childNodes[0]);ctx=NlsMenu.$GE(this.mId);};ctx.style.visibility="hidden";ctx.style.display="";if(nls_isIE)this.init();var w=window,d=document.body,de=document.documentElement;var scrOffX=w.scrollX||d.scrollLeft||de.scrollLeft;var scrOffY=w.scrollY||d.scrollTop||de.scrollTop;var cW=w.innerWidth||d.clientWidth,cH=w.innerHeight||d.clientHeight;var mW=ctx.childNodes[0].offsetWidth,mH=ctx.childNodes[0].offsetHeight;var sDir=(subDir?[subDir[0],subDir[1]]:["right","down"]);var adjX=(subAdj?subAdj[0]:this.defPos[0]),adjY=(subAdj?subAdj[1]:this.defPos[1]);var dmfrm=NlsMenu.$GE(this.mId+"ifrm");if(dmfrm){var actMn=NlsMenu.$GE("actmn_"+this.mId).children[0];dmfrm.width=actMn.offsetWidth;dmfrm.height=actMn.offsetHeight}var mX=0,mY=0;if(orn=="V"){mX=$mPos(x1,x2,cW,mW,adjX,scrOffX,sDir,0,(sDir[0]=="right"?"left":"right"));mY=$mPos(y2,y1,cH,mH,-adjY,scrOffY,sDir,1,(sDir[1]=="down"?"up":"down"));}else{mX=$mPos(x2,x1,cW,mW,-adjX,scrOffX,sDir,0,(sDir[0]=="right"?"left":"right"));mY=$mPos(y1,y2,cH,mH,adjY,scrOffY,sDir,1,(sDir[1]=="down"?"up":"down"));}if(nls_isIE5||!this.mgr.flowOverFormElement){if(this.winElmt==null)hideWinElmt(this,{x1:mX,y1:mY,x2:mX+mW,y2:mY+mH});if(this.winElmt==null)this.winElmt=[];for(var i=0;i<this.winElmt.length;i++){this.winElmt[i].style.visibility="hidden"}}with(ctx.style){left=mX+"px";top=mY+"px";zIndex=this.zIndex;if(this.effect){with(this.effect){prop["dir"]=sDir[(orn=="V"?0:1)];start(false);visibility="visible";run();}}else{visibility="visible"}}this.rt.active=true};function $fInts(o,p){return((o.x1>=p.x1&&o.x1<=p.x2)||(o.x2>=p.x1&&o.x2<=p.x2)||(o.x1<p.x1&&o.x2>p.x2))&&((o.y1>=p.y1&&o.y1<=p.y2)||(o.y2>=p.y1&&o.y2<=p.y2)||(o.y1<p.y1&&o.y2>p.y2));}function hideWinElmt(mn,p){var o;for(var i=0;i<nlsWinElmt.length;i++){o=nlsWinElmt[i];if($fInts(o,p)||$fInts(p,o)){if(o.e.style.visibility!="hidden"){o.e.style.visibility="hidden";if(mn.winElmt==null)mn.winElmt=[];mn.winElmt[mn.winElmt.length]=o.e}}}};NLSMENU.showMenuAbs=function(x,y){var ctx=NlsMenu.$GE(this.mId);ctx.style.top=y+"px";ctx.style.left=x+"px";ctx.style.display="";this.rt.active=true};NLSMENU.hideMenu=function(){var ctx=NlsMenu.$GE(this.mId);if(!ctx)return;if(!this.isMenubar){this.rt.active=false;if(this.effect){this.effect.start(true);if((nls_isIE&&this.effect.effName!="aoslide")||nls_isOpera&&this.effect.effName!="aoslide"){ctx.style.visibility="hidden"}else{this.effect.onHide=function(){ctx.style.visibility="hidden"}};this.effect.run();}else{ctx.style.visibility="hidden"}this.menuOnHide(this.mId);}else{this.isMenuOpened=false}if(this.lsItm!=null){var it=this.items[this.lsItm.id];if(it.state!=2&&!it.selected){setMnStyle(this.lsItm,(it.enable?"N":"D"),NlsMenu.getPrf(it,this));setMnIcon(this,it,"N");}this.lsItm=null}if(this.winElmt!=null&&this.winElmt.length>0){for(i=0;i<this.winElmt.length;i++){this.winElmt[i].style.visibility="visible"}}$wrtStatus("");};NLSMENU.hasSubmenu=function(key){var it=this.getItemById(key),w=(it.crsFrame?it.subFrame:window);return w.nlsGetMenu(it.subMenuId);};function $itemClick(mn,it){var mgr=nlsMenuMgr[mn.mgrId];mgr.hideMenus();$crsFrameDo(mgr,function(f,mg){f.hideAllNlsMenu();});var trgt=it.target;if(trgt==null)trgt=$aonvl(mn.target,"_self");if(it.url!=""){open(it.url,trgt);}else{return mn.menuOnClick(mn.mId,it.id);}};NLSMENU.$menuItemClick=function(e,itemId){var it=this.items[itemId];if(!it.enable)return;var prf=NlsMenu.getPrf(it,this),oIt=NlsMenu.$GE(itemId),mgr=this.mgr;if(this.isMenubar&&this.dropOnClick&&(this.hasSubmenu(it.id)||it.rt.subUrl)){if(!this.isMenuOpened){NlsMenu.showMenu(this,it);if(this.firstClickOnly)this.isMenuOpened=true}else{mgr.hideMenus();setMnStyle(oIt,(it.enable?"O":"D"),prf);setMnIcon(this,it,"O");this.isMenuOpened=false;return null}}else{if(it.toggle){this.setItemState(itemId,(it.state==1?2:1));}else if(this.selection){this.setSelection(itemId,true);}else if(mgr.memorizeSel){mgr.selectPath(this.mId,it.id);mgr.savePath(itemId);}return $itemClick(this,it);}};NLSMENU.menuOnClick=function(menuId,itemId){return true};NLSMENU.menuOnShow=function(menuId){return true};NLSMENU.menuOnHide=function(menuId){return true};NLSMENU.reload=function(dh){var ef=this.effect;if(ef){ef.elm=null;ef.prop["init"]=false}this.lsItm=null;if(dh!=true)this.mgr.hideMenus();var m=NlsMenu.$GE(this.mId);m.innerHTML=this.renderMenu("content");};NLSMENU.setProperties=function(obj){for(var p in obj){if(p=="items"){for(var it in obj[p]){this.setItemProperties(it,obj[p][it]);}}else this[p]=obj[p]}};NLSMENU.setItemProperties=function(id,obj){var it=this.getItemById(id);for(var p in obj){it[p]=obj[p]}};function setMnIcon(mn,mnItm,f){var tf=(mnItm.enable?f:"D"),ico=$aonevl(mnItm.ico,mn.itemIco);if(mn.showIcon&&ico&&ico.length>1){var k=mnItm.intKey;var c=NlsMenu.$GE("ic_"+k),o=NlsMenu.$GE("icovr_"+k),d=NlsMenu.$GE("icdis_"+k);c.style.display=(tf=="N"||(tf=="D"&&!d)?"":"none");o.style.display=(tf=="O"?"":"none");if(d)d.style.display=(tf=="D"?"":"none");}if(mn.showSubIcon&&mnItm.subMenuId!=""){var ic=NlsMenu.$GE("subicovr_"+mnItm.intKey);if(ic){ic.style.display=(tf=="O"?"":"none");ic=NlsMenu.$GE("subic_"+mnItm.intKey);if(ic)ic.style.display=(tf=="N"||tf=="D"?"":"none");}}};function setMnStyle(it,s,prefix){var suff=(s=="O"?"over":(s=="S"?"sel":"")),cn;it.className=prefix+"nlsitemcontainer"+suff;var r=it.childNodes[0].rows[0],rc=null;for(var i=0;i<r.cells.length;i++){rc=r.cells[i];if(rc.id==it.id+"x1")cn=prefix+"nlsiconcell"+suff;if(rc.id==it.id+"x2")cn=prefix+"nlsitem"+(s=="D"?"disable":suff);if(rc.id==it.id+"x3")cn=prefix+"nlssubmenucell"+suff;rc.className=cn}};function nls_getXY(oIt){var p={};p.x=0;p.y=0;p.x2=0;p.y2=0;var tmp=oIt;var d=document;while(tmp){p.x+=tmp.offsetLeft;p.y+=tmp.offsetTop;tmp=tmp.offsetParent};p.x-=(window.scrollX||d.body.scrollLeft||d.documentElement.scrollLeft);p.y-=(window.scrollY||d.body.scrollTop||d.documentElement.scrollTop);if(oIt){p.x2=p.x+oIt.offsetWidth;p.y2=p.y+oIt.offsetHeight};return p};NlsMenu.showMenu=function(mn,it){if(it.rt.subUrl&&it.rt.loaded==0){NlsMenuUtil.loadAJAXMenu(mn,it);}else{NlsMenu.$showMenu(mn,it);}};NlsMenu.$showMenu=function(prMenu,it){var oIt=NlsMenu.$GE(it.intKey);if(it.subMenuId!=""&&it.enable==true){var p=nls_getXY(oIt),smn;if(it.crsFrame){var ps=it.subPos;if(ps[0]=="REL"){}else{p.x=ps[0];p.x2=p.x}if(ps[1]=="REL"){}else{p.y=ps[1];p.y2=p.y}if(!it.subFrame.nlsGetMenu)return;smn=it.subFrame.nlsGetMenu(it.subMenuId);if(!smn)return}else{smn=nlsGetMenu(it.subMenuId);if(!smn)return;if(smn.zIndex<=prMenu.zIndex){smn.zIndex=prMenu.zIndex+1}var ma=prMenu.rt.ma;if(ma){p.y-=ma.scrollTop;p.y2-=ma.scrollTop}}smn.showMenu(p.x,p.y,p.x2,p.y2,prMenu.orient,it.subDir,it.subPosAdj);}};NlsMenu.getPrf=function(it,mn){return $aonevl(it.stlprf,mn.stlprf);};function nls_showMenu(mId,oIt,orient,subDir,subPosAdj){var mn=nlsGetMenu(mId),p;if(!mn){hideAllNlsMenu();return}mn.mgr.clearTimeout();if(mn.rt.active)return;p=nls_getXY(oIt);mn.mgr.hideMenus();mn.showMenu(p.x,p.y,p.x2,p.y2,orient,subDir,subPosAdj);}function nls_hideMenu(mId){var m=nlsGetMenu(mId);if(m)$nlsMenuOut(m.mgrId);}function $nlsMenuOver(mgrId,mId){var mgr=nlsMenuMgr[mgrId],mn=mgr.getMenu(mId);mgr.clearTimeout();if(mgr.rt.cmId!=mId){clearTimeout(mgr.rt.ctm);mgr.rt.ctm=null}$crsFrameDo(mgr,function(f,mg){f.clearTimeout(mg.rt.ctm);mg.rt.ctm=null});if(mgr.rt.cmId!=mId)$$nlsItemOver1(null,mId+"_dmy");};function $nlsMenuOut(mgrId){var mgr=nlsMenuMgr[mgrId];if(mgr.design==true)return;mgr.clearTimeout();mgr.setTimeout(function(){mgr.hideMenus();},mgr.timeout);$crsFrameDo(mgr,function(f,mg){mg.clearTimeout();mg.setTimeout(function(){mg.hideMenus()},mg.timeout);});};function $nlsItemOver(e,mId,itId){$$nlsItemOver1(e,itId);$$nlsItemOver2(mId,itId);e.cancelBubble=true}function $nlsItemOut(e,mId){var mn=nlsMenu[mId],mgr=mn.mgr;mgr.rt.cmId=mId;mgr.rt.ctm=setTimeout(function(){$$nlsItemOver1(e,mId+"_$dmy")},300);}function $$nlsItemOver1(e,itId){var m=itId.split("_"),mn=nlsMenu[m[0]],mgr=mn.mgr;if(mgr.rt.cmId){clearTimeout(mgr.rt.ctm);mgr.rt.ctm=null}$crsFrameDo(mgr,function(f,mg){f.clearTimeout(mg.rt.ctm);mg.rt.ctm=null});if(mn.mgr.design==true)return;if(!mn.rt.active||!mn.rt.ready)return;var it=null,st="",nli=null,li=mn.lsItm;if(li!=null){it=mn.items[li.id];if(!it)return;if(it.intKey==itId)return;if(it.state!=2&&!it.selected){var st=NlsMenu.getPrf(it,mn);var ef=(it.itemEffect!=null);if(ef){it.itemEffect.init();}setMnStyle(li,(it.enable?"N":"D"),st);setMnIcon(mn,it,"N");if(ef){it.itemEffect.start();}}var w=it.crsFrame?it.subFrame:window,tmp=null;if(w.nlsGetMenu)tmp=w.nlsGetMenu(it.subMenuId);while(tmp!=null){nli=null;if(tmp.lsItm){it=tmp.items[tmp.lsItm.id];w=it.crsFrame?it.subFrame:tmp.wnd;nli=w.nlsGetMenu(it.subMenuId);}tmp.hideMenu();tmp=nli}}mn.lsItm=null;var oIt=NlsMenu.$GE(itId);it=mn.items[itId];if(!it)return;$wrtStatus(it.url);if(it.state!=2&&!it.selected){if(it.itemEffect!=null){it.itemEffect.init();}setMnStyle(oIt,(it.enable?"O":"D"),NlsMenu.getPrf(it,mn));setMnIcon(mn,it,"O");if(it.itemEffect!=null){it.itemEffect.start();}}if(!mn.isMenubar||(mn.isMenubar&&!mn.dropOnClick)||(mn.isMenubar&&mn.dropOnClick&&mn.isMenuOpened)){NlsMenu.showMenu(mn,it);}mn.lsItm=oIt};function $$nlsItemOver2(mId,itId){var mn=nlsMenu[mId],mgr=mn.mgr;if(mgr.design==true)return;mgr.clearTimeout();$crsFrameDo(mgr,function(f,mg){mg.clearTimeout()});for(var it in nlsMenuMgr){if(it!=mgr.mgrId){nlsMenuMgr[it].hideMenus();}}}function $crsFrameDo(mgr,f){var a=mgr.assocMenuMgr,frm;if(a&&a.length>0){for(var i=0;i<a.length;i++){frm=a[i];if(!frm[0].nlsMenuMgr)continue;f(frm[0],frm[0].nlsMenuMgr[frm[1]]);}}}function nlsGetMenu(mId){return nlsMenu[mId]};function hideAllNlsMenu(){for(it in nlsMenu){if(nlsMenu[it].rt.active)nlsMenu[it].hideMenu();}};function $wrtStatus(s){if(typeof(window.status)!="undefined")window.status=s}function $aonvl(v,c){if(v)return v;else return c};function $aonevl(v,c){if(!v||v=="")return c;else return v};NlsMenu.$GE=function(id){if(document.all){return document.all(id);}else if(document.getElementById){return document.getElementById(id);}};