<%@page import="com.SPASM.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    



<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view filw</title>
</head>
<body>


    
        
        <%  
            String id=request.getParameter("id");
            System.out.println(id+"vi");
            Blob file = null;
            byte[ ] fileData = null ;
           
            try
            {    
            	 Db_Connection  dbconn=new Db_Connection () ;
                Connection conn= dbconn.Connection();
            
                String sqlString = "SELECT file FROM upload WHERE id = '"+id+"'";
                Statement myStatement = conn.createStatement();
                
                ResultSet rs=myStatement.executeQuery(sqlString);
               out.clear();
                if (rs.next()) 
                {
                    file = rs.getBlob("file");
                    fileData=file.getBytes(1, (int)file.length());
                  
                } 
                response.reset();
                response.setContentType("*/*; charset = utf-8");
                request.setCharacterEncoding("UTF-8");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(fileData.length);
                
                response.getOutputStream().write(fileData);
                
                
                response.getOutputStream().flush();
                response.getOutputStream().close();
                myStatement.close();
                rs.close();
                if(true) return;
            } catch (Exception ex) {} 
           
        %>
        
      
        
    
</body>
</html>