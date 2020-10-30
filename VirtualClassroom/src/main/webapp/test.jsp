<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
					
					<!--database connectivity-->
		<%
			String quary = "select * from test1 where classcode=2";
				Class.forName("com.mysql.cj.jdbc.Driver");
				try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

			System.out.println("conn");

			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(quary);

			if (!rs.isBeforeFirst()) {
		%>

		<div>
			<%
				out.print("");
			%>
		</div>


		<%
			}
		while (rs.next()) {
		%>
		
		
		<div class="container" style="border:1px solid">
		
		<h5 class="text-white">
					<%
						out.println(rs.getString("post"));
					%>
				</h5>
		</div>
		
		<%} %>
		
		
				<%
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>	
					
					


</body>
</html>