<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="SearchResults.ascx.cs" Inherits="DotNetNuke.Professional.SearchCrawler.SearchResults.SearchResults" %>
<div id="dnnSearchCrawlerResults">
    <div class="scrHeader"><asp:Label ID="lblHeaderSummary" runat="server"/></div>
    <asp:Label ID="lblErrorMessage" runat="server" CssClass="NormalRed" Visible="false"/>
    <asp:Label ID="lblMessage" runat="server" CssClass="Normal" Visible="false"/>
    <asp:Repeater id="rptResults" runat="server" DataSource="<%# this.Results %>">
        <HeaderTemplate><ol class="scrResults"></HeaderTemplate>
        <ItemTemplate>
            <li class="scrItem">
                <h3 class="scrTitle"><a href='<%# Eval("path") %>' target='<%# Eval("target") %>'><%# Eval("title")  %></a></h3>
                <asp:Panel ID="pnThumbnail" runat="server" CssClass="scrThumbnail scrExcerpt" Visible='<%# !string.IsNullOrEmpty(Eval("thumbnail").ToString()) %>'>
                    <asp:Image ID="imgThumb" runat="server" ImageUrl='<%# Eval("thumbnail") %>' />
                </asp:Panel>
                <p class="scrExcerpt scrSample"><%# Eval("sample") %></p>
                <span class="scrPath"><%# Eval("path").ToString().Length <= 70 ? Eval("path").ToString().Replace("&", "&amp;") : Eval("path").ToString().Substring(0, 69).Replace("&", "&amp;") + "..."%></span>
                <div class="scrRelevance"><%# Eval("relevance") %></div>
            </li>
        </ItemTemplate>
        <FooterTemplate></ol></FooterTemplate>
    </asp:Repeater>
    <div class="scrPaging">
        <asp:Label ID="lblResultsNavigation" runat="server" ResourceKey="lblResultsNavigation" />
        <asp:Repeater ID="rptResultsNavigation" runat="server" DataSource="<%# Paging %>">
            <HeaderTemplate><ol></HeaderTemplate>
            <ItemTemplate>
                <li><%# Eval("html") %></li>
            </ItemTemplate>
            <FooterTemplate></ol></FooterTemplate>
        </asp:Repeater>
    </div>
</div>