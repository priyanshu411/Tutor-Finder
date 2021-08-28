

<nav class="navbar navbar-expand-lg text-uppercase shadow sticky-top mynav">
    <div class="container">
        <a class="navbar-brand" href="home.jsp"><h3 class="text-white"><span class="text-primary"><i class="fas fa-graduation-cap me-2"></i></span>Tutor Finder</h3></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span>&#9776;</span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-lg-flex d-inline-block">
                <li class="nav-item">
                    <a class="nav-link" href="student_profile.jsp"><span><i class="fas fa-user-tie me-1"></i><%= (String)session.getAttribute("name") %></span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="studentMain.jsp"><span><i class="fas fa-search me-1"></i>Search</span></a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="stu_changePass.jsp"><span><i class="fas fa-lock me-1"></i>Change Password</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user/logout.jsp"><span><i class="fas fa-sign-out-alt me-1"></i></span>Logout</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="home.jsp"><span><i class="fas fa-home me-1"></i></span>Home</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
