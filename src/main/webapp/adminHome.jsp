<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="asserts/css/bootstrap.min.css">
    <link rel="stylesheet" href="asserts/css/jquery-ui.min.css">
    <link rel="stylesheet" href="asserts/css/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
     <script src="asserts/js/jquery-3.4.1.min.js"></script>
  	<script src="asserts/js/bootstrap.min.js"></script>
  	<script src="asserts/js/jquery-ui.min.js"></script>
    <title>Document</title>
    <script>
  		/* Redirect page if user didn't login */
		var data = localStorage.getItem('Logged_In_Admin');
	 	var donorData = JSON.parse(data);
		if(!donorData)
		{
			window.location.replace('index.jsp');
		}
  	</script>
</head>
<body>
 <jsp:include page="adminHeader.jsp"></jsp:include>
        
        <%
        	String pagePath= request.getParameter("pagePath");
        	if(pagePath == null || "".equals(pagePath.trim()))
        	{
        		pagePath = "adminHomePage.jsp";
        	}
        %>
        <jsp:include page="<%=pagePath %>"></jsp:include>
    
    
     <script>
	    $(function(){
	    	$('#loginStatus').css({"display":"block"});
	        });
			function logout()
		  	{
		  	  	console.log('logout success!');
		  	  	localStorage.clear();
		  	  	window.location.replace('index.jsp');
		  	}
		  	$(function(){
		  		var data = localStorage.getItem('Logged_In_Admin');
				var adminData = JSON.parse(data);
				//var adminData = data;
				var id = JSON.stringify(adminData.id);
				 console.log('name=>'+adminData.name);
				$('#dropdownId').html(adminData.name);
				console.log(adminData);
			  	});
    </script>
    
    
    
    	<script src="asserts/js/donorjs/raiseRequest.js" ></script>
   	   <script src="asserts/js/adminjs/fundRequest.js" ></script>
   	   
</body>
</html>