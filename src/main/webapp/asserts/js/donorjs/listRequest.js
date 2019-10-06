/* Get user name */
	  	$(function(){
	  		 var data = localStorage.getItem('Logged_In_Donor');
	  	 	var donorData = JSON.parse(data);
	 			$('#dropdownId').html(donorData.name);
	  	  	});
	  	

	  	
	  	function donate(fundRequestId){
	  		/* Get donor details */
			var data = localStorage.getItem('Logged_In_Donor');
	  		 var donorData = JSON.parse(data);
	  		 var donorId = donorData.id;
			/* Get amount */
	  		var amount = $("#amount_" + fundRequestId).val();
	  		 
	  	  	console.log("fund_req_id=>"+fundRequestId);
	  	  	console.log("donor_id=>"+donorId);
	  		console.log("amount=>"+amount);
	
	  		var formData = "id="+donorId+"&fundRequestId="+fundRequestId+"&amount="+amount;
	  		var url = "http://localhost:8080/Charityapp-api/TransactionServlet?"+formData;



			/* Get response form servlet */
	  		if(amount > 0 && amount != null)
	  			{
			  		$.get(url,function(data){
						console.log('Donate success!');
						 $(function(){
						    	$('#transactionStatus').css({"display":"block"});
						    	$('#errorStatus').css({"display":"none"});
						    	$('#responseMessage').html("Transaction success");
						        });
			  		});
	  		
	  			} 
	  		else{
	  			$('#errorStatus').css({"display":"block"});
	  			$('#transactionStatus').css({"display":"none"});
	  				$('#errorMessage').html("Invalid amount!");
	  				console.log("Invalid amount!");
	  			}
	  	}
	  	
	  	function listRequest()
	    {
  
	        var requestType = $("#requestType").val();
	        var formData = "requestType="+requestType;
	        var url = "http://localhost:8080/Charityapp-api/ListFundRequestServlet?"+formData;
	        
	        $.getJSON(url,function(datas){
	
	        	//$('#listRequest').css({'display':'block'});
	        	var requestData = datas;
	        	 //var requestData = JSON.parse(datas);
		            var tbody = $('#requestTable');
		            var content = "";
		            for(data of requestData)
		            {
		            	
		            	
		            	
		            	content += '<tr><td>';
		                content += data.requestType;
		                content += '</td><td>';
		                content += data.description;
		                content += '</td><td>';
		                content += data.amount;
		                content += '</td><td>';
		                content += data.expireDate.day+"-"+ data.expireDate.month+"-"+data.expireDate.year;
		                content += '</td><td>';
		                content += '<input type="number" id="amount_'+ data.id +'" class="form-control" min="1" placeholder="Enter amount"/>';
		                
		                content += '</td><td>';
		                var click = "donate('"+ data.id +"')";
		                var desc = "showDescription('"+ data.description +"')";
		                content += '<button class="btn btn-outline-success" onclick=' + click + '>Donate</button>';
		                content += '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong" onclick="'+desc+'">More Details</button>';
		                content += '</td></tr>';
		            }
		            console.log("content=>"+content);
		            tbody.html(content);
	        });
	       
	        
	    }
	  	 function showDescription(data)
	        {
	  		// alert(data);
	        	console.log("Inside description!", data);
	        	$('#description').html(data);
	        }