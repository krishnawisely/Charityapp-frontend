<div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
        <div class="col-md-6 col-lg-3 text-center" style="box-shadow: 5px 8px 18px -8px rgba(0,0,0,0.5);border-radius:10px">
            
             <div class="alert alert-warning alert-dismissible fade show" id="loginStatus" style="display:none;" role="alert">
		  		<strong id="err"></strong>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
			</div>
            
            <h5 class="text-secondary" style="padding: 10px 0">Admin Login</h5>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            Email
                        </div>
                    </div>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email" required/>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            Password
                        </div>
                    </div>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                </div>
            </div>
            <button onclick="adminLogin()" type="submit" class="btn btn-outline-secondary">Login</button>
            <p><a href="#">Forget password</a></p>
        </div>
    </div>
    <script>
        function adminLogin()
        {
            var email = $('#email').val();
            var password = $('#password').val();
            console.log('user=>'+email+password);
            var formData ="email="+email+"&password="+password;
            var url="http://localhost:8080/Charityapp-api/AdminLoginServlet?"+formData;
            $.get(url,function(data){
                console.log(data);
                //var response = JSON.parse(data);
               	var resData = JSON.stringify(data);
                $('#err').html(data.errorMessage);
                $('#loginStatus').css({"display":"block"});
                if(data.errorMessage != null)
                {
                	$('#err').html(data.errorMessage);
                	$('#loginStatus').css({"display":"block"});
                } else{
                	 window.location.replace('adminHome.jsp');
                     localStorage.setItem('Logged_In_Admin',resData);
                    }
               
                
            });
        }
    </script>