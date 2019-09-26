  $(function(){
        $('#dob').datepicker({
        	minDate:'',
        	maxDate:'-15Y',
        	dateFormat: 'yy-mm-dd'
        });
        $('#registerFailure').css({'display':'block'});
    });
    function donorRegister()
    {
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
            	$('#registerFailure').css({'display':'block'});
            	$('#errorMessage').html('Register is not success!');
            } else{
            	$('#registerSuccess').css({'display':'block'});
              	$('#responseMessage').html('Register is success!');
//                  window.location.replace('index.jsp');
               }
            
         
        });
    }