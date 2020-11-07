package com.SPASM.DAO;

import java.sql.*;


public class Db_Connection 
{
	 private  String url="jdbc:mysql://localhost:3306/virtualclassroom";
	 private  String username="root";
	 private  String password="";
    public Connection Connection()
    {
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
           
            Connection myConnection = DriverManager.getConnection(url,username,password);
            
            return myConnection;
        } catch (Exception ex) {}
        return null;
    }
}
