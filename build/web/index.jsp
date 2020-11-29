

<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <!--custom css-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        
        <!--font-awesome icons-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!--clip-path css-->
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 92%, 67% 86%, 32% 100%, 0 89%, 0 0);
            }
        </style>
        <title>Blog</title>
    </head>
    <body>
        
        <!--NAVBAR-->
        <%@include file="normal_navbar.jsp" %>
        
        <!--BANNER-->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">A Technical Blog</h3>
                    <p>World of New Technology</p>
                    <button class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span> It's free!</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-sign-in"></span> Login</a>
                </div>
            </div>
        </div>
        <br>
        <!--CARDS-->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary primary-background">Read more</a>
                            </div>
                         </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary primary-background">Read more</a>
                            </div>
                         </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary primary-background">Read more</a>
                            </div>
                         </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary primary-background">Read more</a>
                            </div>
                         </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary primary-background">Read more</a>
                            </div>
                         </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary primary-background">Read more</a>
                            </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!--BootStrap javascripts-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <!--custom javascript-->
        <script src="js/myjs.js" type="text/javascript"></script>
       
    </body>
</html>
