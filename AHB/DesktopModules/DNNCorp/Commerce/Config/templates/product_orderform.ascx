<table>
  [PRODUCTGROUP]
	<tr>
		<td colspan="4"></td>
	</tr>
	<tr>
		<td class="aptblhdr" colspan="4">[PRODUCTINFO:GROUPNAME]</td>
	</tr>
	<tr>
		<td>[RESX:ProductName]</td>
		<td>[RESX:Price]</td>
		<td>[RESX:Qty]</td>
		<td></td>
	</tr>
	[PRODUCT]
	<tr>
		<td style="width:100%">[PRODUCTINFO:PRODUCTNAME]</td>
		<td>[PRODUCTINFO:PRICE]</td>
		<td>
			<input type="text" name="[PRODVAR:qtySKU]" id="[PRODVAR:qtySKU]" onkeypress="return dnn_comm.utils.OnlyNumbers(event)" style="width:20px;" value="1" class="amqtytxt"></td>
			  
		<td>[PRODUCTINFO:BUYNOW]</td>
	</tr>          
	<tr>
		<td>[PRODUCTINFO:DESCRIPTION]</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	[/PRODUCT]
	[/PRODUCTGROUP]
</table>