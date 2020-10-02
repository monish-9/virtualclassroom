<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.SPASM.model.Teacher"%>
 <%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    
  <link rel="stylesheet" href="style.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
<title><%out.println(request.getParameter("code")); %></title>
</head>
<body>
<!-- get session -->

<%!int flag=0; %>
	
	<%
		if(request.getParameter("code")==null)
		{
			
			response.sendRedirect("StartingPage.jsp");
		}
		
	
	
	%>
	



<div class="container-fluid">

	<div class="cotainer">




<%
String code=request.getParameter("code");
System.out.println("class"+code);
%>





<!--database connectivity-->
	<%
		String quary="select * from teacher where classcode=?";
		Class.forName("com.mysql.cj.jdbc.Driver");
		try{
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualclassroom","root","");
		
			System.out.println("conn");
		
			PreparedStatement st=con.prepareStatement(quary);
			st.setString(1, code);
			ResultSet rs=st.executeQuery();
		
		if (!rs.isBeforeFirst()) {
	%>

		<div>
			<%
				out.print("");
			%>
		</div>


	<%
		}
		while(rs.next())
		{
		%>
			<div class="container div4 mt-5">
			
				<%out.println(rs.getString("classname")) ; %><br>
				
				<%out.println(rs.getString("section")) ;%><br>
				
				class code: <%out.println(rs.getString("classcode")); %><br>
			
			</div>
			<div class="container div3">
				subject: <%out.println(rs.getString("subject")); %><br>
				room: <%out.println(rs.getString("room")); %><br>
			</div>
			
	<%
		}
		
	%>
	
	welcome
	
		<% 
			rs.close();
			st.close();
			con.close();
			}catch(Exception e){e.printStackTrace();}
		%>








	</div>
</div>

</body>
</html>