<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>

<div class="row">

<%

    PostDao d=new PostDao(ConnectionProvider.getConnection());
    List<Post> posts=null;
    int cid=Integer.parseInt(request.getParameter("cid"));
    if(cid==0){
         posts=d.getAllPost();
         
    } else {
        posts=d.getPostByCatId(cid);
    }
    
    if(posts.size()==0)
    {
        out.println("<h3 class='display-3 text-center'>No post in this category ...<h3>");
        return;
    }
    
    for(Post p:posts)
    {
        
        %>

        <div class="col-md-6 mt-2">
            
            <div class="card">
                <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="No image"/>
                <div class="body mt-3">
                    
                    <b><%= p.getpTitle() %></b>
                    <p><%= p.getpContent() %></p>
                    <hr>
                    
                    
                </div>
                    
                    <div class="card-footer text-center primary-background">
                        
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                        <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                        
                    </div>
                
            </div>
            
        </div>

        <%
        
    }   

%>
</div>