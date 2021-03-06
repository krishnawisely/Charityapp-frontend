    <div class="row justify-content-center" style="margin:0;">
    <div class="col-md-8 text-center">
		<h3 class="text-secondary" style="border-bootm:2px solid black;">Update Fund Request</h3>
	</div>
	<div class="w-100"></div>
        <div class="col-md-8">
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <span>Request Type</span>
                                </div>
                            </div>
                            <select name="requestType" id="fundRequestType" class="form-control" onchange="listRequest()">
                                    <option value="">--SELECT--</option>
                                    <option value="EDUCATION">Education</option>
                                    <option value="FOOD">Food</option>
                                    <option value="MEDICAL">Medical</option>
                                    <option value="AGRICULTURE">Agriculture</option>
                                    <option value="OTHERS">Others</option>
                                </select>
                        </div> 
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Request Type</th>
                                <!--<th>Description</th>-->
                                <th>Amount<strong>(Rs)</strong></th>
                                <th>Expire Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="listFundRequest">
                           <tr>
                           	<td colspan="4"><div class="text-danger text-center">No data found!</div></td>
                           </tr>
                        </tbody>
                    </table>

                   
                    <!-- Model box for update fund request -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title text-center" id="exampleModalLabel"></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                            
                            <div class="alert alert-success alert-dismissible fade show" id="updateStatus" style="display:none;" role="alert">
						  		<span id="updateMsg"></span>
								  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
								    <span aria-hidden="true">&times;</span>
								  </button>
							</div>
                            
                            <div class="alert alert-danger alert-dismissible fade show" id="errStatus" style="display:none;" role="alert">
						  		<span id="errMsg"></span>
								  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
								    <span aria-hidden="true">&times;</span>
								  </button>
							</div>
                            
                            
                              <form id="" onsubmit="updateFundRequest()">
                                <div class="form-group">
                                  <label for="request-id" class="col-form-label" style="display:none;">Id</label>
                                  <input type="text" class="form-control" id="fundRequestId" style="display:none">
                                </div>
                                <div class="form-group">
                                <input type="text" class="form-control" id="fundRequestType1" disabled>
                                  <label for="request-type" class="col-form-label">Request Type<i class="text-danger">*</i></label>
                                   <select name="requestType" id="fundRequestType" class="form-control" required>
                                    <option value="">--SELECT--</option>
                                    <option value="EDUCATION">Education</option>
                                    <option value="FOOD">Food</option>
                                    <option value="MEDICAL">Medical</option>
                                    <option value="AGRICULTURE">Agriculture</option>
                                    <option value="OTHERS">Others</option>
                                </select>
                                </div>
                                <div class="form-group">
                                  <label for="amount" class="col-form-label">Amount<strong>(Rs)</strong><i class="text-danger">*</i></label>
                                  <input type="number" min="100" class="form-control" id="fundAmount" pattern="(\d{3,9})(\.\d{1,2})?" title="Amount should be in the range of 100 rupeese - 10 crores and after decimal only two digits!" required>
                                </div>
                                <div class="form-group">
                                  <label for="expire-date" class="col-form-label">Expire Date<i class="text-danger">*</i></label>
                                  <input type="text" class="form-control" id="fundExpireDate" pattern="(\d{4})(-)(\d{2})(-)(\d{2})" title="Date should be like YYYY-MM-DD" required>
                                </div>
                                <div class="form-group">
                                  <label for="message-text" class="col-form-label">Description<i class="text-danger">*</i></label>
                                  <textarea class="form-control" id="fundDescription" required></textarea>
                                </div>
                                <div class="modal-footer">
	                              <button type="submit" class="btn btn-outline-info" id="updateBtn" onclick="">Update</button>
	                       			<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
	                            </div>
                              </form>
                            </div>
                           
                          </div>
                        </div>
                      </div>
        </div>
    </div>
    
    <script>

        var apiUrl = "http://localhost:8080/Charityapp-api/";
        /* List fund request */
        function listRequest()
        {
            var fundRequestType = $('#fundRequestType').val();
            console.log("fund=>"+fundRequestType);
            let formData = "ListFundRequestServlet?requestType="+fundRequestType;
            $.getJSON(apiUrl+formData,(res)=>{
                console.log(apiUrl+formData);
                console.log(res);
                let content = '';
                for(data of res)
                {
                    let editBtn = "editBtn("+data.id+",'"+data.requestType+"',"+data.amount+","+data.expireDate.day+","+data.expireDate.month+","+data.expireDate.year+",'"+data.description+"')";
                   
                    content +='<tr><td>'+data.requestType+'</td>';
                    //content +='<td>'+data.description+'</td>';
                    content +='<td>'+data.amount+'</td>';
                    content +='<td>'+data.expireDate.day+'-'+data.expireDate.month+'-'+data.expireDate.year+'</td>';
                    content +='<td>'
                    +'<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" onclick="'+editBtn+'">Update</button>'
                    +'</td></tr>';
                }
                $('#listFundRequest').html(content);
                console.log('content=>'+content);
            });
            console.log(fundRequestType);
        }

       

        /* Edit  */
        function editBtn(id,reqType,amt,day,month,year,desc)
        {
            console.log("id=>"+id);
            console.log("ReqType=>"+reqType);
            console.log("amt=>"+amt);
            console.log("expireDay=>"+day);
            console.log("expireMonth=>"+month);
            console.log("expireYear=>"+year);

            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                var recipient = button.data('whatever') // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                modal.find('.modal-title').text('Update fund request')
                modal.find('.modal-body #fundRequestType1').val(reqType)
                modal.find('.modal-body #fundDescription').val(desc)
                modal.find('.modal-body #fundAmount').val(amt)
                modal.find('.modal-body #fundExpireDate').val(year+"-"+month+"-"+day)
                modal.find('.modal-body #fundRequestId').val(id)

                $(function(){
                    console.log("test datepicker!");
                    $('#fundExpireDate').datepicker({
                        minDate: new Date(year+"-"+month+"-"+day),
                        maxDate: '+1Y',
                        dateFormat: 'yy-mm-dd'
                    });
                    $('#updateInput').css({'display':'block'});
                    $('#updateStatus').css({'display':'none'});
                    $('#errStatus').css({'display':'none'});
                    $('#updateBtn').prop('disabled',false);
                })
            })
        }

        /* Make fund request */
        function updateFundRequest()
        {
            event.preventDefault();
            console.log('this is function!');
            var id = $('#fundRequestId').val();
            var requestType = $('#fundRequestType').val();
            var description = $('#fundDescription').val();
            var amount = $('#fundAmount').val();
            var expireDate = $('#fundExpireDate').val();
            console.log("requestType=>"+requestType);
            console.log("description=>"+description);
            console.log("amount=>"+amount);
            console.log("expireDate=>"+expireDate);
            var formData = "UpdateFundRequestServlet?requestType="+requestType+"&description="+description+"&expireDate="+expireDate+"&amount="+amount+"&id="+id;
            console.log(apiUrl+formData);
            $.getJSON(apiUrl+formData,(res)=>{
                console.log(res);
                
                if(res.isFundUpdated)
                {
                	$('#errStatus').css({'display':'none'});
                    $('#updateStatus').css({'display':'block'});
                    $('#updateMsg').html('Update Success');
                    $('#updateInput').css({'display':'none'});
                    $('#updateBtn').prop('disabled',true);
                } else{
                	$('#updateStatus').css({'display':'none'});
                	$('#errStatus').css({'display':'block'});
                    $('#errMsg').html('Update failed');
                    $('#updateInput').css({'display':'block'});
                    $('#updateBtn').prop('disabled',false);
                    }
            });
        }
    </script>
