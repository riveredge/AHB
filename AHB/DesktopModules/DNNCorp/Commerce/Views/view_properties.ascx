<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="view_properties.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.view_properties" %>
<div class="dnnCart">
    <div class="dnnCart-top roundTop">
        <div class="tracker clearfix">
            <%= ProgressTracker%>
        </div>
        <div class="dnnCart-header clearfix">
            <div>[RESX:MoreInformation]</div>
            <span>[RESX:MoreInformation:Hint]</span>
        </div>
    </div>
    <div class="dnnCart-content">   
        <div>
        <%=sOutput %>
        </div>
        <div class="dnnCart-buttonarea">
            <button id="approp_Save" onclick="ap_proccessForm(this); return false;" class="dnnCart-positive ap-ui-checkout ap-ui-roundall"><i></i>[RESX:Button:SaveProperties]</button>
        </div>
        <div class="clearDiv"></div>
    </div>
    
    <div class="dnnCart-bottom roundBottom"></div>

</div>
<script type="text/javascript">
    if (typeof(formdefs) == 'undefined'){
        var formdefs = {};
    };
    <%=sScripts %>
</script>
<div class="dnnCart-modal" id="ap-wait" style="width:400px;height:200px;">
    <div>
        <div class="dnnCart-loader">[RESX:PleaseWait]</div>
    </div>
</div>