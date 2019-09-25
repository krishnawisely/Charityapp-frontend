<div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
            <div class="col-md-4 text-center" style="box-shadow: 5px 8px 18px -8px rgba(0,0,0,0.5);border-radius:10px">
                
                 <div class="alert alert-success alert-dismissible fade show" id="fundStatus" style="display:none;margin: 0;" role="alert">
		  			<strong id="userName"></strong>Request send successfully
				  	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  	</button>
				</div>
                
                <h5 class="bg-secondary text-light" style="padding:10px 0;margin-top:-20px;border-radius: 5px;box-shadow: 5px 8px 18px -8px rgba(0,0,0,0.5)">Fund Request</h5>
                <form onsubmit="fundRequest()">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Request Type
                            </div>
                        </div>
                        <select id="requestType" class="form-control" required>
                            <option value="">--SELECT--</option>
                            <option value="EDUCATION">Education</option>
                            <option value="FOOD">Food</option>
                            <option value="MEDICAL">Medical</option>
                            <option value="AGRICULTURE">Agriculture</option>
                            <option value="OTHERS">Others</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Description
                            </div>
                        </div>
                        <input type="text" name="description" id="description" class="form-control" placeholder="Description" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Amount<strong>(Rs)</strong>
                            </div>
                        </div>
                        <input type="number" name="amount" id="amount" min="1" class="form-control" placeholder="Amount" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Expire date
                            </div>
                        </div>
                        <input type="text" name="expireDate" id="expireDate" class="form-control" placeholder="Expire date" required>
                    </div>
                </div>
                <button onclick="" class="btn btn-outline-secondary">Send</button>
                </form>
            </div>
        </div>