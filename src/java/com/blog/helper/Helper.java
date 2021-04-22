/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Aditya
 */
public class Helper {

    public static boolean deleteFile(String path) {
        boolean f = false;

        try {

            File file = new File(path);

            f = file.delete();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public static boolean saveFile(InputStream is, String path) {
        boolean f = false;

        try {

            byte b[] = new byte[is.available()];

            is.read(b);

            FileOutputStream file = new FileOutputStream(path);

            file.write(b);

            file.flush();
            file.close();
            f= true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
