<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="asserts/css/bootstrap.min.css">
    <title>Donor Home</title>
  	<script>
  		/* Redirect page if user didn't login */
		var data = localStorage.getItem('Logged_In_Donor');
	 	var donorData = JSON.parse(data);
		if(!donorData)
		{
			window.location.replace('donorLogin.jsp');
		}
  	</script>
</head>
<body>
	<!-- Navigation start -->
	<jsp:include page="donorHeader.jsp"></jsp:include>
	<!-- Navigation end -->
	<!-- Content start -->
    <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="alert alert-success alert-dismissible fade show" id="loginStatus" style="display:none;margin: 0;" role="alert">
		  		<strong id="userName"></strong>Login success!
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
			</div>
        </div>
    </div>
   	<!-- Content end -->
   	<!-- External lib start -->
    <script src="asserts/js/jquery-3.4.1.min.js"></script>
  	<script src="asserts/js/bootstrap.min.js"></script>
  	<script src="asserts/js/donorjs/donorHome.js"></script>
  	<!-- External lib end -->
</body>
</html>