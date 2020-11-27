<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	

<style>
.n:hover{

background:rgb(0,0,255,0.3);
	cursor:pointer;
}


</style>
<title><%out.println(request.getParameter("classname"));%></title>

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
<div class="conatainer-fluid">
		<!-- creation of fixed nav bar -->
		<div class="row">
			<nav class="navbar  navbar-expand navbar-light bg-white border-bottom fixed-top  " style="font-family: sans-serif; font-size: 14px; font-weight: 600;height:66px;">
			
			<div class="col-lg-2  col-md-1  d-none d-sm-none d-md-block d-lg-block">
				<div  class="navbar-brand ">
					
				<%=classname %>
					
				</div>
			</div>
			<div class="offset-lg-3 offset-0 col-lg-7 col-6 col-sm-10 offset-sm-2 col-md-8 offset-md-2 ">
				<nav class="navbar-nav ml-1 ml-sm-5 ml-md-5 " >
					<a class="nav-link nav-item n"  href="CreateTeacher.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Instruction</a>&nbsp&nbsp
					<a class="nav-link nav-item n" href="TeacherCreate.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Student work</a>&nbsp&nbsp
					
				
				</nav>
			</div>
			
			</nav>
		</div>
		
		<!-- end of nav bar -->
	</div>
	
	<div class="container-fluid" style="margin-top:83px;">
		<div class="row border-bottom pb-3">
			<div class="col-1 offset-1">
			
			<button class="btn btn-primary">Return</button>
			</div>
			
			<div class="col-1 offset-1">
			<div class="input-group">
		    	
		    		<input type="text"  name="points" class="form-control w-25" id="exampleInputPassword1" style=" resize:none;overflow:hidden;background:#EDEDED;outline:none;border:none;border-bottom:1px solid black;box-shadow: none!important;border-radius:0px;">
		    		<div class="bar"></div>
	  			</div>
			</div>
		</div>
	
	<div class="row">
		<div class="col-4  border-right" style=" height:475px;">
		
		
		
		</div>
	
		<div class="col-8">
			
			<div class="row" style="font-size:27px;font-weight: 550;">
			<p class="ml-3">java</p>
			</div>
	        					
	        					
	        					
	        					<div class="row ">
	        						<div class="col-1 border-right ml-3">
	        						
	        							<div class="row">
	        							<p class="ml-2 text-dark"  style="font-size:37px;font-weight: 550;">0</p>
	        							</div>
	        							<div class="row">
	        								<p class="ml-2 text-muted"  style="font-size:12px;">Turned in</p>
	        							</div>
	        							
	        						</div>
	        						
	        						
	        							<div class="col-1 ml-2 ">
	        								
	        								<div class="row">
	        									<p class="ml-2 text-dark"  style="font-size:37px;font-weight: 550;">0</p>
	        								</div>
	        								<div class="row">
	        									<p class="ml-2 text-muted" style="font-size:12px;">Assigned</p>
	        								</div>
	        								
	        							</div>
	        						
	        						</div>
	        					
	        					
	        				
		
		
		
		</div>
	
	
	
	
	
	
	</div>
	
	
	
	
	
	
	</div>
	
	
	
	
	
	
	
	
	
	
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

</html>