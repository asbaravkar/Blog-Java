/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Aditya
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            //fetch data
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userName = request.getParameter("user_name");
            String userAbout = request.getParameter("user_about");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();

            //fetch session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setPassword(userPassword);
            user.setName(userName);
            user.setAbout(userAbout);
            String oldImage = user.getProfile();
            user.setProfile(imageName);
            out.println(user.getId());

            //update
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean f = userDao.updateUser(user);
            if (f) {
                
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                String oldPath = request.getRealPath("/") + "pics" + File.separator + oldImage;
                
                if (oldImage.equals("default.png")) {
                    Helper.deleteFile(oldPath);
                }
                {
                    if (Helper.saveFile(part.getInputStream(), path)) {
                        out.println("Updated to db");
                        Message msg = new Message("Updated successfully", "success", "alert-success");
                        
                        s.setAttribute("msg", msg);
                    } else {
                        Message msg = new Message("Something went wrong", "error", "alert-danger");
                        
                        s.setAttribute("msg", msg);
                    }
                }
            } else {
                out.println("Not updated");
                Message msg = new Message("Something went wrong", "error", "alert-danger");
                
                s.setAttribute("msg", msg);
            }
            
            response.sendRedirect("profile.jsp");
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
