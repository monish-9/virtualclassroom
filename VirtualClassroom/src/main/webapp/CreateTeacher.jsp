<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.SPASM.model.Teacher"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>

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
	<style>
	
  	.comment textarea
  	{
  		box-sizing: border-box;
  		border-radius: 0px;
  		padding-top:23px;
  		padding-left:17px;
  		padding-right:17px;
  		font-size: 19px;
  		font-weight:500;
  		font-family:sans-serif;
  	}
  	.comment form div 
  	{
		position: relative;

  	}
  	.comment form div label
  	{
  		
  		position: absolute;
  		top: 15px;
  		left:16px;
  		color: black;
  		font-size: 16px;
  		font-family:sans-serif;
  		transition: .3s;
  		pointer-events: none;
  		
  		
  		
  		
  	}
  	.comment textarea:focus ~ label,.comment textarea:valid ~ label
  	{
  		top:8px;
  		left: 16px;
  		font-size: 12px;
  		font-family:sans-serif;
  		color: gray;
  	

  	}
  
  .bar
  {
  	position: relative;
  	display:block;
  }
  
  .bar:after, .bar:before
  {
  	content:"";
  	width:0;
  	height:1px;
  	bottom:1px;
  	background:black;
  	position: absolute;
  	transition: .5s;
  	
  	
  }
  .bar:before
  {
  	left:50%;
  } .bar:after
  {
  	right:50%;
  }
  .comment textarea:focus ~ .bar:before, .comment textarea:focus ~ .bar:after
  	{
  		width:50%;
  	}
	
	</style>

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

<!-- declaration.... -->
<%!int i; %>
	<div class="container-fluid "> <!-- 1st div.... -->
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
		<div class="container  pl-md-5 pr-md-5 ">
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




				<div class="text-center text-white ">

					<div class=" fa fa-chevron-down" id="down-arrow"
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
					<p class="text-black">name:</p>
				</div>
				<div class="d-inline-block">
					<p class="text-black">
						<%
							out.println(rs.getString("name"));
						%>
					</p>
				</div>
			</div>
		</div>
		
					 <!-- end -->
		
		<div class="container mt-4 ">
			<div class="row">
				<div class="col-md-3 col-sm-12 pl-md-5">
					<div class="card    d-md-block d-none d-sm-none pl-4 pt-4" style="border-radius:8px; height: 130px;">
						<h6 class=" card-text ">Upcoming</h6>
						<p class=" position-static card-text">No work due soon</p>
						<div class="clearfix ">
							<h6 class="float-right card-text mr-2 " >
								<a href="#" class="text-dark" >View all</a>
							</h6>

						</div>
					</div>
				</div>
 						 <!-- end -->
 						 
				<div class="col-md-9 pr-md-5 col-12 ">
					<div class="card    p-3 "
						style="height: 70px;border-radius: 8px; box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2);" id="text_something">
						
						<span >
						<span class="fa fa-user-circle fa-2x float-left " style="line-height:39px;color:gray;" aria-hidden="true"></span>
						<span class="text-gray  " style="line-height:2vw;margin-left:14px;" >say with your class...</span>
						</span>
						
					</div>
					
					
					
					
					
					
					
						<!--database connectivity for post msg-->
		<%
			String sql = "SELECT id,post,date FROM upload WHERE classcode=?";
			
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



					<div class="card  p-4 "
						style="display: none; box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2);border-radius: 8px;" id="post_something">
						<p>for</p>
						<div class="container comment">

							<form  method="post" id="comment" name="comment">
								<div class="form-group" >
								<textarea class="form-control" id="comment_post"
									 rows="4" cols="60" name="msg" required="required" 
									style=" resize:none;overflow:hidden;background:#EDEDED;outline:none;border:none;border-bottom:1px solid black;box-shadow: none!important;"></textarea>
									<label>Share with your class</label>
									<div class="bar"></div>
								</div>
								

							</form>
							<div class="clearfix">
							<button type="submit" class="btn btn-dark float-right ml-3" id="post_btn" name="post_btn" disabled onclick="servletCall('post')" style="box-shadow: none!important;">Post</button>
							<button class="btn btn-light float-right" id="close_btn">close</button>
							</div>
						</div>

					</div>


					<!-- end -->
			
			
			
			
			<%
																while (r.next()) {
																	//text=rs.getString("post");
																	i=r.getInt("id");
															%>
		
			<!-- design card for upload msg and file -->
					
					<%//Format f=new SimpleDateFormat("dd-mmm-yyyy");
					//String ss=f.format(r.getDate("date")); %>
					    
					 <div class="card  comment mt-4" id="<%out.println(i);%>" style="border-radius: 8px;">
						<div class="card-header bg-white" style="border-radius:  8px 8px 0px 0px;">
					  
    						
    							<div>
    								<span class="fa fa-user-circle fa-2x float-left " style="line-height:40px;color:gray;" aria-hidden="true"></span>
    								<span class="float-left">
    								<div class="ml-3" style="line-height:21px;">Monish Paul</div>
    								<div class=" ml-3" style="line-height:12px; font-size: 11px;"><%out.println(r.getDate("date").toLocaleString().subSequence(0, 7));%></div>
    								</span>
    							</div>
    							
    							<div class=" float-bottom mt-5">
    							
    						 		<%out.println(r.getString("post"));%>
    						 	</div>
    					</div>
    						
    				
    				
						
						
						
						
						
						
						<!--database connectivity for comment-->
		<%
			String sql1 = "SELECT comment,date_cmnt FROM upload_comment WHERE msg_id=?";
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
						
						<div class="card-body reply_list "   >
					
								<div>
    								<span class="fa fa-user-circle fa-2x float-left " style="line-height:40px;color:gray;" aria-hidden="true"></span>
    								<span class="text-left">
    			
    								<div   style="line-height:16px;margin-left:45px;font-size: 13px;">Monish Paul &nbsp<%out.println(r1.getDate("date_cmnt").toLocaleString().subSequence(0, 7)); %></div>
    								<div  style="line-height:35px;margin-left:45px;"><%out.println(r1.getString("comment")); %>   </div>
    								</span>
    							</div>
    							
    			
						
    				 
					 
					</div>
					
					<%} %>
					
					
					<!-- from for reply -->
					  <div class="card-footer  bg-white rep" style="border-radius:  0px 0px 8px 8px;"> 
    				   <form >
						 <!--   <div class="input-group" >-->
						
						
						  <!--  <textarea class="form-control md-textarea"  aria-label="With textarea" style="height:3vw;border-radius:50px 0px 0px 50px;" id="cmnt" ></textarea>
						  <div class="input-group-prepend  ">  input-group-text  css height:3vw;border-radius:0px 50px 50px 0px;-->
						  <div class="text-center">
    						<a class="btn btn-light btn-block text-primary" id="reply" name="<%out.println(i); %>" class="link-reply bg-white" role="button" style="">Reply</a>
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

						</div>
					
					
					
					
				
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

				
					
					
				
					
					
					<div id ="previous_content" class=" border-dark card mt-4 p-3 "
						style="border-radius:8px; height: 210px; margin-bottom:12px;">
						<h3 class="card-title">Communicate with your class here</h3>

						<h6 class="card-text">Create and schedule announcements</h6>
						<h6 class="card-text">Respond to student posts</h6>
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



	<!-- clint side manupulation using jquery and js.... -->
	
<script type="text/javascript">
	$(document).ready(function() {
						
						$("#down-arrow").click(function() {
							$("#down-arrow").addClass("fa fa-chevron-up");
								$("#div2").toggle();
								$("#div1").toggleClass("second-div-radius");
								//$("#down-arrow").toggleClass(" container-fluid > container> text-center> fa fa-chevron-up")
											//$("#up").children('.fa').toggleClass('fa-chevron-up fa-chevron-down');
								
								
										});

						$("#text_something").click(function() {

							$("#post_something").show();
							$("#text_something").hide();
						});

						$("#close_btn").click(function() {

							$("#post_something").hide();
							$("#text_something").show();
						});

						$("#post_btn").click(function() {

							$("#previous_content").remove();
							
						});
						
						$("a#reply").one("click",function() {
							//$(".rep").remove();                                                                                          
							var comCode = $(this).attr("name");
							var parent = $(this).parent();
							var data = "<br> <form action='ReplyServlet' method='post' id='comment'> <div class='input-group input-group-sm rounded-lg '> <textarea class='form-control ' aria-label='Example text with two button addons' aria-describedby='button-addon3'  style='resize:none;overflow:hidden;box-shadow:none;!important'  name='new-reply' id='new-reply' rows='2' ></textarea><input type='hidden' name='code' value='"+comCode+"'><div class='input-group-append' id='button-addon3'><input type='submit' class='btn btn-primary' disabled id='reply-btn' value='Send'  style='box-shadow:none;!important'></div></div></form>";
							parent.append(data);
																	
																	
						    alert(comCode);

							//auto increasing of textarea for reply
							$("#new-reply").on("keyup input",function(){
								
								
								var empty1=false;
								$(this).css('height','auto').css('height',this.scrollHeight+(this.offsetHeight-this.clientHeight));

								$("#new-reply").each(function(){
								if($(this).val()=='')
									{
								
										empty1=true;
									}
								});
								if(empty1)
									{
										$('#reply-btn').attr('disabled', 'disabled');
									}
								else{
									$('#reply-btn').removeAttr('disabled');
									}
								
								});								
												
						
						//$("#bo").click(function(){
						//$(".reply_list").css('display','none');
						//});

						});


						//auto increasing of textarea for comment

						$("#comment_post").on("keyup input",function(){
							//var x=$(this).val;
							//alert(x);
							var empty=false;
							$(this).css('height','auto').css('height',this.scrollHeight+(this.offsetHeight-this.clientHeight));

							$("#comment_post").each(function(){
							if($(this).val()=='')
								{
							//document.getElementById("post_btn").disabled=false;
									empty=true;
								}
							});
							if(empty)
								{
									$('#post_btn').attr('disabled', 'disabled');
								}
							else{
								$('#post_btn').removeAttr('disabled');
								}
							
							});
						
					

					});
		
			//call PostServlet using js
			
			
			function servletCall(methodType)
			{
				
				
				var textarea=document.forms["comment"]["msg"].value;
				if(textarea=="")
					{
						
					//document.getElementById("post_btn").disabled=true;
					}
				else{
					
				document.getElementById("comment").action="PostServlet";
				document.getElementById("comment").method=methodType;
				document.getElementById("comment").submit();
				}
				//var content=document.getElementById("previous_content");
				//content.remove();
				//const parent=previous_content.getElementByTagName("h3");
				//alert(parent);
				//document.getElementById("demo")
				
				}

//function call(type)
//{
	//document.getElementById("post_cmnt").action="PostServlet";
	///document.getElementById("post_cmnt").method=type;
	//document.getElementById("post_cmnt").submit();
	//}

	
</script>

</html>

