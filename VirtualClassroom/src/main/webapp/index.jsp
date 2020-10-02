<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  
 <script type="text/javascript">
	function test()
	{
		var mail=document.getElementById("mail").value;
	var regex=/^([a-zA-Z0-9\.-]+)@([a-zA-Z-]+).([a-z]{2,8})(\.[a-z]{2,8})$/;
		
		if(regex.test(mail))
			{
				
				document.getElementById("mail").style.border= "3px solid green";
				return true;
				
			}
		else
			{
			document.getElementById("mail").style.border= "3px solid red";
		return false;
				
			}
	}
</script>
  
  
<title>virtual classroom</title>
</head>

<body>

<div class="container">

	<form onsubmit="return test()" action="ServletTeacher" name="createclass" method="post">
	<h2>Class Details</h2>
		Class Name (required)<br>
		<input type="text" name="classname" required><br>
		Class Description<br>
		<input type="text" name="classdescription"><br>
		Section<br>
		<input type="text" name="section"><br>
		Room<br>
		<input type="text" name="room"><br>
		Subject<br>
		<input type="text" name="subject"><br>
	<h2>Teacher's Details</h2>
		Teacher's Name<br>
		<input type="text" name="teachername"><br>
		Mail Id<br>
		<input id="mail" placeholder="abc@gmail.com" type="text" name="mailid"><br>
		Password<br>
		<input type="password" name="password"><br><br>
		<input type="submit" name="Create" value="Create">
	</form>	
	
	
</div>

</body>
</html>


