<div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
            <div class="col-md-4 text-center" style="box-shadow: 5px 8px 18px -8px rgba(0,0,0,0.5);border-radius:10px">
                
                 <div class="alert alert-success alert-dismissible fade show" id="fundStatus" style="display:none;margin: 0;" role="alert">
		  			<i id="successMsg"></i>
				  	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  	</button>
				</div>
				
				 <div class="alert alert-danger alert-dismissible fade show" id="errorStatus" style="display:none;margin: 0;" role="alert">
		  			<strong id="errorMsg"></strong>
				  	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  	</button>
				</div>
                
                <h5 class="bg-secondary text-light" style="padding:10px 0;margin-top:-20px;border-radius: 5px;box-shadow: 5px 8px 18px -8px rgba(0,0,0,0.5)">Fund Request</h5>
                <form onsubmit="fundRequest()" name="fundrequest">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Request Type<i class="text-danger">*</i>
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
                                Amount<strong>(Rs)</strong><i class="text-danger">*</i>
                            </div>
                        </div>
                        <input pattern="(\d{3,9})(\.\d{1,2})?" type="text" name="amount" id="amount" min="100" max="" class="form-control" placeholder="Amount" title="Amount should be in the range of 100 rupeese - 10 crores and after decimal only two digits!" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Expire date<i class="text-danger">*</i>
                            </div>
                        </div>
                        <input type="text" pattern="(\d{4})(-)(\d{2})(-)(\d{2})" title="Date should be like YYYY-MM-DD" name="expireDate" id="expireDate" class="form-control" placeholder="Expire date" required>
                    </div>
                </div>
                 <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Description<i class="text-danger">*</i>
                            </div>
                        </div>
                        <textarea minlength="10" maxlength="200" title="Description" name="description" id="description" class="form-control" placeholder="Description" required></textarea>
                    </div>
                </div>
                <button type="submit" class="btn btn-outline-secondary">Submit</button>
                <input type="reset" class="btn btn-outline-danger">
                </form>
            </div>
        </div>