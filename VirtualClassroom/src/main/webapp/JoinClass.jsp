<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student's Section</title>
</head>

<body>
<%String mailid=request.getParameter("mail"); %>
<form action="ServletStudent" name="joinclass" method="post">
		
		<input type="hidden" value=<%=mailid %> name="mailid"><br>
		Contact No<br>
		<input type="text" name="contactno"><br>
		
		Name<br>
		<input type="text" name="sname"><br>
		Class Code
		<p>ask you teacher for the class code,then enter it here</p>
	<input type="text" name="classcode" placeholder="class code"><br><br> 
		<input type="submit" name="Join" value="Join">
		<p>To sign in with a class code</p>
		<ul>
  <li>Use an authorized account</li>
  <li>Use a class code with 5-7 letters or numbers,and no spaces or symbols</li>
</ul>
<p>If you have trouble joining the class,go to Help Center artical</p>
 </form>	
</body>
</html>