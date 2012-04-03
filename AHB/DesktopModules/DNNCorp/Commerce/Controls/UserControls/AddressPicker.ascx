<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressPicker.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.Controls.AddressPicker" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div id="<%=ControlKey %>" style="display:none;" class="modalForm">
    <div class="dnn-modcp-modal-inner" style="height:<%=Height%>;">
        <div class="dnn-modcp-tabstrip">
        <ul id="<%=ControlKey %>Tabs">
                <li id="<%=ControlKey %>Tab1">[RESX:Addresses]</li>
                <li id="<%=ControlKey %>Tab2">[RESX:NewAddress]</li>
            </ul>
        </div>
        <div class="dnn-modcp-form">
            <div id="dnn-modcp-feedback" class="dnn-modcp-notify">
                <div><i></i><span></span></div>
            </div>
            
            <div id="<%=ControlKey %>Tab1-content" class="dnn-modcp-tab-content">
                <div style="height:275px;overflow:auto;">
                <ul id="custaddresses" class="dnn-modcp-datalist" style="padding-left:0px;">
                    <li id="lirow" style="display:none;">
                        <div>{Name}</div>
                        <div>{Address1}</div>
                        <div>{City}, {Region} {PostalCode} </div>
                        <div>{Country}</div>
                    </li>
                </ul>
                </div>
            </div>
            <div id="<%=ControlKey %>Tab2-content" class="dnn-modcp-tab-content dnnForm">
                <div class="dnnFormItem">
                    <dnn:Label ControlName="AddressName" ResourceKey="[RESX:Name]"  runat="server" />
                    <input type="text" id="AddressName" class="dnnFormRequired" value="" />
                </div>
                <div class="dnnFormItem">
                    <dnn:Label ControlName="AddressStreet" ResourceKey="[RESX:Street]"  runat="server" />
                    <input type="text" id="AddressStreet" value="" class="dnnFormRequired" />
                </div>
                <div class="dnnFormItem">
                    <dnn:Label ControlName="AddressCity" ResourceKey="[RESX:City]"  runat="server" />
                    <input type="text" id="AddressCity" value="" class="dnnFormRequired" />
                </div>
                <div class="dnnFormItem">
                    <dnn:Label ControlName="AddressState" ResourceKey="[RESX:State]"  runat="server" />
                    <input type="text" id="AddressState" value="" class="dnnFormRequired" />
                </div>
                <div class="dnnFormItem">
                    <dnn:Label ControlName="AddressPostalCode" ResourceKey="[RESX:PostalCode]"  runat="server" />
                    <input type="text" id="AddressPostalCode" value="" class="dnnFormRequired" />
                </div>
                <div class="dnnFormItem">
                    <dnn:Label ControlName="AddressCountry" ResourceKey="[RESX:Country]"  runat="server" />
                    <input type="text" id="AddressCountry" value="" class="dnnFormRequired" />
                </div>
               
                <ul class="dnnActions dnnClear">
                    <li><a href="#" onclick="saveAddress(); return false;" class="dnnPrimaryAction">[RESX:Save]</a></li>
                    <li><a href="#" onclick="dnn_comm.admin.DialogClose('<%=ControlKey %>'); return false;" class="dnnSecondaryAction">[RESX:Cancel]</a></li>
                </ul>
                

            </div>
            
        </div>
       
    </div>
</div>
<input type="hidden" value="" id="addrtarget" />
<script type="text/javascript">
    function <%=ControlKey %>_InitView() {
        dnn_comm.admin.TabsInit('<%=ControlKey %>Tabs');
        var wrap = document.getElementById('<%=ControlKey %>Tab2-content');
        var els = wrap.getElementsByTagName('input');
        var len = els.length;
        for (var i=0; i < len; i++) {
            var elm = els[i];
            elm.value = '';
        }
        
    };
    <%=ControlKey %>_InitView();
    function saveAddress() {
        var addr = {};
       
        var isValid = true;
        addr.AddressType = document.getElementById('addrtarget').value;
        addr.AddressId = 'addr--1' + addr.AddressType;
        addr.Name = document.getElementById('AddressName').value;
        if(dnn_comm.utils.Trim(addr.Name) == '') {
            isValid = false;
            document.getElementById('AddressName').style.backgroundColor = '#fbc2c4';
        }
        addr.Address1 = document.getElementById('AddressStreet').value;
        if (dnn_comm.utils.Trim(addr.Address1) == '') {
            document.getElementById('AddressStreet').style.backgroundColor = '#fbc2c4';
            isValid = false;
        }
        addr.City = document.getElementById('AddressCity').value;
        if (dnn_comm.utils.Trim(addr.City) == '') {
            document.getElementById('AddressCity').style.backgroundColor = '#fbc2c4';
            isValid = false;
        }
        addr.Region = document.getElementById('AddressState').value;
        if (dnn_comm.utils.Trim(addr.Region) == '') {
            document.getElementById('AddressState').style.backgroundColor = '#fbc2c4';
            isValid = false;
        }
        addr.Country = document.getElementById('AddressCountry').value;
        if (dnn_comm.utils.Trim(addr.Country) == '') {
            document.getElementById('AddressCountry').style.backgroundColor = '#fbc2c4';
            isValid = false;
        }
        addr.PostalCode = document.getElementById('AddressPostalCode').value;
        if (dnn_comm.utils.Trim(addr.PostalCode) == '') {
            document.getElementById('AddressPostalCode').style.backgroundColor = '#fbc2c4';
            isValid = false;
        }
        if (isValid) {
            dnn_comm.admin.TabsInit('<%=ControlKey %>Tabs');
            var temp = document.getElementById('lirow');
            var tr = temp.cloneNode(true);
            tr = dnn_comm.utils.Bind(addr, tr);
            tr.style.display = '';
            tr.style.visibility = 'visible';
            tr.id = '';
            curraddr.push(addr);
            setAddress(tr, addr.AddressType, addr);
        }

    };
</script>