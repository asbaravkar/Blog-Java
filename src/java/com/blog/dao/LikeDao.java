/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.dao;

/**
 *
 * @author Aditya
 */
import java.sql.*;

public class LikeDao {
    
    Connection con; 

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean insertLike(int pid, int uid) {
        
        boolean f=false;
        
        try {
            
            String q="insert into liked (pid, uid) values (?,?)";
            PreparedStatement p=this.con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public int countLikeOnPost(int pid) {
        int count=0;
        
        try {
            
            String q="SELECT COUNT(*) FROM liked WHERE pid=?";
            PreparedStatement p=this.con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet s=p.executeQuery();
            if(s.next()) {
                count=s.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
    
    public boolean isLikedByUser(int pid, int uid) {
        boolean f=false;
        
        try {
            String q="SELECT * FROM liked WHERE pid=? AND uid=?";
            PreparedStatement p=this.con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet s=p.executeQuery();
            if(s.next()) {
                f=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public boolean deleteLike(int pid, int uid) {
        boolean f=false;
        
        try {
            PreparedStatement p=this.con.prepareStatement("DELETE FROM liked WHERE pid=? AND uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}
