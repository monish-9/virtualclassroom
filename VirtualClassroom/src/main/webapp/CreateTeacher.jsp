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
    
  <link rel="stylesheet" href="Custom CSS/CreateTeacher.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
<title><%out.println(request.getParameter("classname")); %></title>
</head>
<body>
<!-- get session -->
	<%
		if(request.getParameter("code")==null)
		{
			
			response.sendRedirect("StartingPage.jsp");
		}
	%>
	

<div class="container-fluid">
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
		<div class="container  pl-md-5 pr-md-5">
			<div class="container  bg-primary  mt-5 shadow-sm first-div-radius" id="div1" style="height:220px;">
			
				<h5 class="text-white"><%out.println(rs.getString("classname")) ; %></h5>
				
				<p class="text-white"><%out.println(rs.getString("section")) ;%></p>
				
				<div class="d-inline-block"><p class="text-white">class code </p></div>

				<div class="d-inline-block"><p class="text-white"><%out.println(rs.getString("classcode")); %></p></div>
					
					
				
				
				<div class="text-center">
				
					<div class="text-white fa fa-chevron-down"  id="down-arrow" style="cursor: pointer;margin-top:70px;"></div>
					
				</div>
							
			</div>
			
			
			<div class="container bg-white shadow-sm" id="div2" style="display: none;">
				<div class="d-inline-block"><p class="text-black">subject:</p></div>
				<div class="d-inline-block"><p class="text-black"> <%out.println(rs.getString("subject")); %></p></div>
				<br>
				<div class="d-inline-block"><p class="text-black">room:</p></div>
				<div class="d-inline-block"><p class="text-black"><%out.println(rs.getString("room")); %></p></div>
			</div>
			</div>
	<%}%>
	<div class="container mt-4 " >
		<div class="row">
			<div class="col-md-3 col-sm-12 pl-md-5">
				<div class="container  shadow-sm first-div-radius d-md-block d-none d-sm-none "  style="border:1px solid grey;height:130px;">
					<h6 class="text-black  ">Upcoming</h6>
					<p class="text-dark position-static ">no work due soon</p>
					<div class="clearfix ">
						<h6 class="float-right text-black "  ><a href="#">View all</a></h6>
			
					</div>
				</div>
			 </div>
			 
			 <div class="col-md-9 pr-md-5 col-12">
			 	<div class="container-sm  shadow first-div-radius  p-3 " style="height:70px;" id="text">
					<p class="text-gray ml-5 ">say something with your class...	</p>
			
				</div>
				
				<!-- post manupulation -->

					
					
					<div class="container shadow first-div-radius p-4" style="display: none;" id="post">
						<p>for</p>
						<div>
						<form action="PostSrevlet" class="form-group">
						<textarea class="form-control" placeholder="Share with your class"  rows="10" name="share" style="height: 100px;"></textarea>
						<ul>
							<li>Link</li>
							<li>file</li>
						</ul>
						
						
						<div class="btn-group  ml-4 d-inline-block">
						   <button type="button" class="btn btn-dark">Post</button>
						    <button type="button" class="btn btn-dark dropdown-toggle dropdown-toggle-split" id="dropdownMenuReference" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-reference="parent">
						      <span class="sr-only">Toggle Dropdown</span>
						    </button>
						    <div class="dropdown-menu " aria-labelledby="dropdownMenuReference">
						      <a class="dropdown-item" href="#">Post</a>
						      <a class="dropdown-item" href="#">Schedule</a>
						     
						   </div>
						    
						  </div>
						
						  </form>
						   <button class="btn btn-light "  id="close">close</button>
						</div>
						
					</div>


			<!-- end -->
			
					<div class="container mt-4  shadow first-div-radius  p-3 mb-3"  style="border:1px solid grey;height:230px;">
					<h3>Communicate with your class here</h3>

					<h6>Create and schedule announcements</h6>
					<h6>Respond to student posts</h6>
				</div>
			 
			 
			
			 
			 
		</div>
	
	</div>
	
	
	
	</div>
	
		






		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<% 
			rs.close();
			st.close();
			con.close();
			}catch(Exception e){e.printStackTrace();}
		%>

	
</div>

</body>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	
  	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous"></script>
  	
  	<script type="text/javascript">

  	$(document).ready(function(){

			$("#down-arrow").click(function()
			{
				$("#div2").toggle();
				$("#div1").toggleClass("container-fluid > container  second-div-radius");
				$("#down-arrow").toggleClass(" container-fluid > container> text-center> fa fa-chevron-up")
				 //$("#up").children('.fa').toggleClass('fa-chevron-up fa-chevron-down');
			});





  			$("#text").click(function(){

  				$("#post").show();
  				$("#text").hide();
  			})

  			$("#close").click(function(){

  				
  				$("#post").hide();
  				$("#text").show();
  			})

		});














  	</script>
  
</html>

