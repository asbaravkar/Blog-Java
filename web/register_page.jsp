

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Register</title>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background banner-background" style="padding-bottom:80px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-user-plus fa-2x"></span>
                            <br>
                            Register
                        </div>
                        <div class="card-body">
                            <form id="register-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                  <label for="user_name">Username</label>
                                  <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter username">
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select gender</label><br>
                                  <input type="radio" id="gender" name="gender" value="male">Male
                                  <input type="radio" id="gender" name="gender" value="female">Female
                                </div>
                                <div class="form-group">
                                    <textarea name="about" class="form-control" rows="5" placeholder="Something about you"></textarea>
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password">
                                </div>
                                <div class="form-check">
                                  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                </div>
                                <br>
                                <div class="container" id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h3>Please wait...</h3>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                             </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <!--BootStrap javascripts-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <!--custom javascript-->
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
               console.log("loaded");
               $("#register-form").on("submit",function(event){
                   event.preventDefault();
                   let form = new FormData(this);
                   
                   //spin
                   $('#submit-btn').hide();
                   $('#loader').show();
                   //send to RegisterServlet
                   $.ajax({
                      url:"RegisterServlet",
                      type:"POST",
                      data:form,
                      success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#submit-btn').show();
                        $('#loader').hide();
                        
                        if(data.trim() === "User inserted"){
                            swal("Registered successfull. Redirecting to Login screen").then((value)=>{
                            window.location = "login_page.jsp"
                            });
                        } else {
                            swal(data);
                        }
                    },
                      error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        $('#submit-btn').show();
                        $('#loader').hide();
                        swal("Something went wrong. Please try again.");
                    },
                    processData:false,
                    contentType:false
                   });
               });
            });
        </script>
    </body>
</html>
