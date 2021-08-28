<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <script src="https://kit.fontawesome.com/a8a31e2970.js" crossorigin="anonymous"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <!--home navbar start-->
        <%@include file="navbar/home-nav.jsp"%>

        <!--home navbar end-->

        <!--main section start-->
        <main>
            <div class="container-fluid main">
                <div class="row ms-md-5 align-content-center h-100">
                    <div class="col-md-8">
                        <div class="h1 p-3 text-center">
                            <span id="text" class="text-warning"></span><span id="cursor" class="ms-2 text-light">|</span>
                        </div>
                        <div class="p-3 my-1">
                            <p class="text-center text-white fs-4">Tutors shares a wealth of knowledge, experience and academic degrees which they have.
                                Parents or student can contact with teacher through offline or online.
                                Student can get highly qualified tutors at affordable prices.</p>
                        </div>
                        <div class="text-center p-2 ">
                            <a href="login.jsp" class="btn btn-primary mx-3">Login</a>
                            <a href="studentMain.jsp" class="btn btn-warning text-white">Search teacher</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <section>
            <!--about section-->
            <div class="container-fluid contact-about mt-3">
                <div class="row justify-content-center">
                    <div class="col-lg-5" id="about">
                        <h1 class="text-center text-warning my-3">About US</h1>
                        <div class="m-3">
                            <a class="text-decoration-none text-uppercase" href="home.jsp"><h2 class="text-white"><span class="text-primary">
                                        <i class="fas fa-graduation-cap me-2"></i></span>Tutor Finder</h2></a>
                            <a href="#" class="fs-4 text-white text-decoration-none p-2"><span><i class="fas fa-envelope me-2"></i></span>priyanshug1999@gmail.com</a>
                            <p class="fs-4 text-white p-2"><span><i class="fas fa-phone me-2"></i></span>0731 342 8158</p>
                            <div class="my-3">
                                <a href="#" class="text-danger p-2"><i class="fab fa-youtube fa-3x"></i></a>
                                <a href="#" class=" p-2 text-danger"><i class="fab fa-instagram fa-3x"></i></a>
                                <a href="#" class="p-2 text-primary"><i class="fab fa-facebook fa-3x"></i></a>
                            </div>

                        </div>
                    </div>

                    <!--contact us--> 
                    <div class="col-lg-5" id="contact">
                        <h1 class="text-center text-warning my-3">Contact US</h1>
                        <div class="m-3">
                            <div class="mb-2">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name">
                            </div>
                            <div class="mb-2">
                                <label for="email" class="form-label">Email</label>
                                <input type="text" class="form-control" id="email">
                            </div>
                            <div class="mb-2">
                                <label for="mob" class="form-label">Contact Number</label>
                                <input type="tel" class="form-control" id="mob">
                            </div>
                            <div class="mb-2">
                                <label for="message" class="form-label">Message</label>
                                <textarea class="form-control" id="message" rows="3"></textarea>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--main section end-->
        <footer>
            <div class="bg-secondary text-white text-center p-1">
                Copyright © www.TutorFinder.com All rights reserved!
            </div>
        </footer>
        <!--javaScript files-->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!--my js file-->
        <script src="js/home.js" type="text/javascript"></script>

    </body>
</html>