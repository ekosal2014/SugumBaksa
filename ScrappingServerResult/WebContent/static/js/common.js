var method = {
	dateFormatter : function(dt,num){
		var yy,mm,dd;
		yy = dt.substr(0,4);
		mm = dt.substr(4,2);
		dd = dt.substr(6,2);
		console.log(yy+"-"+mm+"-"+dd);
	}
}