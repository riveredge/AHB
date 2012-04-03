<div class="am-ui-modal-std am-ui-roundall" id="{id}" style="width:450px;height:377px;">
    <div class="am-ui-modal-inner" style="height:375px;">
        <div class="am-ui-modal-hd">
            <div class="am-ui-modal-hd-close" onclick="am.UI.CloseDiv('{id}');"></div>
            <div class="am-ui-modal-hd-text">[RESX:PaymentEditor]</div>
        </div>
        <div class="am-ui-form">
            <div id="am-ui-feedback" class="am-ui-notify">
                <div><i></i><span></span></div>
            </div>
            <ul class="am-ui-form-list am-ui-clear am-ui-form-propeditor" id="ampropform">
             
                <li><label>[RESX:Price]:</label><input type="text" id="Price" value="0.00" /></li>
                <li><label>[RESX:Qty]:</label><input type="text" id="Qty" value="1" /></li>
                <li><label>[RESX:Misc]:</label><input type="text" id="Misc" value="0.00" /></li>
                <li><label>[RESX:SubTotal]:</label><input type="text" id="SubTotal" value="0.00" /></li>
                <li><label>[RESX:Note]:</label><textarea id="Note" style="width:225px;font-size:10px"></textarea></li>
            </ul>
           

   
        </div>
        <div class="am-ui-modal-buttonarea">
            <button id="btnCancel" type="button" onclick="am.UI.CloseDiv('{id}'); return false;" class="am-ui-roundall am-ui-negative"><i></i>[RESX:Cancel]</button>
            <button id="btnSave" type="button" onclick="ap_saveOrderDetails(); return false;" class="am-ui-roundall am-ui-positive"><i></i>[RESX:Save]</button>
        </div>
    </div>
</div>