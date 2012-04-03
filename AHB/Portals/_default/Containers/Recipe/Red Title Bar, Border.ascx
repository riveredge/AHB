<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ICON" Src="~/Admin/Containers/Icon.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" Src="~/Admin/Containers/Visibility.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>
<div class="redborder">
    <p><dnn:ACTIONS runat="server" id="dnnACTIONS" /><dnn:ICON runat="server" id="dnnICON" /><dnn:TITLE runat="server" id="dnnTITLE" /><dnn:VISIBILITY runat="server" id="dnnVISIBILITY" /><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON5" CommandName="ModuleHelp.Action" DisplayIcon="True" DisplayLink="False" /></p>
    <div class="whiteredborder">
        <div id="ContentPane" runat="server" align="center"></div>
        <p><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON1" CommandName="AddContent.Action" DisplayIcon="True" DisplayLink="True" />&nbsp;<dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON2" CommandName="SyndicateModule.Action" DisplayIcon="True" DisplayLink="False" />&nbsp;<dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON3" CommandName="PrintModule.Action" DisplayIcon="True" DisplayLink="False" />&nbsp;<dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON4" CommandName="ModuleSettings.Action" DisplayIcon="True" DisplayLink="False" /></p>
        </div>
</div>

<!--[if gte IE 7]>
<style type="text/css">
    .redborder
    {
    	background:#fe9393 url(./images/redcorner.png) no-repeat bottom right;
    }
    
    .whiteredborder
    {
    	background:#fff url(./images/whiteredcorner.png) no-repeat bottom right;
    }
</style>
<![endif]-->
