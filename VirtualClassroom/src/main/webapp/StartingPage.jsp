<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<!-- bootstrap and custom css link -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    
  <link rel="stylesheet" href="style.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
<title>Virtual classroom</title>
</head>
<body>


<!-- html -->
<div class="container-fluid">

<div class="row row1">
	<div class="col-sm-12 ">
		<h1 class="text-center">Welcome to virtual classroom</h1>
	</div>
</div>

<div class="row mt-3">
	<div class="col-sm-2 offset-sm-10">
		<a href="index.jsp"><button>Create</button></a>
		
		<a href="JoinClass.jsp"><button>Join</button></a>
	</div>
</div>
<div class="container ">
	
		<div class="row">

<!-- database connectivity -->
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String sql = "SELECT * FROM teacher";
	try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualclassroom", "root", "");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
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
	
	
		<div class="col-sm-3  mt-4 ">
		
		<div class="container div1">
		<a href="CreateTeacher.jsp?code=<%out.print(rs.getString("classcode"));%>">
		
			<div class="container">
				<%
					out.println(rs.getString("classname"));
				%>
			</div>
		
		<br>
		
		<%
			out.println(rs.getString("section"));
		%>
		</a>
		<br>
		
		<%
			out.println(rs.getString("teachername"));
		%>
		
		<br>
		
		<%
			out.println(rs.getString("subject"));
		%>
		
		<%
			out.println(rs.getString("classcode"));
		%>
		
		<br>
		
		
	
		
		<!--  <a href="CreateTeacher.jsp?code=<%//out.print(rs.getString("classcode"));%>">view</a>-->
		
		</div>
		</div>

	
	

	<%
		}
	%>
		
		
		
		
		
	
	
	
	
	
	<%
	rs.close();
	st.close();
	con.close();

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	
	
	
	
		</div>
	

	</div>
		
</div>
</body>
</html>