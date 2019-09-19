/* Get user name */
	  	$(function(){
	  		 var data = localStorage.getItem('Logged_In_Donor');
	  	 	var donorData = JSON.parse(data);
	 			$('#dropdownId').html(donorData.name);
	  	  	});
  	  	/* User logout */
	  	function logout()
	  	{
	  	  	console.log('logout success!');
	  	  	localStorage.clear();
	  	  	window.location.replace('donorLogin.jsp');
	  	}
	  	
	  	function donate(fundRequestId){
	  		/* Get donor details */
			var data = localStorage.getItem('Logged_In_Donor');
	  		 var donorData = JSON.parse(data);
	  		 var donorId = donorData.id;
			/* Get amount */
	  		var amount = $("#amount").val();
	  		 
	  	  	console.log("fund_req_id=>"+fundRequestId);
	  	  	console.log("donor_id=>"+donorId);
	  		console.log("amount=>"+amount);
	
	  		var formData = "id="+donorId+"&fundRequestId="+fundRequestId+"&amount="+amount;
	  		var url = "http://localhost:8080/CharityApplication/TransactionServlet?"+formData;
			/* Get response form servlet */
	  		$.get(url,function(data){
				console.log('transaction success!');
				 $(function(){
				    	$('#transactionStatus').css({"display":"block"});
				        });
	  		});
	  		
	  	}
	  	
	  	function listRequest()
	    {
	
			
	    	   
	        var requestType = $("#requestType").val();
	        var formData = "requestType="+requestType;
	        var url = "http://localhost:8080/CharityApplication/ListFundRequestServlet?"+formData;
	        $.get(url,function(datas){
	
	        	
	        
	            var requestData = JSON.parse(datas);
	            var tbody = $('#requestTable');
	            var content = "";
	            for(data of requestData)
	            {
	            	content += '<tr><td>';
	                content += data.requestType;
	                content += '</td><td>';
	                content += data.description;
	                content += '</td><td>';
	                content += data.amount
	                content += '</td><td>';
	                content += data.expireDate.day+"-"+ data.expireDate.month+"-"+data.expireDate.year;
	                content += '</td><td>';
	                content += '<input type="number" id="amount" class="form-control" placeholder="PayAmount"/>';
	                content += '</td><td>';
	                var click = "donate('"+ data.id + "')";
	                content += '<button class="btn btn-outline-success" onclick=' + click + '>Donate</button>';
	                content += '</td></tr>';
	            }
	            console.log("content=>"+content);
	            tbody.html(content);
	        });
	    }