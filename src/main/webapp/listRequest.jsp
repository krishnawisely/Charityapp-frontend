<!-- Content start -->
	<div class="row justify-content-center">
	<div class="col-md-8 text-center">
		<h3 class="text-secondary" style="border-bootm:2px solid black;">Contribute</h3>
	</div>
	<div class="w-100"></div>
		<div class="col-md-4">
		
		<div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<div class="input-group-text">
						Request Type
					</div>
				</div>
				<select id="requestType"
						class="form-control" onchange="listRequest()">
						<option>--SELECT--</option>
						<option value="EDUCATION">Education</option>
						<option value="FOOD">Food</option>
						<option value="MEDICAL">Medical</option>
						<option value="AGRICULTURE">Agriculture</option>
						<option value="OTHERS">Others</option>
					</select>
			</div>
		</div>
		</div>
		<div class="w-100"></div>
		<div class="col-md-8">
			
			<table id="listRequest" class="table" style="">
				<thead>
					<tr>
						<th>Request Type</th>
						<!--<th>Description</th>-->
						<th>Amount(Rs)</th>
						<th>Expiry Date</th>
						<!-- <th>Contribute(Rs)</th> -->
						<th>Action</th>
					</tr>
				</thead>
				<tbody id="requestTable">

				</tbody>
			</table>
			
			<!-- Contribute amount -->
			<!-- Button trigger modal -->

			<!-- Contribute Modal -->
			
				<div class="modal fade" id="contributeModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title text-center" id="exampleModalLabel"></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                            
                            <!-- Alert message -->
                            
                            <div class="alert alert-success alert-dismissible fade show"
								id="transactionStatus" style="display: none;" role="alert">
								<i id="responseMessage"></i>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							
							<div class="alert alert-warning alert-dismissible fade show"
								id="errorStatus" style="display: none;" role="alert">
								<i id="errorMessage"></i>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
                            
                            <div class="alert alert-warning alert-dismissible fade show"
								id="" style="" role="alert">
								<i id="">Your <strong>entered amount</strong> is grater than <strong>needed amount</strong> that shoud be accepted!</br>
								If you want to know more information go to contact us.
								</i>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
                            <!-- End -->
                            
                            <form onsubmit="donateMoney()">
						        <input type="text" class="form-control" id="fundid" style="display:none">
						        <input pattern="(\d{3,9})(\.\d{1,2})?" type="text" class="form-control" id="fundamount" title="Amount should be in the range of 100 rupeese - 10 crores and after decimal only two digits!" required>
						        	<div class="modal-footer">
							         	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        			<button type="submit" class="btn btn-primary" id="donatebtn" onclick="">Donate</button>
				        			</div>
				        		</form>
				      </div>
				      
				    </div>
				  </div>
				</div>
			
			<!-- End -->
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLongTitle">More Details</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body" id="description">
			       
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        
			      </div>
			    </div>
			  </div>
			</div>
			
		</div>
	</div>
	<script src="asserts/js/donorjs/listRequest.js"></script>
	<!-- Content end -->