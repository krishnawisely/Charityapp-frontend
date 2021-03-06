<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <a class="navbar-brand" href="#">CharityApp</a>
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="?pagePath=adminHomePage.jsp">Home</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="?pagePath=fundRequest.jsp">Rise fund request</a>
                </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="?pagePath=donorList.jsp">List donor</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="?pagePath=updateFundRequest.jsp">Update request</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="?pagePath=listFundedDonor.html">List Funded Donors</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
                    <div class="dropdown-menu" aria-labelledby="dropdownId">
                        <a class="dropdown-item" href="#" onclick="logout()">Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>