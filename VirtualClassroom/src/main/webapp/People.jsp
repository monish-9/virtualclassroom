<%@page import="com.SPASM.DAO.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="Custom CSS/CreateTeacher.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
<title><%
		out.println(request.getParameter("classname"));
	%></title>
</head>
<body>
<%
		if (request.getParameter("code") == null) {
			

		response.sendRedirect("CreateTeacher.jsp");
	}
	%>

<!-- declaration.... -->
<%!//int i; String com;String dt;%>

	
		<%
			
		String code = request.getParameter("code");
		String classname=request.getParameter("classname");
		
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		System.out.println("classcode in People.jsp:" + code);
		%>
			<!-- creationj of fixed nav bar -->
		
			<nav class="navbar  navbar-expand navbar-light bg-white border-bottom fixed-top justify-content-center " style="font-family: sans-serif; font-size: 14px; font-weight: 600;height:66px;">
			
				<a href="#" class="navbar-brand">
					
				<%=classname %>
					
				</a>
				
				<nav class="navbar-nav p-5" >
					<a class="nav-link nav-item "  href="CreateTeacher.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>">Stream</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="">Classwork</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="People.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>">People</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="">Grades</a>
				
				</nav>
			
			
			</nav>


 <% Db_Connection  dbconn=new Db_Connection () ;%>
	 <!--database connectivity for post msg-- "SELECT id,post,date FROM upload WHERE classcode=?"-->
		<%
			String sql ="select * from student_class inner join teacher on student_class.scode=teacher.classcode where classcode=?" ;
			
				//Class.forName("com.mysql.cj.jdbc.Driver");
				try {
			//Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualclassroom", "root", "");

			Connection con= dbconn.Connection();
			PreparedStatement s=con.prepareStatement(sql);
			
			s.setString(1,code);
			
			ResultSet r=s.executeQuery();
			

			if (!r.isBeforeFirst()) {
		%>
		<div>
			<%
				out.print("");
			%>
		</div>


		<%
			}
		%>
		<div class="container   p-5 "  style="height: 220px;width:50vw;margin-top:86px;"> 
		<div class="container p-2 " style="border-bottom:2px solid #5cb85c;">
		<h3 class="text-success">Teacher</h3>
		</div>
		<div class="container p-2 text-muted">
		<span class="fa fa-user-circle fa-2x float-left " style="line-height:40px;color:gray;" aria-hidden="true"></span>
		<div class="container p-2 " style="margin-left:37px;">	
		
		
		<%
			r.next();
		out.println(r.getString("name"));%>
		</div>
			
			</div>
			
			
			<div class="container p-2 " style="border-bottom:2px solid #5cb85c;">
		<h3 class="text-success">Student</h3>
		</div>
			<div class="container p-2 text-muted">
			<div class="container border-bottom p-2" >
							<span class="fa fa-user-circle fa-2x float-left " style="line-height:40px;color:gray;" aria-hidden="true"></span>
		<div class="container  p-2" style="margin-left:37px;">	<%
			out.println(r.getString("sname"));%></div></div><%
						while (r.next()) {
						
							
							
							%>
							
							<div class="container border-bottom p-2" >
							<span class="fa fa-user-circle fa-2x float-left " style="line-height:40px;color:gray;" aria-hidden="true"></span>
				<div class="container p-2" style="margin-left:37px;">	<% 	out.println(r.getString("sname"));%></div></div>
					<% 
						}
					%>
					
					</div>
					</div>
			<%
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>	
</body>
</html>