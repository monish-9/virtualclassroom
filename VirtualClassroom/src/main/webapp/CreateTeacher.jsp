<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.SPASM.model.Teacher"%>
<%@page import="java.sql.*"%>

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

<title>
	<%
		out.println(request.getParameter("classname"));
	%>
</title>
</head>
<body>
	<!-- get session -->
	<%
		if (request.getParameter("code") == null) {
			

		response.sendRedirect("StartingPage.jsp");
	}
	%>

<%!String text;
int i;%>
	<div class="container-fluid">
		<%
			
		String code = request.getParameter("code");
		String classname=request.getParameter("classname");
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		System.out.println("classcode in CreateTeacher.jsp:" + code);
		%>
		<!--database connectivity-->
		<%
			String quary = "select * from teacher where classcode=?";
				Class.forName("com.mysql.cj.jdbc.Driver");
				try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualclassroom", "root", "");

			
			
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


		<%
			}
				while (rs.next()) {
		%>
		<div class="container  pl-md-5 pr-md-5">
			<div class="container  bg-primary  mt-5 shadow-sm first-div-radius"
				id="div1" style="height: 220px;">

				<h5 class="text-white">
					<%
						out.println(rs.getString("classname"));
					%>
				</h5>

				<p class="text-white">
					<%
						out.println(rs.getString("section"));
					%>
				</p>

				<div class="d-inline-block">
					<p class="text-white">class code</p>
				</div>

				<div class="d-inline-block">
					<p class="text-white">
						<%
							out.println(rs.getString("classcode"));
						%>
					</p>
				</div>




				<div class="text-center">

					<div class="text-white fa fa-chevron-down" id="down-arrow"
						style="cursor: pointer; margin-top: 70px;"></div>

				</div>

			</div>

                                <!-- end -->
                                
			<div class="container bg-white shadow-sm" id="div2"
				style="display: none;">
				<div class="d-inline-block">
					<p class="text-black">subject:</p>
				</div>
				<div class="d-inline-block">
					<p class="text-black">
						<%
							out.println(rs.getString("subject"));
						%>
					</p>
				</div >
				<br>
				<div class="d-inline-block">
					<p class="text-black">room:</p>
				</div>
				<div class="d-inline-block">
					<p class="text-black">
						<%
							out.println(rs.getString("room"));
						%>
					</p>
				</div>
			</div>
		</div>
		
					 <!-- end -->
		
		<div class="container mt-4 ">
			<div class="row">
				<div class="col-md-3 col-sm-12 pl-md-5">
					<div
						class="container  shadow-sm first-div-radius d-md-block d-none d-sm-none "
						style="border: 1px solid grey; height: 130px;">
						<h6 class="text-black  ">Upcoming</h6>
						<p class="text-dark position-static ">no work due soon</p>
						<div class="clearfix ">
							<h6 class="float-right text-black ">
								<a href="#">View all</a>
							</h6>

						</div>
					</div>
				</div>
 						 <!-- end -->
 						 
				<div class="col-md-9 pr-md-5 col-12">
					<div class="container-sm  shadow first-div-radius  p-3 "
						style="height: 70px;" id="text_something">
						<p class="text-gray ml-5 ">say something with your class...</p>

					</div>
					
					
					
					
					
					
					
						<!--database connectivity for post msg-->
		<%
			String sql = "SELECT id,post FROM upload WHERE classcode=?";
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				try {
			Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualclassroom", "root", "");

			
			PreparedStatement s=co.prepareStatement(sql);
			
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
			
			
				<!-- post msg and file upload manupulation in form -->



					<div class="container shadow first-div-radius p-4"
						style="display: none;" id="post_something">
						<p>for</p>
						<div>

							<form  method="post" id="post_text">
								<div class="form-group">
								<textarea class="form-control" id="msg_post"
									placeholder="Share with your class" rows="10" name="msg"
									style="height: 100px;"></textarea>
								</div>
								

							</form>
							<button type="submit" class="btn btn-dark" id="post_btn" onclick="servletCall('post')">Post</button>
							<button class="btn btn-light " id="close_btn">close</button>
						</div>

					</div>


					<!-- end -->
			
			
			
			
			<%
																while (r.next()) {
																	//text=rs.getString("post");
																	i=r.getInt("id");
															%>
		
			<!-- design card for upload msg and file -->
					
					
					    
					 <div class="comment" id="<%out.println(i);%>">
						<ul class="list-group mt-4">
					  
    						<li class="list-group-item"> <%out.println(r.getString("post"));%></li>
    				
    				
						
						
						
						
						
						
						<!--database connectivity for comment-->
		<%
			String sql1 = "SELECT comment FROM upload_comment WHERE msg_id=?";
				Class.forName("com.mysql.cj.jdbc.Driver");
			try {
			Connection co1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualclassroom", "root", "");

			
			PreparedStatement s1=co1.prepareStatement(sql1);
				//PreparedStatement p=co.prepareStatement(sql1);
			s1.setInt(1, i);
			   //p.setString(1,code);
			ResultSet r1=s1.executeQuery();
			    //ResultSet o=p.executeQuery();

			if (!r1.isBeforeFirst()) {
		%>

		<div>
			<%
				out.print("");
			%>
		</div>


		<%
			}
			%>
						
					<%
		while (r1.next()) {
		%>
						
						
						
						
    				<li class="list-group-item"> <%out.println(r1.getString("comment"));%></li>
					 
					
					<%} %>
					
					<!-- from for reply -->
					  <li class="list-group-item rep"> 
    				   <form >
						  <div class="input-group" >
						
						
						  <textarea class="form-control md-textarea"  aria-label="With textarea" style="height:3vw;border-radius:50px 0px 0px 50px;" id="cmnt" ></textarea>
						  <div class="input-group-prepend  ">
    						<a id="reply" name="<%out.println(i); %>" class="link-reply input-group-text bg-white"  style="height:3vw;border-radius:0px 50px 50px 0px;"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>
  						</div>
						</div>
						 </form>
						 
						<!-- <form >
						 <div class="input-group" >
						<div id="first" style="margin-top:30px;">
						<textarea class="form-control md-textarea"  aria-label="With textarea" style="height:3vw;border-radius:50px 0px 0px 50px;" id="cmnt" ></textarea>
						
						<div class="input-group-prepend  ">
						<a class="link-reply input-group-text bg-white" id="reply" name="<%//out.println(i); %>"  style="height:3vw;border-radius:0px 50px 50px 0px;"><i  class="fa fa-paper-plane-o"  id=<%//out.println(rs.getInt("id")); %> aria-hidden="true"></i></a>
						</div>
						</div>
						</form>-->

						</li>
					
					
					
					
				</ul>
				</div>
			<%
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>	
				
		<!-- end  -->
		
		
		<%} %>
		
		
				<%
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>	

				
					
					
				
					
					
					<div id ="previous_content" class="container mt-4  shadow first-div-radius  p-3 mb-sm-3"
						style="border: 1px solid grey; height: 230px;">
						<h3>Communicate with your class here</h3>

						<h6>Create and schedule announcements</h6>
						<h6>Respond to student posts</h6>
					</div>





				</div>

			</div>
	<%
			}
		%>

		</div>

		

<%
			rs.close();
		st.close();
		con.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		
		
		
	


		
	

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

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#down-arrow")
								.click(
										function() {
											$("#div2").toggle();
											$("#div1")
													.toggleClass(
															"container-fluid > container  second-div-radius");
											$("#down-arrow")
													.toggleClass(
															" container-fluid > container> text-center> fa fa-chevron-up")
											//$("#up").children('.fa').toggleClass('fa-chevron-up fa-chevron-down');
										});

						$("#text_something").click(function() {

							$("#post_something").show();
							$("#text_something").hide();
						})

						$("#close").click(function() {

							$("#post_something").hide();
							$("#text_something").show();
						})

						$("#post_btn").click(function() {

							$("#previous_content").remove();
							
						})
						
							$("a#reply")
														.one(
																"click",
																function() {
																	//$(".rep").remove();                                                                                          
																	var comCode = $(this).attr(
																			"name");
																	var parent = $(this).parent();
																	var data = "<br> <form action='ReplyServlet' method='post' id='post_text'><textarea class='form-text' name='new-reply' id='new-reply' rows='2' style='width:550px;height:50px;' ></textarea><input type='hidden' name='code' value='"+comCode+"'><input type='submit'  value='reply'></form>";
																	parent.append(data);
																	
																	
																	alert(comCode);

																});
															
											
					

					});


			//call PostServlet using js
			
			
			function servletCall(methodType)
			{
				
				document.getElementById("post_text").action="PostServlet";
				document.getElementById("post_text").method=methodType;
				document.getElementById("post_text").submit();
				
				document.getElementById("demo")
				}

//function call(type)
//{
	//document.getElementById("post_cmnt").action="PostServlet";
	///document.getElementById("post_cmnt").method=type;
	//document.getElementById("post_cmnt").submit();
	//}

	
</script>

</html>

