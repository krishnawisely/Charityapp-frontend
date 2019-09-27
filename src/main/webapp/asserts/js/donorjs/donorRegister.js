  $(function(){
        $('#dob').datepicker({
        	minDate:'',
        	maxDate:'-15Y',
        	dateFormat: 'yy-mm-dd'
        });
        
        $('#name').on("keyup", function(){
        	let name =$('#name').val();
        	if(typeof name == 'string'){
        		alert("first letter shoud be string");
        	}
        	console.log('name=>'+name);
        });
    });
  
    function donorRegister()
    {
    	event.preventDefault();
        let userName = $('#name').val();
        let email = $('#email').val();
        let password = $('#password').val();
        let dateOfBirth = $('#dob').val();
        if($('#male').prop("checked", false))
        {
            var gender = 'male';
        } 
        else
        {
            var gender = 'female';
        }
        var formData = "name="+userName+"&email="+email+"&password="+password+"&dob="+dateOfBirth+"&gender="+gender;
        var url = "http://localhost:8080/Charityapp-api/DonorRegisterServlet?"+formData;
        $.get(url,function(data){

            var response = JSON.parse(data);

            if(response.errorMessage != null)
            {
            	$('#registerSuccess').css({'display':'none'});
            	$('#registerFailure').css({'display':'block'});
            	$('#errorMessage').html('Register is not success!');
            } else{
            	$('#registerFailure').css({'display':'none'});
            	$('#registerSuccess').css({'display':'block'});
              	$('#responseMessage').html('Register is success!');
//                  window.location.replace('index.jsp');
               }
            
         
        });
    }