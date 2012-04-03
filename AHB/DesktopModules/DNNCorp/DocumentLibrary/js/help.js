var g_iHelpTimeoutId = null;
var g_sHelpDivId = null;

function HelpMouseActions(sDivId, bVisible){		
	var oDiv=window.document.getElementById(sDivId);
	if (bVisible == true) {
		if (g_sHelpDivId == sDivId) { 
			window.clearTimeout(g_iHelpTimeoutId);
		} else {
			g_sHelpDivId = sDivId;
		}
		oDiv.style.visibility='visible';
		oDiv.style.display='block';
		try {
			if ( g_DNNDDId != '') {document.getElementById(g_DNNDDId).style.position = '';}
		}catch(e){}
	} else {
		oDiv.style.display='none';
	}
}	