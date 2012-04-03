<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TwoColumn.ascx.cs" Inherits="Com.Christoc.MultiFunction.TwoColumn" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.Skins" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<div id="BodyWrapper" class="TwoColumn">
    <div class="cp">
        <div id="ControlPanel" runat="server" />
    </div>
    <div id="Header" class="clearfix">
        <div class="cp">
            <div id="Logo">
                <dnn:LOGO id="dnnLOGO" runat="server" />
            </div>
            <div class="MenuWrapper">
                <dnn:NAV ID="dnnNAV" runat="server" ProviderName="DNNMenuNavigationProvider" CSSControl="MenuClass"
                    CSSNodeRoot="MenuRootItem" CSSContainerSub="SubMenuContainer" CSSNode="SubMenuItem" IndicateChildren="False">
                    <customattributes>
                <dnn:CustomAttribute value="UnorderedList" name="RenderMode" />
             </customattributes>
                </dnn:NAV>
            </div>
        </div>
    </div>
   <div id="GraphicHeader" class="clearfix">
        <div class="page_header">
            <div class="cp">
                <img id="imgHeaderGraphic" src="~/images/spacer.gif" alt="<%# PortalSettings.PortalName %>" class="HeaderGraphic" runat="server" />
                <div class="UserLogin">
                    <dnn:user runat="server" id="dnnUSER" />
                    <dnn:login runat="server" id="dnnLOGIN" />
                </div>
            </div>
        </div>
    </div>
    <div id="ContentWrapper">
        <div class="cp">
            <div id="DnnPanes">
                <div id="TopPane" runat="server" class="TopPane" />
                <div id="MainSection" class="MainSection clearfix">
                    <div id="LeftPane" runat="server" class="LeftPane" />
                    <div id="ContentPane" runat="server" class="ContentPane" />
                </div>
                <div id="BottomPane" runat="server" class="BottomPane" />
            </div>
        </div>
    </div>
    <div id="ContentFooter">
        <div class="cp">
            &nbsp;
        </div>
    </div>
    <div class="PageFooter clearfix">
        <div class="FooterWrapper">
            <div class="cp">
                <div id="FooterLeftPane" class="FooterLeftPane" runat="server" />
                <div id="FooterMidPane" class="FooterMidPane" runat="server" />
                <div id="FooterRightPane" class="FooterRightPane" runat="server" />

                <div id="FooterCopyright" class="FooterCopyright clearfix" runat="server">
                    <dnn:copyright id="dnnCOPYRIGHT" runat="server" />
                </div>
                <div class="SkinLink">
                    Design by <a href="http://multifunction.codeplex.com">MultiFunction Free DotNetNuke Skin</a>
                </div>

            </div>
            <div class="FooterPicture" />
        </div>
    </div>
</div>

