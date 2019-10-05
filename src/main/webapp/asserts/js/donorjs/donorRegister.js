  $(function(){
	  /* Date picker */
        $('#dob').datepicker({
        	minDate:'',
        	maxDate:'-15Y',
        	dateFormat: 'yy-mm-dd'
        });
        
        /* Disabled submit button */
        $(':input[type="submit"]').prop('disabled',true);
        
        //Form validation
        function checkform()
        {
            var form = document.forms["donorRegister1"].elements;
            var cansubmit = true;
//            console.log(form.length - 2);
            for (var i = 0; i < 5; i++) {
                if (form[i].value.length == 0) 
                	{
                		cansubmit = false;
                	}
            }

            if (cansubmit) {
            	$(':input[type="submit"]').prop('disabled',!cansubmit);
//            	console.log("inside form");
            } 
        }
        
        
        /** User name validation **/
        $('#name').css({'border':'1px solid #ced4da'});
            $(function(){
                $('#name').on("focusout",()=>{
                let name = $('#name').val();
                let email = $('#email').val();
//                console.log("name=>"+name);
                var regex = /[a-zA-Z\s]{3,}/g;
//                console.log("regex=>"+name.match(regex));
                if(!name.match(regex))
                {
                    $('#name').css({'box-shadow':'0 0 5px rgba(240, 2, 2, 1)'});
                    $('.errorMsgName').html('Name should be alphabet/alphabet+number and min length 3!');
                    $('.errorMsgName').css({'color':'red','font-size':'13px'}); 
                    /* Disabled submit button */
                    $(':input[type="submit"]').prop('disabled',true);
                    
                } else{
                    $('#name').css({'box-shadow':'0 0 5px rgba(0, 0, 0, 0)'});
                    $('.errorMsgName').html('');
                    
//                  Form validation
                    checkform();
                   
                }


                $('#gender').on('change',function(){
                	var gender = $('#gender').val();
                	if(gender == '')
                		{
                			$('#gender').css({'box-shadow':'0 0 5px rgba(240, 2, 2, 1)'});
                			$(':input[type="submit"]').prop('disabled',true);
                		}else{
                			$('#gender').css({'box-shadow':'0 0 5px rgba(0, 0, 0, 0)'});
                			checkform();
                		}
                });
                
             
            });
            });   
            
            
            /** Password validation **/
            $('#password').css({'border':'1px solid #ced4da'});
                $(function(){
                    $('#password').on("focusout",()=>{
                    var password = $('#password').val();
                    var regex = new RegExp("^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{8,})");
                    if(password.match(regex) == null)
                    {
                        $('#password').css({'box-shadow':'0 0 5px rgba(240, 2, 2, 1)'});
                        $('.errorPassword').html('password length(8) and alphanumeric');
                        $('.errorPassword').css({'color':'red','font-size':'13px'}); 
                        /* Disabled submit button */
                        $(':input[type="submit"]').prop('disabled',true);
                    
                    } else{
                        $('#password').css({'box-shadow':'0 0 5px rgba(0, 0, 0, 0)'});
                        $('.errorPassword').html('');
//                      Form validation
                        checkform();
                    }

                });
                });   
                
                
                /** Email validation **/
                $('#email').css({'border':'1px solid #ced4da'});
                    $(function(){
                        $('#email').on("focusout",()=>{
                        var email = $('#email').val();
                        var regex = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
                        if(!email.match(regex))
                        {
                            $('#email').css({'box-shadow':'0 0 5px rgba(240, 2, 2, 1)'});
                            $('.errorEmail').html('Invalid email id');
                            $('.errorEmail').css({'color':'red','font-size':'13px'}); 
                            /* Disabled submit button */
                            $(':input[type="submit"]').prop('disabled',true);
                       

                        } else{
                            $('#email').css({'box-shadow':'0 0 5px rgba(0, 0, 0, 0)'});
                            $('.errorEmail').html('');
                            
//                          Form validation
                            checkform();
                        }   
                       
                    });
                    });   
            
            
            /** Date validation **/
            $('#dob').css({'border':'1px solid #ced4da'});
                $(function(){
                    $('#dob').on("focusout",()=>{
                    var dob = $('#dob').val();
//                    console.log("dob=>"+dob);
                    var regex = /^(\d{4})-(\d{2})-(\d{2})$/;
//                    console.log("regex=>"+dob.match(regex));                    
                    if(dob.match(regex) == null)
                    {
                        $('#dob').css({'box-shadow':'0 0 5px rgba(240, 2, 2, 1)'});
                        $('.errorMsgDate').html('Date format should be [YYYY-MM-DD]!');
                        $('.errorMsgDate').css({'color':'red','font-size':'13px'}); 
                        /* Disabled submit button */
                        $(':input[type="submit"]').prop('disabled',true);
                    
                    } else{
                        $('#dob').css({'box-shadow':'0 0 5px rgba(0, 0, 0, 0)'});
                        $('.errorMsgDate').html('');
//                      Form validation
                        checkform();
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
        	var response = data;
        	console.log("response=>"+response);
            if(response.isStatus != true)
            {
            	$('#registerSuccess').css({'display':'none'});
            	$('#registerFailure').css({'display':'block'});
            	$('#errorMessage').html('Register is not success!');
            	$('.errorEmail').css({'color':'red','font-size':'13px'}); 
            	$('.errorEmail').html(response.errorMessage);
            } else{
            	$('#registerFailure').css({'display':'none'});
            	$('#registerSuccess').css({'display':'block'});
              	$('#responseMessage').html('Register is success!');
               }
        });
    }