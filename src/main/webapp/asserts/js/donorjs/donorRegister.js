  $(function(){
        console.log('this is jquery!');
        $('#dob').datepicker({
        	minDate:'',
        	maxDate:'-15Y',
        	dateFormat: 'yy-mm-dd'
        });
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
            	alert(response.errorMessage);
            } else{
            	  console.log('register success!');
                  window.location.replace('index.jsp');
               }
            
         
        });
    }