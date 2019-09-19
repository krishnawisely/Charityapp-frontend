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
		<div class="col-md-4">
			<label>Request Type</label> <select id="requestType"
				class="form-control" onchange="listRequest()">
				<option>--SELECT--</option>
				<option value="EDUCATION">Education</option>
				<option value="FOOD">Food</option>
				<option value="MEDICAL">Medical</option>
				<option value="AGRICULTURE">Agriculture</option>
				<option value="OTHERS">Others</option>
			</select>
		</div>
		<div class="w-100"></div>
		<div class="col-md-8">
			<div class="alert alert-success alert-dismissible fade show"
				id="transactionStatus" style="display: none;" role="alert">
				Transaction success!
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>Request Type</th>
						<th>Description</th>
						<th>Amount</th>
						<th>Expire Date</th>
						<th>PayAmount</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody id="requestTable">

				</tbody>
			</table>
		</div>
	</div>
	<!-- Content start -->
	<!-- External lib start -->
	<script src="asserts/js/jquery-3.4.1.min.js"></script>
	<script src="asserts/js/bootstrap.min.js"></script>
	<script src="asserts/js/donorjs/listRequest.js"></script>
	<!-- External lib end -->	
</body>
</html>