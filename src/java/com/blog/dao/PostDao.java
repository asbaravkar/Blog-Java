/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.dao;

import com.blog.entities.Category;
import com.blog.entities.Post;

import java.util.ArrayList;
import java.sql.*;
import java.util.List;

/**
 *
 * @author Aditya
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            PreparedStatement pstmt = con.prepareStatement(q);
            ResultSet set = pstmt.executeQuery(q);

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean flag = false;

        try {
            String q = "insert into posts (pTitle, pContent, pCode, pPic, catId, userId) values (?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId()); // userId problem - not able to fetch properly
            pstmt.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

//    get all post
    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        try {
            String q = "select * from posts order by pid desc";
            PreparedStatement pst = con.prepareStatement(q);
            ResultSet set = pst.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    return list of post - getPostby Cat id
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        try {
            String q = "select * from posts where catId=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, catId);
            ResultSet set = pst.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostByPostId(int postId) {
        Post p=null;
        try {
            String q = "select * from posts where pid=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, postId);
            ResultSet s=pstmt.executeQuery();
            if(s.next())
            {
                
                int pid = s.getInt("pid");
                String pTitle = s.getString("pTitle");
                String pContent = s.getString("pContent");
                String pCode = s.getString("pCode");
                String pPic = s.getString("pPic");
                Timestamp date = s.getTimestamp("pDate");
                int cid=s.getInt("catId");

                int userId = s.getInt("userId");
                p = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

}
