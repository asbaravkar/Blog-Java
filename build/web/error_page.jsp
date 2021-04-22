

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="true"%>
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
        <title>Error</title>
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" alt="error" class="img-fluid"/>
            <h3 class="display-3">Sorry. Something went wrong. Return to Home</h3>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3"> <span class="fa fa-mail-reply"></span> Home</a>
        </div>
    </body>
</html>
