<div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
            <div class="col-md-4 text-center" style="box-shadow: 5px 8px 18px -8px rgba(0,0,0,0.5);border-radius:10px">
                <h5 class="bg-warning text-light" style="padding:10px 0;margin-top:-20px;border-radius: 5px;box-shadow: 5px 8px 18px -8px rgba(0,0,0,0.5)">Fund Request</h5>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Request Type
                            </div>
                        </div>
                        <select id="requestType" class="form-control">
                            <option>--Request type--</option>
                            <option value="EDUCATION">Education</option>
                            <option value="FOOD">Food</option>
                            <option value="MEDICAL">Medical</option>
                            <option value="AGRICULTURE">Agriculture</option>
                            <option value="OTHERS">Others</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Description
                            </div>
                        </div>
                        <input type="text" name="description" id="description" class="form-control" placeholder="Description" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Amount
                            </div>
                        </div>
                        <input type="number" name="amount" id="amount" class="form-control" placeholder="Amount" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Expire date
                            </div>
                        </div>
                        <input type="date" name="expireDate" id="expireDate" class="form-control" required>
                    </div>
                </div>
                <button onclick="fundRequest()" class="btn btn-outline-secondary">Send</button>
            </div>
        </div>
    <script>
        function fundRequest()
        {

        	var data = localStorage.getItem('Logged_In_Admin');
			var adminData = JSON.parse(data);
			var id = JSON.stringify(adminData.id);
            
        	var donorId = id;
            var requestType = $('#requestType').val(); 
            var description = $('#description').val();
            var amount = $('#amount').val();
            var date = $('#expireDate').val();
            console.log("ID=>"+donorId);
            console.log("requestType=>"+requestType);
            console.log("description=>"+description);
            console.log("amount=>"+amount);
            console.log("date=>"+date);
            var formData = "id="+donorId+"&requestType="+requestType+"&description="+description+"&amount="+amount+"&date="+date;
            var url = "http://localhost:8080/CharityApplication/FundRequestServlet?"+formData;
            $.get(url,function(data){
                console.log(data)
                console.log('fund request success!');
            });
        }
    </script>