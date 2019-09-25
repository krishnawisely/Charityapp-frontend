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
			window.location.replace('index.jsp');
		}
  	</script>
</head>
<body>
	<!-- Navigation start -->
	<jsp:include page="donorHeader.jsp"></jsp:include>
	<!-- Navigation end -->
	<!-- Content start -->
   		<%
 			
   			String path = request.getParameter("pagePath");
   			if(path == null || "".equals(path.trim()))
   			{
   				path="donorHomePage.jsp";
   			}
   		%> 		
   		<jsp:include page="<%=path %>"></jsp:include>
   	<!-- Content end -->
   	<!-- External lib start -->
    <script src="asserts/js/jquery-3.4.1.min.js"></script>
  	<script src="asserts/js/bootstrap.min.js"></script>
  	<script src="asserts/js/donorjs/donorHome.js"></script>
  	<script src="asserts/js/donorjs/listRequest.js"></script>
  	<!-- External lib end -->
</body>
</html>