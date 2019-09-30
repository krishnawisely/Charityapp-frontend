  $(function(){
	  /* Date picker */
        $('#dob').datepicker({
        	minDate:'',
        	maxDate:'-15Y',
        	dateFormat: 'yy-mm-dd'
        });
        
//        $('#name').on("keyup", function(){
//        	let name =$('#name').val();
//        	if(typeof name == 'string'){
//        		alert("first letter shoud be string");
//        	}
//        	console.log('name=>'+name);
//        });
        
        let userName = $('#name').val();
        let email = $('#email').val();
        let password = $('#password').val();
        let dateOfBirth = $('#dob').val();
        let gender = $('#gender').val();
        
        console.log("name=>"+userName);
        
       /* Disabled submit button */
//        $(':input[type="submit"]').prop('disabled',true);
        
        /** User name validation **/
        $('#name').css({'border':'1px solid #ced4da'});
            $(function(){
                $('#name').on("keyup",()=>{
                var name = $('#name').val();
                console.log("name=>"+name);
                var regex = /[0-9]/g;
                console.log("regex=>"+name.match(regex));
                if(name.match(regex))
                {
                    $('#name').css({'box-shadow':'0 0 5px rgba(240, 2, 2, 1)'});
                    $('.errorMsgName').html('Name should be [a-zA-Z]!');
                    $('.errorMsgName').css({'color':'red'});
                   
                } else{
                    $('#name').css({'box-shadow':'0 0 5px rgba(0, 0, 0, 0)'});
                    $('.errorMsgName').html('');
                   
                }
                
                /* Check any input field is epty or not */
                if(userName == '' || email == '' || password == '' || dob == '' || gender == '')
	        	{
//	        		$(':input[type="submit"]').prop('disabled',true);
	        	} else{
	        		$(':input[type="submit"]').prop('disabled',false);
	        	}
                
            });
            });   
            
            
            /** Password validation **/
            $('#password').css({'border':'1px solid gray'});
                $(function(){
                    $('#password').on("keyup",()=>{
                    var password = $('#password').val();
                    console.log("password=>"+password);
                    var regex = new RegExp("^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{8,})");
                    console.log("regex=>"+password.match(regex));
                    if(password.match(regex) == null)
                    {
                        $('#password').css({'box-shadow':'0 0 5px rgba(240, 2, 2, 1)'});
                        $('.errorPassword').html('Invalid  password');
                        $('.errorPassword').css({'color':'red'});
                    } else{
                        $('#password').css({'box-shadow':'0 0 5px rgba(0, 0, 0, 0)'});
                        $('.errorPassword').html('');
                    
                    }
                });
                });   
            
            
            /** Date validation **/
            $('#dob').css({'border':'1px solid #ced4da'});
                $(function(){
                    $('#dob').on("keyup",()=>{
                    var dob = $('#dob').val();
                    console.log("dob=>"+dob);
                    var regex = /^(\d{4})-(\d{2})-(\d{2})$/;
                    console.log("regex=>"+dob.match(regex));
                    if(!dob.match(regex))
                    {
                        $('#dob').css({'box-shadow':'0 0 5px rgba(240, 2, 2, 1)'});
                        $('.errorMsgDate').html('Date format should be [YYYY-MM-DD]!');
                    } else{
                        $('#dob').css({'box-shadow':'0 0 5px rgba(0, 0, 0, 0)'});
                        $('.errorMsgDate').html('');
                    }
                    
                    /* Check any input field is epty or not */
                    if(userName == '' || email == '' || password == '' || dob == '' || gender == '')
    	        	{
//    	        		$(':input[type="submit"]').prop('disabled',true);
    	        	} else{
    	        		$(':input[type="submit"]').prop('disabled',false);
    	        	}
                });
                });      
            
    });
  
    function donorRegister()
    {
    	event.preventDefault();
        let userName = $('#name').val();
        let email = $('#email').val();
        let password = $('#password').val();
        let dateOfBirth = $('#dob').val();
        let gender = $('#gender').val();
        var formData = "name="+userName+"&email="+email+"&password="+password+"&dob="+dateOfBirth+"&gender="+gender;
        var url = "http://localhost:8080/Charityapp-api/DonorRegisterServlet?"+formData;
        $.getJSON(url,function(data){

            //var response = JSON.parse(data);
        	var response = data;
        	console.log("response=>"+response);
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