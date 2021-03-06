<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="asserts/css/bootstrap.min.css" />
<link rel="stylesheet" href="asserts/css/style.css" />
<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="asserts/css/jquery-ui.min.css">
<link rel="stylesheet" href="asserts/css/jquery-ui.theme.min.css">
<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- External lib start -->
	<script src="asserts/js/jquery-3.4.1.min.js"></script>
	<script src="asserts/js/bootstrap.min.js"></script>
	<script src="asserts/js/jquery-ui.min.js"></script>
	 
	<!-- External lib end -->
<title>CharityApp</title>
</head>
<body class="bg-light">

	<!-- Navigation start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Navigation end -->

	<!-- Content start -->
		<%
			String path = request.getParameter("pagePath");
		if(path == null || "".equals(path.trim()))
		{
			path = "homePage.jsp";
		}
		%>
	<!-- Content end -->
		<jsp:include page="<%=path %>"></jsp:include>
	

</body>
</html>