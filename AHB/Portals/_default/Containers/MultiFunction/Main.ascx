<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<div class="ContainerWrapper">
    <div class="clearfix">
        <div class="ContainerHeader clearfix">
            <div class="Left"><dnn:TITLE ID="dnnTITLE" runat="server" class="Head Left" /></div>
        </div>
        <div class="ContainerPane" runat="server" id="ContentPane"></div>
    </div>
</div>


