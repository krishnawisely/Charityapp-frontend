 $(function(){
     	$('#loginStatus').css({"display":"block"});
         });
     $(function(){
    	 var data = localStorage.getItem('Logged_In_Donor');
 	 	var donorData = JSON.parse(data);
			$('#dropdownId').html(donorData.name);
			$('#userName').html(donorData.name+"!");
         });
     /* User logout */
  	function logout()
  	{
  	  	console.log('logout success!');
  	  	localStorage.clear();
  	  	window.location.replace('index.jsp');
  	}