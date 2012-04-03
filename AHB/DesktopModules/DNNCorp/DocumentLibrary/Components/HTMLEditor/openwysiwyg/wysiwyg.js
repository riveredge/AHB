//
// openWYSIWYG v1.01 Copyright (c) 2006 openWebWare.com
// This copyright notice MUST stay intact for use.
//
// An open source WYSIWYG editor for use in web based applications.
// For full source code and docs, visit http://www.openwebware.com/
//
// This library is free software; you can redistribute it and/or modify 
// it under the terms of the GNU Lesser General Public License as published 
// by the Free Software Foundation; either version 2.1 of the License, or 
// (at your option) any later version.
//
// This library is distributed in the hope that it will be useful, but 
// WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
// or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public 
// License for more details.
//
// You should have received a copy of the GNU Lesser General Public License along 
// with this library; if not, write to the Free Software Foundation, Inc., 59 
// Temple Place, Suite 330, Boston, MA 02111-1307 USA 

/* ---------------------------------------------------------------------- *\
  Global Variables: Set global variables such as images directory, 
					WYSIWYG Height, Width, and CSS Directory.
\* ---------------------------------------------------------------------- */
_dnnImagesDir = "icons/";
_dnnCssDir = "styles/";
_dnnPopupsDir = "popups/";
_dnnWysiwygHeight = 150;
//_dnnWysiwygWidth = 500;


/* ---------------------------------------------------------------------- *\
  Toolbar Settings: Set the features and buttons available in the WYSIWYG
	                  Toolbar.
\* ---------------------------------------------------------------------- */
var _dnnFonts = new Array();
var _dnnBlockFormats = new Array();
var _dnnFontSizes = new Array();
var _dnnButtonName = new Array();
var _dnnButtonName2 = new Array();
var _dnnToolbarList = null;	

// Create viewTextMode global variable and set to 0 enabling all toolbar commands while in HTML mode
var _dnnViewTextMode = 0;

  	
function initialize_wysiwyg () {

	// Include Style Sheet
	document.write("<link rel='stylesheet' type='text/css' href='" +_dnnCssDir+ "styles.css'>\n");

	



	// List of available font types
  	_dnnFonts[0] = "Arial";
  	_dnnFonts[1] = "Sans Serif";
  	_dnnFonts[2] = "Tahoma";
	_dnnFonts[3] = "Verdana";
	_dnnFonts[4] = "Courier New";
	_dnnFonts[5] = "Georgia";
	_dnnFonts[6] = "Times New Roman";
	_dnnFonts[7] = "Impact";
  	_dnnFonts[8] = "Comic Sans MS";

	// List of available block formats (not in use)
  	_dnnBlockFormats[0]  = "Address";
  	_dnnBlockFormats[1]  = "Bulleted List";
  	_dnnBlockFormats[2]  = "Definition";
	_dnnBlockFormats[3]  = "Definition Term";
	_dnnBlockFormats[4]  = "Directory List";
	_dnnBlockFormats[5]  = "Formatted";
	_dnnBlockFormats[6]  = "Heading 1";
	_dnnBlockFormats[7]  = "Heading 2";
	_dnnBlockFormats[8]  = "Heading 3";
	_dnnBlockFormats[9]  = "Heading 4";
	_dnnBlockFormats[10] = "Heading 5";
	_dnnBlockFormats[11] = "Heading 6";
	_dnnBlockFormats[12] = "Menu List";
	_dnnBlockFormats[13] = "Normal";
	_dnnBlockFormats[14] = "Numbered List";

	// List of available font sizes
  	_dnnFontSizes[0]  = "1";
  	_dnnFontSizes[1]  = "2";
  	_dnnFontSizes[2]  = "3";
	_dnnFontSizes[3]  = "4";
	_dnnFontSizes[4]  = "5";
	_dnnFontSizes[5]  = "6";
	_dnnFontSizes[6]  = "7";

	// Order of available commands in toolbar one
	_dnnButtonName[0]  = "bold";
  	_dnnButtonName[1]  = "italic";
  	_dnnButtonName[2]  = "underline";
	//_dnnButtonName[3]  = "strikethrough";
  	_dnnButtonName[3]  = "seperator";
	//_dnnButtonName[5]  = "subscript";
	//_dnnButtonName[6]  = "superscript";
	//_dnnButtonName[5]  = "seperator";
	_dnnButtonName[4]  = "justifyleft";
	_dnnButtonName[5]  = "justifycenter";
	_dnnButtonName[6] = "justifyright";
	_dnnButtonName[7] = "seperator";
	_dnnButtonName[8] = "unorderedlist";
	_dnnButtonName[9] = "orderedlist";
	_dnnButtonName[10] = "outdent";
	_dnnButtonName[11] = "indent";

	// Order of available commands in toolbar two
  	_dnnButtonName2[0]  = "forecolor";
	_dnnButtonName2[1]  = "backcolor";
	_dnnButtonName2[2]  = "seperator";
	_dnnButtonName2[3]  = "cut";
	_dnnButtonName2[4]  = "copy";
	_dnnButtonName2[5]  = "paste";
	_dnnButtonName2[6]  = "seperator";
  	_dnnButtonName2[7]  = "undo";
	_dnnButtonName2[8]  = "redo";
  	_dnnButtonName2[9]  = "seperator";
	_dnnButtonName2[10]  = "inserttable";
  	_dnnButtonName2[11]  = "insertimage";
  	_dnnButtonName2[12]  = "createlink";
	_dnnButtonName2[13]  = "seperator";
	_dnnButtonName2[14]  = "viewSource";
	//_dnnButtonName2[15]  = "seperator";
  	//_dnnButtonName2[16]  = "help";
	
	// List of available actions and their respective ID and images
	_dnnToolbarList = {
	//Name              buttonID                 buttonTitle           buttonImage                            buttonImageRollover
  	"bold":           ['Bold',                 'Bold',               _dnnImagesDir + 'bold.gif',               _dnnImagesDir + 'bold_on.gif'],
  	"italic":         ['Italic',               'Italic',             _dnnImagesDir + 'italics.gif',            _dnnImagesDir + 'italics_on.gif'],
  	"underline":      ['Underline',            'Underline',          _dnnImagesDir + 'underline.gif',          _dnnImagesDir + 'underline_on.gif'],
	"strikethrough":  ['Strikethrough',        'Strikethrough',      _dnnImagesDir + 'strikethrough.gif',      _dnnImagesDir + 'strikethrough_on.gif'],
	"seperator":      ['',                     '',                   _dnnImagesDir + 'seperator.gif',          _dnnImagesDir + 'seperator.gif'],
	//"subscript":      ['Subscript',            'Subscript',          _dnnImagesDir + 'subscript.gif',          _dnnImagesDir + 'subscript_on.gif'],
	//"superscript":    ['Superscript',          'Superscript',        _dnnImagesDir + 'superscript.gif',        _dnnImagesDir + 'superscript_on.gif'],
	"justifyleft":    ['Justifyleft',          'Justifyleft',        _dnnImagesDir + 'justify_left.gif',       _dnnImagesDir + 'justify_left_on.gif'],
	"justifycenter":  ['Justifycenter',        'Justifycenter',      _dnnImagesDir + 'justify_center.gif',     _dnnImagesDir + 'justify_center_on.gif'],
	"justifyright":   ['Justifyright',         'Justifyright',       _dnnImagesDir + 'justify_right.gif',      _dnnImagesDir + 'justify_right_on.gif'],
	"unorderedlist":  ['InsertUnorderedList',  'InsertUnorderedList',_dnnImagesDir + 'list_unordered.gif',     _dnnImagesDir + 'list_unordered_on.gif'],
	"orderedlist":    ['InsertOrderedList',    'InsertOrderedList',  _dnnImagesDir + 'list_ordered.gif',       _dnnImagesDir + 'list_ordered_on.gif'],
	"outdent":        ['Outdent',              'Outdent',            _dnnImagesDir + 'indent_left.gif',        _dnnImagesDir + 'indent_left_on.gif'],
	"indent":         ['Indent',               'Indent',             _dnnImagesDir + 'indent_right.gif',       _dnnImagesDir + 'indent_right_on.gif'],
	"cut":            ['Cut',                  'Cut',                _dnnImagesDir + 'cut.gif',                _dnnImagesDir + 'cut_on.gif'],
	"copy":           ['Copy',                 'Copy',               _dnnImagesDir + 'copy.gif',               _dnnImagesDir + 'copy_on.gif'],
  	"paste":          ['Paste',                'Paste',              _dnnImagesDir + 'paste.gif',              _dnnImagesDir + 'paste_on.gif'],
	"forecolor":      ['ForeColor',            'ForeColor',          _dnnImagesDir + 'forecolor.gif',          _dnnImagesDir + 'forecolor_on.gif'],
	"backcolor":      ['BackColor',            'BackColor',          _dnnImagesDir + 'backcolor.gif',          _dnnImagesDir + 'backcolor_on.gif'],
	"undo":           ['Undo',                 'Undo',               _dnnImagesDir + 'undo.gif',               _dnnImagesDir + 'undo_on.gif'],
	"redo":           ['Redo',                 'Redo',               _dnnImagesDir + 'redo.gif',               _dnnImagesDir + 'redo_on.gif'],
	"inserttable":    ['InsertTable',          'InsertTable',        _dnnImagesDir + 'insert_table.gif',       _dnnImagesDir + 'insert_table_on.gif'],
	"insertimage":    ['InsertImage',          'InsertImage',        _dnnImagesDir + 'insert_picture.gif',     _dnnImagesDir + 'insert_picture_on.gif'],
	"createlink":     ['CreateLink',           'CreateLink',         _dnnImagesDir + 'insert_hyperlink.gif',   _dnnImagesDir + 'insert_hyperlink_on.gif'],
	"viewSource":     ['ViewSource',           'ViewSource',         _dnnImagesDir + 'view_source.gif',        _dnnImagesDir + 'view_source_on.gif'],
	"viewText":       ['ViewText',             'ViewText',           _dnnImagesDir + 'view_text.gif',          _dnnImagesDir + 'view_text_on.gif'],
	"help":           ['Help',                 'Help',               _dnnImagesDir + 'help.gif',               _dnnImagesDir + 'help_on.gif'],
	"selectfont":     ['SelectFont',           'SelectFont',         _dnnImagesDir + 'select_font.gif',        _dnnImagesDir + 'select_font_on.gif'],
	"selectsize":     ['SelectSize',           'SelectSize',         _dnnImagesDir + 'select_size.gif',        _dnnImagesDir + 'select_size_on.gif']
	};
}

/* ---------------------------------------------------------------------- *\
  Function    : insertAdjacentHTML(), insertAdjacentText() and insertAdjacentElement()
  Description : Emulates insertAdjacentHTML(), insertAdjacentText() and 
	              insertAdjacentElement() three functions so they work with 
								Netscape 6/Mozilla
  Notes       : by Thor Larholm me@jscript.dk
\* ---------------------------------------------------------------------- */
if(typeof HTMLElement!="undefined" && !HTMLElement.prototype.insertAdjacentElement){
  HTMLElement.prototype.insertAdjacentElement = function
  (where,parsedNode)
	{
	  switch (where){
		case 'beforeBegin':
			this.parentNode.insertBefore(parsedNode,this)
			break;
		case 'afterBegin':
			this.insertBefore(parsedNode,this.firstChild);
			break;
		case 'beforeEnd':
			this.appendChild(parsedNode);
			break;
		case 'afterEnd':
			if (this.nextSibling) 
      this.parentNode.insertBefore(parsedNode,this.nextSibling);
			else this.parentNode.appendChild(parsedNode);
			break;
		}
	}

	HTMLElement.prototype.insertAdjacentHTML = function
  (where,htmlStr)
	{
		var r = this.ownerDocument.createRange();
		r.setStartBefore(this);
		var parsedHTML = r.createContextualFragment(htmlStr);
		this.insertAdjacentElement(where,parsedHTML)
	}


	HTMLElement.prototype.insertAdjacentText = function
  (where,txtStr)
	{
		var parsedText = document.createTextNode(txtStr)
		this.insertAdjacentElement(where,parsedText)
	}
};





/* ---------------------------------------------------------------------- *\
  Function    : generate_wysiwyg()
  Description : replace textarea with wysiwyg editor
  Usage       : generate_wysiwyg("textarea_id");
  Arguments   : textarea_id - ID of textarea to replace
\* ---------------------------------------------------------------------- */
function generate_wysiwyg(textareaID) {
 
  	// Hide the textarea 
	document.getElementById(textareaID).style.display = 'none'; 
	
	// Pass the textareaID to the "n" variable.
	var n = textareaID;
	
	// Toolbars width is 2 pixels wider than the wysiwygs
	//toolbarWidth = parseFloat(_dnnWysiwygWidth) + 2;
	
	// Generate WYSIWYG toolbar one
	var toolbar;
	toolbar =  '<table cellpadding="0" cellspacing="0" border="0" class="toolbar1" style="width:100%;"><tr><td style="width: 6px;"><img src="' +_dnnImagesDir+ 'seperator2.gif" alt="" hspace="3"></td>';
  
	// Create IDs for inserting Font Type and Size drop downs
	toolbar += '<td style="width: 90px;"><span id="FontSelect' + n + '"></span></td>';
	toolbar += '<td style="width: 60px;"><span id="FontSizes'  + n + '"></span></td>';
  
	// Output all command buttons that belong to toolbar one
	for (var i = 0; i <= _dnnButtonName.length;) { 
		if (_dnnButtonName[i]) {
			var buttonObj            = _dnnToolbarList[_dnnButtonName[i]];
			var buttonID             = buttonObj[0];
			var buttonTitle          = buttonObj[1];
			var buttonImage          = buttonObj[2];
			var buttonImageRollover  = buttonObj[3];
	    
			if (_dnnButtonName[i] == "seperator") {
				toolbar += '<td style="width: 12px;" align="center"><img src="' +buttonImage+ '" border=0 unselectable="on" width="2" height="18" hspace="2" unselectable="on"></td>';
			}
			else {
				toolbar += '<td style="width: 22px;"><img src="' +buttonImage+ '" border=0 unselectable="on" title="' +buttonTitle+ '" id="' +buttonID+ '" class="button" onClick="formatText(this.id,\'' + n + '\');" onmouseover="if(className==\'button\'){className=\'buttonOver\'}; this.src=\'' + buttonImageRollover + '\';" onmouseout="if(className==\'buttonOver\'){className=\'button\'}; this.src=\'' + buttonImage + '\';" unselectable="on" width="20" height="20"></td>';
			}
		}
		i++;
	}

	toolbar += '<td>&nbsp;</td></tr></table>';  

	// Generate WYSIWYG toolbar two
	var toolbar2;
	toolbar2 = '<table cellpadding="0" cellspacing="0" border="0" class="toolbar2" style="width:100%;"><tr><td style="width: 6px;"><img src="' +_dnnImagesDir+ 'seperator2.gif" alt="" hspace="3"></td>';
 
	// Output all command buttons that belong to toolbar two
	for (var j = 0; j <= _dnnButtonName2.length;) {
		if (_dnnButtonName2[j]) {
			var buttonObj            = _dnnToolbarList[_dnnButtonName2[j]];
			var buttonID             = buttonObj[0];
			var buttonTitle          = buttonObj[1];
			var buttonImage          = buttonObj[2];
			var buttonImageRollover  = buttonObj[3];
		  
			if (_dnnButtonName2[j] == "seperator") {
				toolbar2 += '<td style="width: 12px;" align="center"><img src="' +buttonImage+ '" border=0 unselectable="on" width="2" height="18" hspace="2" unselectable="on"></td>';
			}
			else if (_dnnButtonName2[j] == "viewSource"){
				toolbar2 += '<td style="width: 22px;">';
				toolbar2 += '<span id="HTMLMode' + n + '"><img src="'  +buttonImage+  '" border=0 unselectable="on" title="' +buttonTitle+ '" id="' +buttonID+ '" class="button" onClick="formatText(this.id,\'' + n + '\');" onmouseover="if(className==\'button\'){className=\'buttonOver\'}; this.src=\'' +buttonImageRollover+ '\';" onmouseout="if(className==\'buttonOver\'){className=\'button\'}; this.src=\'' + buttonImage + '\';" unselectable="on"  width="20" height="20"></span>';
				toolbar2 += '<span id="textMode' + n + '"><img src="' +_dnnImagesDir+ 'view_text.gif" border=0 unselectable="on" title="viewText"          id="ViewText"       class="button" onClick="formatText(this.id,\'' + n + '\');" onmouseover="if(className==\'button\'){className=\'buttonOver\'}; this.src=\'' +_dnnImagesDir+ 'view_text_on.gif\';"    onmouseout="if(className==\'buttonOver\'){className=\'button\'}; this.src=\'' +_dnnImagesDir+ 'view_text.gif\';" unselectable="on"  width="20" height="20"></span>';
				toolbar2 += '</td>';
			}
			else {
				toolbar2 += '<td style="width: 22px;"><img src="' +buttonImage+ '" border=0 unselectable="on" title="' +buttonTitle+ '" id="' +buttonID+ '" class="button" onClick="formatText(this.id,\'' + n + '\');" onmouseover="if(className==\'button\'){className=\'buttonOver\'}; this.src=\'' +buttonImageRollover+ '\';" onmouseout="if(className==\'buttonOver\'){className=\'button\'}; this.src=\'' + buttonImage + '\';" unselectable="on" width="20" height="20"></td>';
			}
		}
		j++;
	}

	toolbar2 += '<td>&nbsp;</td></tr></table>';  
	
 	
	// Create iframe which will be used for rich text editing
	var iframe = '<table cellpadding="0" cellspacing="0" border="0" style="width:100%; height:' + _dnnWysiwygHeight + 'px;border: 1px solid #CCCCCC;"><tr><td valign="top">\n'
	+ '<iframe frameborder="0" id="wysiwyg' + n + '"></iframe>\n'
	+ '</td></tr></table>\n';

	// Insert after the textArea both toolbar one and two
	document.getElementById(n).insertAdjacentHTML("afterEnd", toolbar + toolbar2 + iframe);
	
	// Insert the Font Type and Size drop downs into the toolbar
	outputFontSelect(n);
	outputFontSizes(n); 
	
	// Hide the dynamic drop down lists for the Font Types and Sizes
	hideFonts(n);
	hideFontSizes(n);
	
	// Hide the "Text Mode" button
	document.getElementById("textMode" + n).style.display = 'none'; 
	
	// Give the iframe the global wysiwyg height and width
	document.getElementById("wysiwyg" + n).style.height = _dnnWysiwygHeight + "px";
	document.getElementById("wysiwyg" + n).style.width = '100%';
	
	// Pass the textarea's existing text over to the content variable
	var content = document.getElementById(n).value;
	var doc = document.getElementById("wysiwyg" + n).contentWindow.document;
	
	// Write the textarea's content into the iframe	
	doc.open();
	doc.write(content);
	doc.close();


	// Make the iframe editable in both Mozilla and IE
	doc.body.contentEditable = true;
	doc.designMode = "on";



	
  	
  	// Update the textarea with content in WYSIWYG when user submits form
	/*
  var browserName = navigator.appName;
  if (browserName == "Microsoft Internet Explorer") {
    for (var idx=0; idx < document.forms.length; idx++) {
		document.forms[idx].attachEvent('onsubmit', function() { updateTextArea(n); });
    }
  }
  else {
  	for (var idx=0; idx < document.forms.length; idx++) {
    	document.forms[idx].addEventListener('submit',function OnSumbmit() { updateTextArea(n); }, true);
    }
  }
 	*/

};





/* ---------------------------------------------------------------------- *\
  Function    : formatText()
  Description : replace textarea with wysiwyg editor
  Usage       : formatText(id, n, selected);
  Arguments   : id - The execCommand (e.g. Bold)
                n  - The editor identifier that the command 
								     affects (the textarea's ID)
                selected - The selected value when applicable (e.g. Arial)
\* ---------------------------------------------------------------------- */
function formatText(id, n, selected) {

  // When user clicks toolbar button make sure it always targets its respective WYSIWYG
  document.getElementById("wysiwyg" + n).contentWindow.focus();
	
	// When in Text Mode these execCommands are disabled
	//var formatIDs = new Array("FontSize","FontName","Bold","Italic","Underline","Subscript","Superscript","Strikethrough","Justifyleft","Justifyright","Justifycenter","InsertUnorderedList","InsertOrderedList","Indent","Outdent","ForeColor","BackColor","InsertImage","InsertTable","CreateLink");
	var formatIDs = new Array("FontSize","FontName","Bold","Italic","Underline","Justifyleft","Justifyright","Justifycenter","InsertUnorderedList","InsertOrderedList","Indent","Outdent","ForeColor","BackColor","InsertImage","InsertTable","CreateLink");
  
	// Check if button clicked is in disabled list
	for (var i = 0; i <= formatIDs.length;) {
		if (formatIDs[i] == id) {
			 var disabled_id = 1; 
		}
	  i++;
	}
	
	// Check if in Text Mode and disabled button was clicked
	if (_dnnViewTextMode == 1 && disabled_id == 1) {
	  alert ("You are in HTML Mode. This feature has been disabled.");	
	}
	
	else {
	
	  // FontSize
	  if (id == "FontSize") {
      document.getElementById("wysiwyg" + n).contentWindow.document.execCommand("FontSize", false, selected);
	  }
	  
		// FontName
	  else if (id == "FontName") {
      document.getElementById("wysiwyg" + n).contentWindow.document.execCommand("FontName", false, selected);
	  }
	
	  // ForeColor and BackColor
    else if (id == 'ForeColor' || id == 'BackColor') {
      var w = screen.availWidth;
      var h = screen.availHeight;
      var popW = 210, popH = 165;
      var leftPos = (w-popW)/2, topPos = (h-popH)/2;
      var currentColor = _dec_to_rgb(document.getElementById("wysiwyg" + n).contentWindow.document.queryCommandValue(id));
   
	    window.open(_dnnPopupsDir + 'select_color.html?color=' + currentColor + '&command=' + id + '&wysiwyg=' + n,'popup','location=0,status=0,scrollbars=0,width=' + popW + ',height=' + popH + ',top=' + topPos + ',left=' + leftPos);
    }
	  
		// InsertImage
	  else if (id == "InsertImage") {
      window.open(_dnnPopupsDir + 'insert_image.html?wysiwyg=' + n,'popup','location=0,status=0,scrollbars=0,resizable=0,width=400,height=190');
	  }
	  
		// InsertTable
	  else if (id == "InsertTable") {
	    window.open(_dnnPopupsDir + 'create_table.html?wysiwyg=' + n,'popup','location=0,status=0,scrollbars=0,resizable=0,width=400,height=360');
	  }
	  
		// CreateLink
	  else if (id == "CreateLink") {
	    window.open(_dnnPopupsDir + 'insert_hyperlink.html?wysiwyg=' + n,'popup','location=0,status=0,scrollbars=0,resizable=0,width=300,height=110');
	  }
	  
		// ViewSource
    else if (id == "ViewSource") {
	    viewSource(n);
	  }
		
		// ViewText
		else if (id == "ViewText") {
	    viewText(n);
	  }

		// Help
		else if (id == "Help") {
	    window.open(_dnnPopupsDir + 'about.html','popup','location=0,status=0,scrollbars=0,resizable=0,width=400,height=330');
	  }
	  
		// Every other command
	  else {
      document.getElementById("wysiwyg" + n).contentWindow.document.execCommand(id, false, null);
		}
  }
};



/* ---------------------------------------------------------------------- *\
  Function    : insertHTML()
  Description : insert HTML into WYSIWYG in rich text
  Usage       : insertHTML(<b>hello</b>, "textareaID")
  Arguments   : html - The HTML being inserted (e.g. <b>hello</b>)
                n  - The editor identifier that the HTML 
								     will be inserted into (the textarea's ID)
\* ---------------------------------------------------------------------- */
function insertHTML(html, n) {

  var browserName = navigator.appName;
	 	 
	if (browserName == "Microsoft Internet Explorer") {	  
	  document.getElementById('wysiwyg' + n).contentWindow.document.selection.createRange().pasteHTML(html);   
	} 
	 
	else {
	  var div = document.getElementById('wysiwyg' + n).contentWindow.document.createElement("div");
		 
		div.innerHTML = html;
		var node = insertNodeAtSelection(div, n);		
	}
	
}


/* ---------------------------------------------------------------------- *\
  Function    : insertNodeAtSelection()
  Description : insert HTML into WYSIWYG in rich text (mozilla)
  Usage       : insertNodeAtSelection(insertNode, n)
  Arguments   : insertNode - The HTML being inserted (must be innerHTML 
	                           inserted within a div element)
                n          - The editor identifier that the HTML will be 
								             inserted into (the textarea's ID)
\* ---------------------------------------------------------------------- */
function insertNodeAtSelection(insertNode, n) {
  // get current selection
  var sel = document.getElementById('wysiwyg' + n).contentWindow.getSelection();

  // get the first range of the selection
  // (there's almost always only one range)
  var range = sel.getRangeAt(0);

  // deselect everything
  sel.removeAllRanges();

  // remove content of current selection from document
  range.deleteContents();

  // get location of current selection
  var container = range.startContainer;
  var pos = range.startOffset;

  // make a new range for the new selection
  range=document.createRange();

  if (container.nodeType==3 && insertNode.nodeType==3) {

    // if we insert text in a textnode, do optimized insertion
    container.insertData(pos, insertNode.nodeValue);

    // put cursor after inserted text
    range.setEnd(container, pos+insertNode.length);
    range.setStart(container, pos+insertNode.length);
  } 
	
	else {
    var afterNode;
    
		if (container.nodeType==3) {
      // when inserting into a textnode
      // we create 2 new textnodes
      // and put the insertNode in between

      var textNode = container;
      container = textNode.parentNode;
      var text = textNode.nodeValue;

      // text before the split
      var textBefore = text.substr(0,pos);
      // text after the split
      var textAfter = text.substr(pos);

      var beforeNode = document.createTextNode(textBefore);
      afterNode = document.createTextNode(textAfter);

      // insert the 3 new nodes before the old one
      container.insertBefore(afterNode, textNode);
      container.insertBefore(insertNode, afterNode);
      container.insertBefore(beforeNode, insertNode);

      // remove the old node
      container.removeChild(textNode);
    } 
	
	  else {
      // else simply insert the node
      afterNode = container.childNodes[pos];
      container.insertBefore(insertNode, afterNode);
    }

    range.setEnd(afterNode, 0);
    range.setStart(afterNode, 0);
  }

  sel.addRange(range);
};

	

/* ---------------------------------------------------------------------- *\
  Function    : _dec_to_rgb
  Description : convert a decimal color value to rgb hexadecimal
  Usage       : var hex = _dec_to_rgb('65535');   // returns FFFF00
  Arguments   : value   - dec value
\* ---------------------------------------------------------------------- */

function _dec_to_rgb(value) {
  var hex_string = "";
  for (var hexpair = 0; hexpair < 3; hexpair++) {
    var myByte = value & 0xFF;            // get low byte
    value >>= 8;                          // drop low byte
    var nybble2 = myByte & 0x0F;          // get low nybble (4 bits)
    var nybble1 = (myByte >> 4) & 0x0F;   // get high nybble
    hex_string += nybble1.toString(16);   // convert nybble to hex
    hex_string += nybble2.toString(16);   // convert nybble to hex
  }
  return hex_string.toUpperCase();
};



/* ---------------------------------------------------------------------- *\
  Function    : outputFontSelect()
  Description : creates the Font Select drop down and inserts it into 
	              the toolbar
  Usage       : outputFontSelect(n)
  Arguments   : n   - The editor identifier that the Font Select will update
	                    when making font changes (the textarea's ID)
\* ---------------------------------------------------------------------- */
function outputFontSelect(n) {

  var FontSelectObj        = _dnnToolbarList['selectfont'];
  var FontSelect           = FontSelectObj[2];
  var FontSelectOn         = FontSelectObj[3];
  
	_dnnFonts.sort();
	var FontSelectDropDown = new Array;
	FontSelectDropDown[n] = '<table border="0" cellpadding="0" cellspacing="0"><tr><td onMouseOver="document.getElementById(\'selectFont' + n + '\').src=\'' + FontSelectOn + '\';" onMouseOut="document.getElementById(\'selectFont' + n + '\').src=\'' + FontSelect + '\';"><img src="' + FontSelect + '" id="selectFont' + n + '" width="85" height="20" onClick="showFonts(\'' + n + '\');" unselectable="on"><br>';
	FontSelectDropDown[n] += '<span id="Fonts' + n + '" class="dropdown" style="width: 145px;">';

	for (var i = 0; i <= _dnnFonts.length;) {
	  if (_dnnFonts[i]) {
      FontSelectDropDown[n] += '<button type="button" onClick="formatText(\'FontName\',\'' + n + '\',\'' + _dnnFonts[i] + '\')\; hideFonts(\'' + n + '\');" onMouseOver="this.className=\'mouseOver\'" onMouseOut="this.className=\'mouseOut\'" class="mouseOut" style="width: 120px;"><table cellpadding="0" cellspacing="0" border="0"><tr><td align="left" style="font-family:' + _dnnFonts[i] + '; font-size: 12px;">' + _dnnFonts[i] + '</td></tr></table></button><br>';	
    }	  
	  i++;
  }
	FontSelectDropDown[n] += '</span></td></tr></table>';
	document.getElementById('FontSelect' + n).insertAdjacentHTML("afterBegin", FontSelectDropDown[n]);
};



/* ---------------------------------------------------------------------- *\
  Function    : outputFontSizes()
  Description : creates the Font Sizes drop down and inserts it into 
	              the toolbar
  Usage       : outputFontSelect(n)
  Arguments   : n   - The editor identifier that the Font Sizes will update
	                    when making font changes (the textarea's ID)
\* ---------------------------------------------------------------------- */
function outputFontSizes(n) {

  var FontSizeObj        = _dnnToolbarList['selectsize'];
  var FontSize           = FontSizeObj[2];
  var FontSizeOn         = FontSizeObj[3];

	_dnnFontSizes.sort();
	var FontSizesDropDown = new Array;
	FontSizesDropDown[n] = '<table border="0" cellpadding="0" cellspacing="0"><tr><td onMouseOver="document.getElementById(\'selectSize' + n + '\').src=\'' + FontSizeOn + '\';" onMouseOut="document.getElementById(\'selectSize' + n + '\').src=\'' + FontSize + '\';"><img src="' + FontSize + '" id="selectSize' + n + '" width="49" height="20" onClick="showFontSizes(\'' + n + '\');" unselectable="on"><br>';
  FontSizesDropDown[n] += '<span id="Sizes' + n + '" class="dropdown" style="width: 170px;">';

	for (var i = 0; i <= _dnnFontSizes.length;) {
	  if (_dnnFontSizes[i]) {
      FontSizesDropDown[n] += '<button type="button" onClick="formatText(\'FontSize\',\'' + n + '\',\'' + _dnnFontSizes[i] + '\')\;hideFontSizes(\'' + n + '\');" onMouseOver="this.className=\'mouseOver\'" onMouseOut="this.className=\'mouseOut\'" class="mouseOut" style="width: 145px;"><table cellpadding="0" cellspacing="0" border="0"><tr><td align="left" style="font-family: arial, verdana, helvetica;"><font size="' + _dnnFontSizes[i] + '">size ' + _dnnFontSizes[i] + '</font></td></tr></table></button><br>';	
    }	  
	  i++;
  }
	FontSizesDropDown[n] += '</span></td></tr></table>';
	document.getElementById('FontSizes' + n).insertAdjacentHTML("afterBegin", FontSizesDropDown[n]);
};



/* ---------------------------------------------------------------------- *\
  Function    : hideFonts()
  Description : Hides the list of font names in the font select drop down
  Usage       : hideFonts(n)
  Arguments   : n   - The editor identifier (the textarea's ID)
\* ---------------------------------------------------------------------- */
function hideFonts(n) {
  document.getElementById('Fonts' + n).style.display = 'none'; 
};



/* ---------------------------------------------------------------------- *\
  Function    : hideFontSizes()
  Description : Hides the list of font sizes in the font sizes drop down
  Usage       : hideFontSizes(n)
  Arguments   : n   - The editor identifier (the textarea's ID)
\* ---------------------------------------------------------------------- */
function hideFontSizes(n) {
  document.getElementById('Sizes' + n).style.display = 'none'; 
};



/* ---------------------------------------------------------------------- *\
  Function    : showFonts()
  Description : Shows the list of font names in the font select drop down
  Usage       : showFonts(n)
  Arguments   : n   - The editor identifier (the textarea's ID)
\* ---------------------------------------------------------------------- */
function showFonts(n) { 
  if (document.getElementById('Fonts' + n).style.display == 'block') {
    document.getElementById('Fonts' + n).style.display = 'none';
	}
  else {
    document.getElementById('Fonts' + n).style.display = 'block'; 
    document.getElementById('Fonts' + n).style.position = 'absolute';		
  }
};



/* ---------------------------------------------------------------------- *\
  Function    : showFontSizes()
  Description : Shows the list of font sizes in the font sizes drop down
  Usage       : showFonts(n)
  Arguments   : n   - The editor identifier (the textarea's ID)
\* ---------------------------------------------------------------------- */
function showFontSizes(n) { 
  if (document.getElementById('Sizes' + n).style.display == 'block') {
    document.getElementById('Sizes' + n).style.display = 'none';
	}
  else {
    document.getElementById('Sizes' + n).style.display = 'block'; 
    document.getElementById('Sizes' + n).style.position = 'absolute';		
  }
};



/* ---------------------------------------------------------------------- *\
  Function    : viewSource()
  Description : Shows the HTML source code generated by the WYSIWYG editor
  Usage       : showFonts(n)
  Arguments   : n   - The editor identifier (the textarea's ID)
\* ---------------------------------------------------------------------- */
function viewSource(n) {
  var getDocument = document.getElementById("wysiwyg" + n).contentWindow.document;
  var browserName = navigator.appName;
	
	// View Source for IE 	 
  if (browserName == "Microsoft Internet Explorer") {
    var iHTML = getDocument.body.innerHTML;
    getDocument.body.innerText = iHTML;
	}
 
  // View Source for Mozilla/Netscape
  else {
    var html = document.createTextNode(getDocument.body.innerHTML);
    getDocument.body.innerHTML = "";
    getDocument.body.appendChild(html);
	}
  
	// Hide the HTML Mode button and show the Text Mode button
  document.getElementById('HTMLMode' + n).style.display = 'none'; 
	document.getElementById('textMode' + n).style.display = 'block';
	
	// set the font values for displaying HTML source
	getDocument.body.style.fontSize = "12px";
	getDocument.body.style.fontFamily = "Courier New"; 
	
  _dnnViewTextMode = 1;
};



/* ---------------------------------------------------------------------- *\
  Function    : viewSource()
  Description : Shows the HTML source code generated by the WYSIWYG editor
  Usage       : showFonts(n)
  Arguments   : n   - The editor identifier (the textarea's ID)
\* ---------------------------------------------------------------------- */
function viewText(n) { 
  var getDocument = document.getElementById("wysiwyg" + n).contentWindow.document;
  var browserName = navigator.appName;
	
	// View Text for IE 	  	 
  if (browserName == "Microsoft Internet Explorer") {
    var iText = getDocument.body.innerText;
    getDocument.body.innerHTML = iText;
	}
  
	// View Text for Mozilla/Netscape
  else {
    var html = getDocument.body.ownerDocument.createRange();
    html.selectNodeContents(getDocument.body);
    getDocument.body.innerHTML = html.toString();
	}
  
	// Hide the Text Mode button and show the HTML Mode button
  document.getElementById('textMode' + n).style.display = 'none'; 
	document.getElementById('HTMLMode' + n).style.display = 'block';
	
	// reset the font values
  getDocument.body.style.fontSize = "";
	getDocument.body.style.fontFamily = ""; 
	_dnnViewTextMode = 0;
};



/* ---------------------------------------------------------------------- *\
  Function    : updateTextArea()
  Description : Updates the text area value with the HTML source of the WYSIWYG
  Usage       : updateTextArea(n)
  Arguments   : n   - The editor identifier (the textarea's ID)
\* ---------------------------------------------------------------------- */
function updateTextArea(n) {
	document.getElementById(n).value = document.getElementById("wysiwyg" + n).contentWindow.document.body.innerHTML;
};