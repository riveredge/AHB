<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<meta name="viewport" content="width=320" />
<div class="controlpanel" id="ControlPanel" runat="server" codetype="dotnetnuke/server" codebase="CONTENTPANE"/>

<div class="pagemaster">
    <div class="header">
         <div class="headerMenu"><img src="/portals/_default/skins/recipe/images/menucorner.png" class="menucorner" style="display:none" alt="menucorner" /><dnn:NAV runat="server" id="dnnNAV"  ProviderName="DNNMenuNavigationProvider" IndicateChildren="false" ControlOrientation="Horizontal" CSSControl="mainMenu" /></div>
        <dnn:LOGO runat="server" id="dnnLOGO" />
    </div>
    
       <div class="box">
    <div class="userbar"><dnn:USER runat="server" id="dnnUSER" /> <dnn:LOGIN runat="server" id="dnnLOGIN" /></div>
        <div class="content">
           	<TABLE cellspacing="3" cellpadding="3" width="100%" border="0" class="maintable">
			<TR>
				<TD class="toppane" colspan="3" valign="top" align="center" runat="server" id="TopPane"></TD>
			</TR>
			<TR valign="top">
				<TD valign="top" align="center" runat="server" id="LeftPane"></TD>
				<TD valign="top" align="center" runat="server" id="ContentPane"></TD>
				<TD valign="top" align="center" runat="server" id="RightPane"></TD>
			</TR>
			<TR>
				<TD class="bottompane" colspan="3" valign="top" align="center" runat="server" id="BottomPane"></TD>
			</TR>
		</TABLE>
        </div>
         <img src="/portals/_default/skins/recipe/images/botl.png" alt="corner" class="cornerleft" style="display:none" />
         <div class="whitebottom" style="display:none">&nbsp;</div>
    </div>
    
    
    <div class="bottom">
    <div class="searchbar"><dnn:SEARCH runat="server" id="dnnSEARCH" /></div>
  
    </div>
</div>

<dnn:STYLES runat="server" id="StylesIE6"  Name="IE6" StyleSheet="css/ie6screen.css" Condition="IE 6" UseSkinPath="true" />
    
<dnn:STYLES runat="server" id="StylesIE7"  Name="IE7Plus" StyleSheet="css/ie7screen.css" Condition="gte IE 7" UseSkinPath="true" />
