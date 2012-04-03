
var g_oTabGlobals = new Object();

/****************************************************************/
/* preload tab images												*/
/****************************************************************/
function preloadTabImages() {
	for (i = 1; i < arguments.length; i++) {
		g_oTabGlobals[arguments[0]].imgArray[i] = new Image();	
		g_oTabGlobals[arguments[0]].imgArray[i].src = arguments[i];			
	}
}

function showTabTitle(sShowTabTitleId,sHideTabTitleId){
	document.getElementById(sShowTabTitleId).style.display="";	
	document.getElementById(sHideTabTitleId).style.display="none";	
}

function showTabContent(sCurrentTabId, oAnchor, sGUID)
{		
	if (sCurrentTabId == g_oTabGlobals[sGUID].previousTabId) 
		g_oTabGlobals[sGUID].previousTabId = g_oTabGlobals[sGUID].defaultTabId;
	
	if (document.getElementById)
	{
		highlightTab(oAnchor, sGUID);
		
		if (g_oTabGlobals[sGUID].previousTabId != "")  {
			var oPreviousTab = document.getElementById(g_oTabGlobals[sGUID].previousTabId);
			if (oPreviousTab != null) {
				oPreviousTab.style.display="none";
			}
		}
		
		document.getElementById(sCurrentTabId).style.display="block";
		
		g_oTabGlobals[sGUID].previousTabId = sCurrentTabId;
		
	}
}

function highlightTab(oAnchor, sGUID)
{
	var oTabs = getTabs(sGUID);

	for (i=0; i < oTabs.length; i++) {
		oTabs[i].className="";
	}
	oAnchor.className="current";
	oAnchor.blur();
}

function getTabs(sGUID)
{
	var oTabWrapper = document.getElementById(g_oTabGlobals[sGUID].tabStrips);
	return oTabWrapper.getElementsByTagName("A");
}
