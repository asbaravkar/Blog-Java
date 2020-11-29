
package com.blog.dao;
import java.sql.*;
import com.blog.entities.User;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user into database
    public boolean SaveUser(User user){
        boolean check = false;
        try{
            String query = "insert into user (name, email, password, gender, about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.executeUpdate();
            check = true;
            
        } catch(Exception e){
            e.printStackTrace();
        }
        return check;
    }
}

