 <div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
        <div class="col-md-6 col-lg-3 text-center" style="box-shadow: 5px 8px 18px -8px rgba(0,0,0,0.5);border-radius:10px">
                  
            <h5 class="text-secondary" style="padding: 10px 0">Donor Register</h5>
            
            <!-- <form onsubmit="donorRegister()"> -->
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    Name
                                </div>
                            </div>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Name"/>
                        </div>
                    </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Email
                            </div>
                        </div>
                        <input type="email" name="email" id="email" class="form-control" placeholder="Email" required/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Password
                            </div>
                        </div>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                    </div>
                </div>
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    DOB
                                </div>
                            </div>
                            <input type="date" name="dob" id="dob" class="form-control"/>
                        </div>
                    </div>
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    Gender
                                </div>
                            </div>
                            <label for="">Male</label>
                            <input type="radio" name="gender" value="male" id="male" class="form-control" required/>
                            <label for="">Female</label>
                            <input type="radio" name="gender" value="female" id="female" class="form-control" required/>
                        </div>
                    </div>
                <button onclick="donorRegister()" type="submit" class="btn btn-outline-secondary">Register</button>
                <p>Already have an account <a href="donorLogin.jsp">Click here</a>.</p>
            <!-- </form> -->
        </div>
    </div>