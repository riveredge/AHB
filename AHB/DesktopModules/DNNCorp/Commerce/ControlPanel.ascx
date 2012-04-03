<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlPanel.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.ControlPanel" %>
<%@ Register  assembly="DotNetNuke.Professional.Commerce" namespace="DotNetNuke.Professional.Commerce.Controls" tagPrefix="dnncomm" %>
<script type="text/javascript">
     if (typeof(am) == 'undefined'){
        am = {};
     };
     am.currency = '<%=Settings.Currency.ToLower() %>';
     var dateFormat = '<%=dateFormat %>';
    function LoadView(param,opt){
        $('.dnn-modcp-actionarea').empty();
        $('#propview').remove();
        $('#CustPicker').remove();
        $('#orderitem').remove();
        $('#AddressPicker').remove();
        $('#restEditor').remove();
        var li = document.getElementById(param);
        try {
        dnn_comm.admin.ToggleNav(li);
        } catch(err) {
        };
        
        if (typeof(opt) == 'undefined'){
            opt = '';
        }
        dnn_comm.history.Add('cpview=' + param + '&params=' + opt,'Commerce - ' + param);
        $('.dnn-modcp-callback').fadeOut('fast', function () {
        <%=cbShell.ClientID%>.Callback(param,opt);
        });
         

    };
    function actionLoadComplete(){

     $('.dnn-modcp-callback').fadeIn('fast', function(){
  
                if ($('#controlActions').length > 0) {
                    $('#controlActions').appendTo('.dnn-modcp-actionarea').css('display','block');
                } else {
                    $('.dnn-modcp-actionarea').empty();
                };
            });
    };
    function shellInit(){
        if (window.location.toString().indexOf('#') >= 0) {
            
            var sHash = window.location.hash.substring(1) + '&';
            var params = sHash.split('&');
            var view = params[0].split("=")[1];
            var param = params[1];
            if (param.indexOf('!') >= 0) {
                param = param.replace('params=', '');
            } else {
                param = param.split("=")[1];
            };
            LoadView(view, param);
        };
    };
</script>

<div class="dnn-modcp-shell">
       <div class="dnn-modcp-menu">
        <%= MenuItems%>
        <div class="clearfix"></div>
    </div>
    <div class="dnn-modcp-content">
        <div id="dnn-modcp-msgarea">
            <div></div>
        </div>
        <div class="dnn-modcp-vshim"></div>
        
        <dnncomm:CallBack id="cbShell" class="dnn-modcp-callback" runat="server" Debug="False" OnCallbackComplete="actionLoadComplete" OnCallback="cbShell_Callback" >
            <Content>
                
                <asp:PlaceHolder id="plhControlPanel" runat="server" /> 
                  
            </Content>
        </dnncomm:CallBack>
        <div class="clearfix"></div>
        <div class="dnn-modcp-actionarea"></div>
        
    </div>
 


       
        
    
    <div class="dnn-modcp-footer">
        <span><asp:Label ID="lblProd" runat="server" /> <asp:label ID="lblCopy" runat="server" /></span>
        <div class="clearfix"></div>
    </div>
  
      
    

</div>
<input type="hidden" value="" id="dnncpview" name="dnncpview" />
<script type="text/javascript">
    

       dnn_comm.history.Init();
        shellInit();
    
    
</script>