<%@page import="java.text.DateFormat"%>
<%@page import="com.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.sun.jdi.connect.spi.Connection"%>
<%@page import="com.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%></title>
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

            .post-title{
                font-weight: 100;
                font-size: 30px;
            }

            .post-content{
                font-weight: 100;
                font-size: 25px;

            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
            body{
                background: url(img/bg.jpg);
                background-attachment: fixed;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <script src="js/myjs.js" type="text/javascript"></script>


        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a href="index.jsp" class="navbar-brand" href="#"> <span class="fa fa-bolt"></span> BoltBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register_page.jsp"> <span class="fa fa-user-plus"></span> Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> <span class="fa fa-eye"></span> About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-asterisk"></span> Add Post</a>
                    </li>

                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profileModal"> <span class="fa fa-circle"></span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-eye"></span> Logout</a>
                    </li>



                </ul>
            </div>
        </nav>
        <!--end of navbar-->


        <!--start of main content body-->


        <div class="conatiner">

            <div class="row my-2">

                <div class="col-md-8 offset-md-2">

                    <div class="card-header primary-background text-white">

                        <h4 class="post-title"><%= p.getpTitle()%></h4>



                    </div>

                    <div class="card-body">
                        <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic()%>" alt="No image"/>
                        <p class="post-content"><%= p.getpContent()%></p>

                        <div class="row my-3 row-user">
                            <div class="col-md-8">

                                <!--user dao object-->
                                <%

                                    UserDao u = new UserDao(ConnectionProvider.getConnection());
                                %>

                                <p class="post-user-info"><a href="#!"> <%= u.getUserByUserId(p.getUserId()).getName()%></a></p>
                            </div>
                            <div class="col-md-4">
                                <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                            </div>
                        </div>

                        <br><!-- comment -->

                        <div class="post-code">
                            <pre><%= p.getpCode()%></pre>
                        </div>

                    </div>

                    <div class="card-footer primary-background">
                        <a href="#!" onclick="doLike(<%= p.getPid()%>, <%= user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>

                    </div>

                </div>


            </div>


        </div>



        <!--end of main content body-->




        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-white primary-background">
                        <h5 class="modal-title" id="exampleModalLabel"> Blog </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width: 150px;">

                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>

                            <!--//details-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID</th>
                                            <td> <%= user.getId()%> </td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About</th>
                                            <td colspan="2"><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on</th>
                                            <td colspan="2"><%= user.getDateTime()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3>Please edit carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td> <input class="form-control" type="email" name="user_email" value="<%= user.getEmail()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td>Name</td>
                                            <td> <input class="form-control" type="text" name="user_name" value="<%= user.getName()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td>Password</td>
                                            <td> <input class="form-control" type="password" name="user_password" value="<%= user.getPassword()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td>Gender</td>
                                            <td> <%= user.getGender()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About</td>
                                            <td> 
                                                <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%></textarea>   
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Profile picture</td>
                                            <td> 
                                                <input class="form-control" type="file" name="image" />
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button class="btn btn-outline-primary" type="submit">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of profile modal-->


        <!--start of post modal-->


        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Create your Post</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">

                                <select class="form-control" name="cid">
                                    <option selected disabled>--- Select Category ---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>

                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>

                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" placeholder="Write post content" class="form-control" rows="5"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" placeholder="Mention code if any" class="form-control" rows="5"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select Images</label>
                                <br>
                                <input type="file" name="pic" />
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!--end of post modal-->


        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous"></script>
        <!--custom javascript-->
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
                            $(document).ready(function () {

                                let editStatus = false;

                                $('#edit-profile-btn').click(function () {

                                    if (editStatus == false)
                                    {
                                        $('#profile-details').hide();
                                        $('#profile-edit').show();
                                        editStatus = true;
                                        $(this).text("Back");
                                    } else
                                    {
                                        $('#profile-details').show();
                                        $('#profile-edit').hide();
                                        editStatus = false;
                                        $(this).text("Edit");
                                    }

                                });
                            })
        </script>

        <!--add post js-->
        <script>
            $(document).ready(function () {

                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();


                    //capturing form
                    let form = new FormData(this);

                    //requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //when success
                            console.log(data);
                            if (data.trim() == "Done")
                            {
                                swal("Good job!", "Saved successfully !", "success");
                            } else {
                                swal("Error!", "Something went wrong. Try again.", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //when error
                            swal("Error!", "Something went wrong. Try again.", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })


        </script>

        <!--like functionality script-->
        <script>
            function doLike(pid, uid) {
                console.log(pid + " " + uid)

                const d = {
                    uid: uid,
                    pid: pid,
                    operation: 'like'
                }

                $.ajax({
                    url: 'LikeServlet',
                    data: d,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data)
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data)
                    }
                })
            }
        </script>
    </body>
</html>
