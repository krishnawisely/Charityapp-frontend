<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="asserts/css/bootstrap.min.css" />
<link rel="stylesheet" href="asserts/css/style.css" />
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
	<!-- External lib start -->
	<script src="asserts/js/jquery-3.4.1.min.js"></script>
	<script src="asserts/js/bootstrap.min.js"></script>
	<script src="asserts/js/donorjs/donorRegister.js"></script>
	<!-- External lib end -->

</body>
</html>