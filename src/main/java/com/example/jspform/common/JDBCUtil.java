package com.example.jspform.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://walab.handong.edu:3306/p3_21800662","p3_21800662","na6Koocee2");
        }catch(Exception e){
            System.out.println(e);
        }
        return con;
    }
}
