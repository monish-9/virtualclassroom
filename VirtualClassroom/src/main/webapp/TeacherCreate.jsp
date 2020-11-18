<%@page import="com.SPASM.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

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
	
<style type="text/css">
	
	.card:hover {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2);
	
	}
	.cl
	{
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2);
	margin-top:9px;
	
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

<div class="container-fluid">

<!-- creation of fixed nav bar -->
		<div class="row">
			<nav class="navbar  navbar-expand navbar-light bg-white border-bottom fixed-top  " style="font-family: sans-serif; font-size: 14px; font-weight: 600;height:66px;">
			
			<div class="col-lg-2  col-md-1  d-none d-sm-none d-md-block d-lg-block">
				<div  class="navbar-brand ">
					
				<%=classname %>
					
				</div>
			</div>
			<div class="offset-lg-2 offset-0 col-lg-7 col-6 col-sm-10 offset-sm-2 col-md-8 offset-md-2 ">
				<nav class="navbar-nav ml-1 ml-sm-5 ml-md-5" >
					<a class="nav-link nav-item "  href="CreateTeacher.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Stream</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="TeacherCreate.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Classwork</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="People.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">People</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="">Grades</a>
				
				</nav>
			</div>
			
			</nav>
		</div>
		
<!-- end of nav bar -->
</div>
<!-- end of first row -->


<div class="container p-2">
<div class="row " style="margin-top:83px;">
<div class="col-12 col-md-8 offset-md-2">
	<div class="btn-group" >
		<button class="btn btn-dark  " type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border-radius:50px;box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1), 0 2px 20px 0 rgba(0, 0, 0, 0.19);">
	    	<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  			<path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
	   		<span class="mr-2 font-weight-bold"> Create</span>
	  	</button>
	  	<div class="dropdown-menu mt-2">
		    <a class="dropdown-item" href="test.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Assignment</a>
		    <a class="dropdown-item" href="CreateTeacher.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Question</a>
		    <a class="dropdown-item" href="CreateTeacher.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Material</a>
		    <div class="dropdown-divider"></div>
		    <a class="dropdown-item" href="CreateTeacher.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Topic</a>
	  	</div>
	</div>
</div>
</div>

<!-- end of 2nd row -->

  <!-- java code -->
  	<% Db_Connection  dbconn=new Db_Connection ();%>
		
		
	<!--database connectivity for select teacher class-->
	<%
			String quary = "select * from assignment where classcode=?";
			
			try {
			Connection con= dbconn.Connection();
			
			System.out.println("connected create teacher..");//connection

			PreparedStatement st = con.prepareStatement(quary);
			st.setString(1, code);
			ResultSet rs = st.executeQuery();

			if (!rs.isBeforeFirst()) {
	%>
		<div>
		
		<%
				out.print("");
		%>
		</div>
		<%} %>
		


<div class="row mt-3">	
	<div class="col-12 col-md-8 offset-md-2 ">  
<!--  <div class="card " style="">
	  	<div class="card-header " style="">
	  		<p id="title" class="text-dark ml-2" style="font-size:16px;"> </p>
	  	</div>
	  		
	  	
	  	
	 	<div class="card-body"> -->
	  		<!-- accordian -->
	  		
	  	
			
			
			<div class="accordion  " id="accordionExample" >
			
				<%
			
				while (rs.next()) {
		%>		<%String id=rs.getString("id") ;
		
		//if(rs.getString("topic")!=null)
		//{
		%>
		
 				<div class="card " name="<%=rs.getString("id") %>" style="border-radius:8px;border:none;">
 				<div class="border-bottom mt-2">
    				<div class="card-header bg-white collapsed " data-toggle="collapse" data-target="#collapse-<%=rs.getString("id") %>" aria-expanded="false" aria-controls="collapse-<%=rs.getString("id") %>" style="height:66px;" id="heading-<%=rs.getString("id") %>">
      					<h5 class="mb-0">
        						<!--<button  class="btn btn-link text-dark" type="button" >
          						
       	 						</button> -->
       	 					
       	 					<span class="text-dark" style="font-family: sans-serif;font-size:17px;font-weight: 550;"><%=rs.getString("title") %> </span>
       	 					<span class="text-muted float-right" style="font-family: sans-serif;font-size:13px;"><%=rs.getString("due_date") %> 
       	 					<%=rs.getString("due_time") %></span>
     	 				</h5>
    				</div>
					</div>
    				<div id="collapse-<%=rs.getString("id") %>" class="collapse" aria-labelledby="heading-<%=rs.getString("id") %>" data-parent="#accordionExample">
	      				<div class="card-body">
	        				
	        				<div class="ml-2 text-muted"  style="font-family: sans-serif;font-size:13px;"> Posted <%=rs.getDate("date").toLocaleString().subSequence(0, 7) %> </div>
	        				
	        				<div class="ml-2 text-dark"  style="font-family: sans-serif;font-size:13px;"> <%=rs.getString("instruction") %> </div>
	        				
	        				<% if(rs.getBlob("assign_file").length()!=0){
    						  	if(rs.getString("assign_file_name").endsWith("pdf")){
    						%>
    						 	
							<a href="view_file.jsp?id=<%=rs.getString("id") %>" style="" class="text-decoration-none text-dark">

								<div class="media mt-3 w-50 border rounded ">
									<i class=" text-decoration-none fa fa-file-pdf-o fa-4x  border p-1" style=""></i>
									<div class="media-body text-truncate mt-3 ml-3">
										
										<%=rs.getString("assign_file_name") %><br>
										pdf

									</div>
								</div>

							</a>
						
							<%
    						 	}
    						 	else if(rs.getString("assign_file_name").endsWith("docx")||rs.getString("assign_file_name").endsWith("doc"))
    						 	
    						 	{
    						 	%>
    						 	
    						 	<a href="view_file.jsp?id=<%rs.getString("id");%>" style="" class="text-decoration-none text-dark">

								<div class="media mt-3 w-50 border rounded ">
									<i class=" text-decoration-none fa fa-file-text fa-4x  border p-1" style=""></i>
									<div class="media-body text-truncate mt-3 ml-3 thumbnail">
										
									<%out.println(rs.getString("assign_file_name"));%><br>
										docx

									</div>
								</div>

								</a>
							
							<%}else if(rs.getString("assign_file_name").endsWith("txt")) {%>
    						 	
    						 	<a href="view_file.jsp?id=<%rs.getString("id");%>" style="" class="text-decoration-none text-dark">

								<div class="media mt-3 w-50 border rounded ">
									<i class=" text-decoration-none fa fa-file-text-o fa-4x  border p-1" style=""></i>
									<div class="media-body text-truncate mt-3 ml-3">
										
										<%out.println(rs.getString("assign_file_name"));%><br>
										txt

									</div>
								</div>

							 </a>
							<%} %>
    						<% } %>
	      				</div>
	      			
	      				<div class="card-footer bg-white">
	      					<a href="">view document</a>
	      				</div>
    				</div>
  				
  				</div>
  <%
		//}
}
rs.close();
st.close();
con.close();
} catch (Exception e) {
e.printStackTrace();
}
		
		
		%>
		
  			</div>
  			
			
			<!-- end of accordian -->



	<!-- 	</div> -->
		
			<!-- end of title card body -->
	<!--  </div>-->
	  
	  <!-- end of title card  -->
	  </div>
</div>

<!-- end of third row  -->	


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
	
<script>
		$(document).ready(function(){
			
		$(".card-header").click(function(){

			var idd=$(".card").attr("name");
			//alert(idd);
			$(".card").toggleClass("cl");
			});



			});
		
		
		
		


</script>

</html>