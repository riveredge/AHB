 <div id="{id}" style="display:none;" class="modalForm">
    <div class="dnn-modcp-modal-inner" style="height:{height};">
        <div class="dnnForm">
            <div id="dnn-modcp-feedback" class="dnn-modcp-notify">
                <div><i></i><span></span></div>
            </div>
            <div class="dnnFormItem">
                <label>
                    <a href="#" class="dnnFormHelp"></a>
                [RESX:Product]:
                </label>
                <select id="ProductId" onchange="getProduct();"><option value="-1"></option></select>
            </div>
            <div class="dnnFormItem">
            <label><a href="#" class="dnnFormHelp"></a>[RESX:Price]:</label>
            <input type="text" id="Price" value="0.00" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" />
            </div>
            <div class="dnnFormItem">
            <label><a href="#" class="dnnFormHelp"></a>[RESX:Qty]:</label>
            <input type="text" id="Qty" value="1" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" />
            </div>
            <div class="dnnFormItem">
            <label><a href="#" class="dnnFormHelp"></a>[RESX:Misc]:</label>
            <input type="text" id="Misc" value="0.00" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" />
            </div>
            <div class="dnnFormItem">
            <label><a href="#" class="dnnFormHelp"></a>[RESX:SubTotal]:</label>
            <input type="text" id="SubTotal" value="0.00" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" />
            </div>
            <div class="dnnFormItem">
            <label><a href="#" class="dnnFormHelp"></a>[RESX:Note]:</label>
            <textarea id="Note" style="width:225px;font-size:10px"></textarea>
            </div>
            <input type="hidden" id="OrderDetailsId" value="-1" />
            <input type="hidden" id="OrderId" value="-1" />
            
            <ul class="dnnActions dnnClear">
                <li><a href="#" onclick="saveOrderDetails(); return false;" class="dnnPrimaryAction">[RESX:Save]</a></li>
                <li><a href="#" onclick="dnn_comm.admin.DialogClose('{id}'); return false;" class="dnnSecondaryAction">[RESX:Cancel]</a></li>
            </ul>
   
        </div>
    </div>
</div>
<script type="text/javascript">
    var products = [];
    function loadProducts() {
        document.getElementById('Price').value = '0.00';
        document.getElementById('Qty').value = '1';
        document.getElementById('Misc').value = '0.00';
        document.getElementById('SubTotal').value = '0.00';
        document.getElementById('Note').value = '';
        var tmp = {};
        tmp.action = 14;
        tmp.showDeleted = false;
        ap_callback(JSON.stringify(tmp),bindProducts);
    };
    function bindProducts(results) {
        for (var i = 0; i < results.length; i++) {
            var row = results[i];
            dnn_comm.utils.addOption('ProductId', row.ProductName, row.ProductId);
        };
    };
    loadProducts();
</script>