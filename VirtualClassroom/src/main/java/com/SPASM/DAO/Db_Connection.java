package com.SPASM.DAO;

import java.sql.*;


public class Db_Connection 
{
    public Connection Connection()
    {
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String TechWorld3g_2 = "jdbc:mysql://localhost:3306/virtualclassroom";
            Connection myConnection = DriverManager.getConnection(TechWorld3g_2,"root","");
            
            return myConnection;
        } catch (Exception ex) {}
        return null;
    }
}
