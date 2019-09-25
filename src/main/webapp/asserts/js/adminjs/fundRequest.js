console.log("test");
$(function(){
	console.log("test jquery!");
	$('#expireDate').datepicker({
		minDate: new Date(),
		maxDate: '+1Y',
		dateFormat: 'yy-mm-dd'
	});
})
function fundRequest()
        {
			event.preventDefault();
        	var data = localStorage.getItem('Logged_In_Admin');
			var adminData = JSON.parse(data);
			var id = JSON.stringify(adminData.id);
            
        	var donorId = id;
            var requestType = $('#requestType').val(); 
            var description = $('#description').val();
            var amount = $('#amount').val();
            var date = $('#expireDate').val();
            console.log("ID=>"+donorId);
            console.log("requestType=>"+requestType);
            console.log("description=>"+description);
            console.log("amount=>"+amount);
            console.log("date=>"+date);
            var formData = "id="+donorId+"&requestType="+requestType+"&description="+description+"&amount="+amount+"&date="+date;
            var url = "http://localhost:8080/Charityapp-api/FundRequestServlet?"+formData;
            $.get(url,function(data){
                console.log(data)
                console.log('fund request success!');
                $('#fundStatus').css({"display":"block"});
            });
        }
        $(function(){
			console.log("this is fundrequest!");
        })