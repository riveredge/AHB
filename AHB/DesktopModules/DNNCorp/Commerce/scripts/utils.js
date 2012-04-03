function formatCurrency(num,curr,showSymbol) {
	if (curr == ''){
		curr = 'usd';
	};
	var symbPrefix = '$';
	var symbSuffix = '';
	var dec = '.';
	var group = ',';
	if (curr == 'eur'){
		symbPrefix = '';
		symbSuffix = ' €';
		dec = ',';
		group = '.';
	
	};
	if (showSymbol == false){
		symbPrefix = '';
		symbSuffix = '';
	};
	num = num.toString().replace(/\$|\,/g,'');
	if (isNaN(num)) {
		num = '0';
	};
	sign = (num == (num = Math.abs(num)));
	num = Math.floor(num*100+0.50000000001);
	cents = num%100;
	num = Math.floor(num/100).toString();
	if (cents < 10) {
		cents = '0' + cents;
	};
	for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++) {
		num = num.substring(0, num.length - (4 * i + 3)) + group + num.substring(num.length - (4 * i + 3));
	};
	return (((sign)?'':'-') + symbPrefix + num + dec + cents + symbSuffix);
};
function onlyNumbers(evt){
	var charCode = (evt.which != undefined) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57) && (charCode != 46) && (charCode != 44))
		return false;
  return true;
};
String.prototype.trim = function () {
	return this.replace(/^\s+|\s+$/g, "");
};
String.prototype.ltrim = function () {
	return this.replace(/^\s+/, "");
};
String.prototype.rtrim = function () {
	return this.replace(/\s+$/, "");
};
String.prototype.cleanNumber = function () {
	var number = this.trim();
	if ((number.length - number.lastIndexOf(',')) == 3) {
		number = number.replace(/\./g, '#');
		number = number.replace(/,/g, '.');
		number = number.replace(/#/g, ',');
		number = number.replace(/,/g, '');

	} else {
		number = number.replace(/,/g, '');
	};
	return parseFloat(number);
};
