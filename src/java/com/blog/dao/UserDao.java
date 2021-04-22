
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
    
    public User getUserByEmailAndPassword(String email, String password){
        User user = null;
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1,email);
            pstmt.setString(2,password);
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                user = new User();
                //data from db
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("register_date"));
                user.setAbout(set.getString("about"));
                user.setProfile(set.getString("profile"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    
    //update
    public boolean updateUser(User user){
        boolean f=false;
        try {
            String q="update user set name=?, email=?, password=?,gender=?, about=?, profile=? where id=?"; 
            PreparedStatement p =con.prepareStatement(q);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
            p.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
    public User getUserByUserId(int userId)
    {
        User user=null;
        
        try {
            
            String q="select * from user where id=?";
            PreparedStatement pstmt=this.con.prepareStatement(q);
            pstmt.setInt(1, userId);
            ResultSet set=pstmt.executeQuery();
            if(set.next())
            {
                user = new User();
                //data from db
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("register_date"));
                user.setAbout(set.getString("about"));
                user.setProfile(set.getString("profile"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
}

