    <div class="row justify-content-center" style="margin:0;">
        <div class="col-md-8">
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <span>Request Type</span>
                                </div>
                            </div>
                            <select name="requestType" id="fundRequestType" class="form-control" onchange="listRequest()">
                                    <option value="">--SELECT--</option>
                                    <option value="EDUCATION">Education</option>
                                    <option value="FOOD">Food</option>
                                    <option value="MEDICAL">Medical</option>
                                    <option value="AGRICULTURE">Agriculture</option>
                                    <option value="OTHERS">Others</option>
                                </select>
                        </div> 
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>requestType</th>
                                <th>Description</th>
                                <th>Amount</th>
                                <th>Expire Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="listFundRequest">
                           
                        </tbody>
                    </table>

                   
                    <!-- Model box for update fund request -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <form>
                                <div class="form-group">
                                  <label for="request-id" class="col-form-label" style="visibility:hidden;">Id</label>
                                  <input type="text" class="form-control" id="fundRequestId" style="visibility:hidden;">
                                </div>
                                <div class="form-group">
                                  <label for="request-type" class="col-form-label">Request Type</label>
                                  <input type="text" class="form-control" id="fundRequestType">
                                </div>
                                <div class="form-group">
                                  <label for="amount" class="col-form-label">Amount<strong>(Rs)</strong></label>
                                  <input type="number" min="100" class="form-control" id="fundAmount">
                                </div>
                                <div class="form-group">
                                  <label for="expire-date" class="col-form-label">Expire Date</label>
                                  <input type="text" min="100" class="form-control" id="fundExpireDate">
                                </div>
                                <div class="form-group">
                                  <label for="message-text" class="col-form-label">Description</label>
                                  <textarea class="form-control" id="fundDescription"></textarea>
                                </div>
                              </form>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                              <button type="button" class="btn btn-primary" onclick="updateFundRequest()">Update</button>
                            </div>
                          </div>
                        </div>
                      </div>
        </div>
    </div>
    
    <script>

        var apiUrl = "http://localhost:8080/Charityapp-api/";
        /* List fund request */
        function listRequest()
        {
            var fundRequestType = $('#fundRequestType').val();
            console.log("fund=>"+fundRequestType);
            let formData = "ListFundRequestServlet?requestType="+fundRequestType;
            $.get(apiUrl+formData,(res)=>{
                console.log(apiUrl+formData);
                console.log(res);
                let content = '';
                for(data of res)
                {
                    let editBtn = "editBtn("+data.id+",'"+data.requestType+"',"+data.amount+","+data.expireDate.day+","+data.expireDate.month+","+data.expireDate.year+")";
                    content +='<tr><td>'+data.requestType+'</td>';
                    content +='<td>'+data.description+'</td>';
                    content +='<td>'+data.amount+'</td>';
                    content +='<td>'+data.expireDate.day+'-'+data.expireDate.month+'-'+data.expireDate.year+'</td>';
                    content +='<td>'
                    +'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" onclick='+editBtn+'>Edit</button>'
                    +'<button class="btn btn-outline-danger">Deactive</button>'
                    +'</td></tr>';
                }
                $('#listFundRequest').html(content);
                console.log('content=>'+content);
            });
            console.log(fundRequestType);
        }

        /* Edit  */
        function editBtn(id,reqType,amt,day,month,year)
        {
            console.log("id=>"+id);
            console.log("ReqType=>"+reqType);
            console.log("amt=>"+amt);
            console.log("expireDay=>"+day);
            console.log("expireMonth=>"+month);
            console.log("expireYear=>"+year);

            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                var recipient = button.data('whatever') // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                modal.find('.modal-title').text('Update fund request')
                modal.find('.modal-body #fundRequestType').val(reqType)
                modal.find('.modal-body #fundDescription').val('description for fund')
                modal.find('.modal-body #fundAmount').val(amt)
                modal.find('.modal-body #fundExpireDate').val(year+"-"+month+"-"+day)
                modal.find('.modal-body #fundRequestId').val(id)

                $(function(){
                    console.log("test datepicker!");
                    $('#fundExpireDate').datepicker({
                        minDate: new Date(year+"-"+month+"-"+day),
                        maxDate: '+1Y',
                        dateFormat: 'yy-mm-dd'
                    });
                })
            })
        }

        /* Make fund request */
        function updateFundRequest()
        {
            event.preventDefault();
            console.log('this is function!');
            var id = $('#fundRequestId').val();
            var requestType = $('#fundRequestType').val();
            var description = $('#fundDescription').val();
            var amount = $('#fundAmount').val();
            var expireDate = $('#fundExpireDate').val();
            console.log("requestType=>"+requestType);
            console.log("description=>"+requestType);
            console.log("amount=>"+requestType);
            console.log("expireDate=>"+requestType);
            var formData = "UpdateFundRequestServlet?requestType="+requestType+"&description="+description+"&expireDate="+expireDate+"&amount="+amount+"&id="+id;
            console.log(apiUrl+formData);
            $.get(apiUrl+formData,(res)=>{
                console.log(res);
            });
        }
    </script>
