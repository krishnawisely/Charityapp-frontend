/* Get user name */
	  	$(function(){
	  		 var data = localStorage.getItem('Logged_In_Donor');
	  	 	var donorData = JSON.parse(data);
	 			$('#dropdownId').html(donorData.name);
	  	  	});
	  	
	  	function donateMoney()
	  	{
	  		event.preventDefault();
	  		var fundid = $('#fundid').val();
	  		var amount = $('#fundamount').val();
	  		/* Get donor details */
			var data = localStorage.getItem('Logged_In_Donor');
	  		 var donorData = JSON.parse(data);
	  		 var donorId = donorData.id;
	  		alert('id=>'+fundid+"amount=>"+amount);
	  		
	  		var formData = "id="+donorId+"&fundRequestId="+fundid+"&amount="+amount;
	  		var url = "http://localhost:8080/Charityapp-api/TransactionServlet?"+formData;
	  		
	  		/* Get response form servlet */
	  		if(amount > 0 && amount != null)
	  			{
			  		$.get(url,function(data){
						console.log('Donate success!');
						 $(function(){
						    	$('#transactionStatus').css({"display":"block"});
						    	$('#errorStatus').css({"display":"none"});
						    	$('#responseMessage').html("Donate success!Thank you for your contribution!");
						    	$('#fundamount').css({'display':'none'});
						    	$('#donatebtn').css({"display":"none"});
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
	  	
	  	function updateBtn(id,amount)
	  	{
	  		 $('#contributeModel').on('show.bs.modal', function (event) {
	                var button = $(event.relatedTarget) // Button that triggered the modal
	                var recipient = button.data('whatever') // Extract info from data-* attributes
	                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	                var modal = $(this)
	                modal.find('.modal-title').text('Donate Fund')
	                modal.find('.modal-body #fundid').val(id)
	                modal.find('.modal-body #fundamount').val(amount)
	  		 });
	  		$('#fundamount').css({'display':'block'});
	  		$('#transactionStatus').css({'display':'none'});
	  		$('#errorStatus').css({'display':'none'});
	  		$('#donatebtn').css({"display":"block"});
	  		
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
		                //content += '</td><td>';
		                //content += data.description;
		                content += '</td><td>';
		                content += data.amount;
		                content += '</td><td>';
		                content += data.expireDate.day+"-"+ data.expireDate.month+"-"+data.expireDate.year;
		                content += '</td><td>';
		                //content += '<input type="number" id="amount_'+ data.id +'" class="form-control" min="1" placeholder="Enter amount"/>';
		                
		                //content += '</td><td>';
		                //var click = "donate('"+ data.id +"')";
		                var desc = "showDescription('"+ data.description +"')";
		                var updateBtn = "updateBtn('"+data.id+"','"+data.amount+"')";
		                //content += '<button class="btn btn-outline-success" onclick=' + click + '>Donate</button>';
		                content += '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#contributeModel" onclick="'+updateBtn+'">Contribute</button>';
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