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
    
  <link rel="stylesheet" href="Custom CSS/CreateTeacher.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
<title>e-Ducation</title>
</head>
<body>


<!-- html -->
<div class="container-fluid bg-white">

<div class="row shadow-sm " style="border-bottom: 1px solid gray;" >
	<div class="col-sm-12">
		<h1 class="text-left">e-Ducation</h1>
		</div>
</div>

 <div class="row mt-3">
	
	<div class="col-sm-8 col-lg-2 offset-lg-10  offset-sm-4 text-right  ">
		
																<!-- Modal terms -->
			
			<button type="button" class="btn btn-dark text-light shadow-sm" data-toggle="modal" data-target="#staticBackdrop">Create</button>									
			<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" 
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
 				 <div class="modal-dialog modal-dialog-centered ">
    				<div class="modal-content m-2 ">
      
      					<div class="modal-body text-left">
        					<h5 class="modal-title">Using Classroom at a school with students?</h5>
        						<br>
							<p class="modal-text">If so, your school must sign up for a free G Suite for Education account before you can 
							use Classroom. Learn More</p>
							<p class="modal-text">G Suite for Education lets schools decide which Google services their students 
							can use, and provides additional privacy and security protections that are important in a school setting. 
							Students cannot use Google Classroom at a school with personal accounts.
							</p>
							<div class="container" style="background:#EDEDED;height:6rem;">
								<input type="checkbox" id="terms" autocomplete="off" > 
    							<label for="terms">I've read and understand the above notice, and I'm not using 
    							Classroom at a school with students</label>
  							</div>
        
      					</div>
      					<div class="modal-footer">
        					<button type="button" class="btn btn-light" data-dismiss="modal">Go Back</button>
        					<button type="button" class="btn btn-light" data-toggle="modal" data-target="#staticBackdrop1 " 
        					id="read" data-dismiss="modal">Continue</button>
      					</div>
    				</div>
 			 </div>
		</div>
			                                    						 
			                                    						  <!-- end -->
		
			

																		<!-- Modal form -->
				<div class="modal fade" id="staticBackdrop1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered ">
				  
				    <div class="modal-content" style="border-radius:8px;">
				    
				      <div class="modal-header">
				      
				        <h5 class="modal-title" id="exampleModalLabel">Create Class</h5>
				        
				        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				         	 	<span aria-hidden="true">&times;</span>
				        	</button>
				        	
				      </div>
				      <div class="modal-body">
				  		<form id="create_class_Form">
				        	
				          	<div class="form-group " style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
				            	<input placeholder="Class name(required)" id="cname" type="text" name="classname" class="form-control shadow-sm " style="background:none;outline:none;border:none; height:4rem;">
				          	</div>
				          
				          
				           	<div class="form-group " style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
				           		<input type="text" class="form-control  shadow-sm" placeholder="Section" name="section" style="background:none;outline:none;border:none;height:4rem;">
				           	</div>
				           	
							<div class="form-group" style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
								<input type="text"  class="form-control  shadow-sm" placeholder="Room" name="room" style="background:none;outline:none;border:none;height:4rem;">
							</div>
							
							<div class="form-group"  style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
								<input type="text" class="form-control  shadow-sm" placeholder="Subject" name="subject" style="background:none;outline:none;border:none;height:4rem;">
							</div>
					
						<!-- <div class="form-group"  style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
								<input type="text" class="form-control  shadow-sm" placeholder="Teacher's Name" name="teachername" style="background:none;outline:none;border:none;height:4rem;">
							</div>-->
							
							<div class="form-group"  style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
								<input id="mail"  class="form-control  shadow-sm" placeholder="Mail Id" type="text" name="mailid" style="background:none;outline:none;border:none;height:4rem;">
							</div>
							
					<!--  <div class="form-group"  style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
								<input type="password" class="form-control  shadow-sm"  placeholder="password"  name="password" style="background:none;outline:none;border:none;height:4rem;">
							</div>-->
							
				        </form>
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
				        <button type="button" class="btn btn-light "  id="submit"  onclick="callServlet('Post')">Create</button>
				      </div>
				    </div>
				  </div>
				</div>
																	<!-- end -->
																	
			<a href="JoinClass.jsp" class="btn btn-dark text-light shadow-sm">Join</a>
			
		
	</div>
</div>

		<!-- end -->
		
<div class="container-fluid  mr-sm-5 mr-lg-3 mb-sm-2 mb-md-2 mb-lg-2 ">
	
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


				<div class="col-sm-6  col-lg-3 col-md-4 mt-3 p-1 p-md-2">

					<div class="card " style="height:100%;width:100%; border:1px solid #D5D5D5; border-radius:10px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
						<div class="card-header bg-primary " style="height:95px; border-radius:10px 10px 0px 0px;">
							<div class="fa fa-ellipsis-v float-right text-light" aria-hidden="true" style="opacity:95%;"></div>
								<a class="text-light" href="CreateTeacher.jsp?code=<%out.print(rs.getString("classcode"));%>&classname=<%out.print(rs.getString("classname"));%>">
							
									<h3 class="card-title ">
										<%
											out.println(rs.getString("classname"));
										%>
										
									</h3> 
									<p class="card-text">
										<%
											out.println(rs.getString("section"));
										%>
									</p>
								</a> 
						
						</div>
						<br>

						<div class="card-body" style="height:115px;">

						<%
							out.println(rs.getString("subject"));
						%>
	<br>
						<%
							out.println(rs.getString("classcode"));
						%>
					


	</div>
	<div class="card-footer bg-white" style="height:55px;border-top:1px solid #D5D5D5; border-radius:0px 0px 10px 10px;">
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
	

	</div>
		

</body>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	
  	<script type="text/javascript">
  	$(document).ready(function(){
		//for input type text...
		$("#submit").attr('disabled',true);
		$("#cname").on('keyup',function(){
	//if($(this).val >=1)
		//{
		$("#submit").attr('disabled',false);
		//}

			});
			
			

		
		//for input type checkbox...
		$("#read").attr('disabled',true);
		$("#terms").change(function(){
			if(this.checked){
				$("#read").attr('disabled',false);
				}
			else{
				$("#read").attr('disabled',true);
				}
			
			});




  		
  	});

  //call servlet...
  	function callServlet(methodType)
		{
	  		document.getElementById("create_class_Form").action="ServletTeacher";
	  		document.getElementById("create_class_Form").method=methodType;
	  		document.getElementById("create_class_Form").submit();
	  }
	

  	</script>
</html>