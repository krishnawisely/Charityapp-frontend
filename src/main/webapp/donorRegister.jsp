 <div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
        <div class="col-md-6 col-lg-3 text-center" style="box-shadow: 5px 8px 18px -8px rgba(0,0,0,0.5);border-radius:10px">
            
            <div class="alert alert-success alert-dismissible fade show" id="registerSuccess" style="display:none;margin: 0;" role="alert">
		  		<i id="responseMessage"></i>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
			</div>
			
			<div class="alert alert-error alert-dismissible fade show" id="registerFailure" style="display:none;margin: 0;" role="alert">
		  		<i id="errorMessage"></i>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
			</div>
                  
            <h5 class="text-secondary" style="padding: 10px 0">Donor Register</h5>
            
            <form onsubmit="donorRegister()" name="donorRegister">
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    Name
                                </div>
                            </div>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Name" required/>
                        </div>
                        <p class="errorMsgName"></p>
                    </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Email
                            </div>
                        </div>
                        <input type="email" name="email" id="email" class="form-control" placeholder="Email" required/>
                    </div>
                    <p class="errorEmail"></p>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Password
                            </div>
                        </div>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Password" required/>
                    </div>
                     <p class="errorPassword"></p>
                </div>
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    Birth Date
                                </div>
                            </div>
                            <input type="text" name="dob" id="dob" class="form-control" required/>
                        </div>
                        <p class="errorMsgDate"></p>
                    </div>
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    Gender
                                </div>
                            </div>
                           <select id="gender" class="form-control">
                           	<option value="">--SELECT--</option>
                           	<option value="MALE">Male</option>
                           	<option value="FEMALe">Female</option>
                           </select>
                        </div>
                    </div>
                <button onclick="" type="submit" class="btn btn-outline-secondary">Register</button>
                <input type="reset" class="btn btn-outline-danger"/>
                <p>Already have an account <a href="?pagePath=donorLogin.jsp">Click here</a>.</p>
            </form>
        </div>
    </div>
   <script src="asserts/js/donorjs/donorRegister.js"></script>