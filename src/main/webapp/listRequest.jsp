<!-- Content start -->
	<div class="row justify-content-center">
		<div class="col-md-4">
		<div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<div class="input-group-text">
						Request Type
					</div>
				</div>
			
				<select id="requestType"
						class="form-control" onchange="listRequest()">
						<option>--SELECT--</option>
						<option value="EDUCATION">Education</option>
						<option value="FOOD">Food</option>
						<option value="MEDICAL">Medical</option>
						<option value="AGRICULTURE">Agriculture</option>
						<option value="OTHERS">Others</option>
					</select>
			</div>
		</div>
		</div>
		<div class="w-100"></div>
		<div class="col-md-8">
			<div class="alert alert-success alert-dismissible fade show"
				id="transactionStatus" style="display: none;" role="alert">
				<i id="responseMessage"></i>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
			<div class="alert alert-warning alert-dismissible fade show"
				id="errorStatus" style="display: none;" role="alert">
				<i id="errorMessage"></i>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<table id="listRequest" class="table" style="">
				<thead>
					<tr>
						<th>Request Type</th>
						<th>Description</th>
						<th>Amount</th>
						<th>Expire Date</th>
						<th>Pay Amount(Rs)</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody id="requestTable">

				</tbody>
			</table>
		</div>
	</div>
	<script src="asserts/js/donorjs/listRequest.js"></script>
	<!-- Content end -->