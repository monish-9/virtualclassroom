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
	//function test()
	//{
		//var mail=document.getElementById("mail").value;
	//var regex=/^([a-zA-Z0-9\.-]+)@([a-zA-Z-]+).([a-z]{2,8})(\.[a-z]{2,8})$/;
		
	//	/if(regex.test(mail))
	//		{
		//	onsubmit="return test()"
				//document.getElementById("mail").style.border= "3px solid green";
				//return true;
				
			//}
	//else
		//	//{
			//document.getElementById("mail").style.border= "3px solid red";
		//return false;
				
			//}
	//}
$(document).ready(function(){
	$("#mail").on("keyup input",function(){

		var regex=/^([a-zA-Z0-9\.-]+)@([a-zA-Z-]+).([a-z]{2,8})(\.[a-z]{2,8})$/;
		if(regex.test($(this).val()))
			{
			document.getElementById("mail").style.border= "3px solid green";
			return true;
			}
		else
			{
			document.getElementById("mail").style.border= "3px solid red";
			return false;
			}

		});
	
});

	
</script>
  
  
<title>virtual classroom</title>
</head>

<body>

 <div class="container">

	<form  action="ServletTeacher" name="createclass" method="post">
	<h2>Class Details</h2>
		Class Name (required)<br>
		<input type="text" name="classname" required><br>
		Class Description<br>
		<input type="text" placeholder="Class Description" name="classdescription"><br>
		Section<br>
		<input type="text" placeholder="Section" name="section"><br>
		Room<br>
		<input type="text" placeholder="Room" name="room"><br>
		Subject<br>
		<input type="text" placeholder="Subject" name="subject"><br>
	<h2>Teacher's Details</h2>
		Teacher's Name<br>
		<input type="text" placeholder="Teacher's Name" name="teachername"><br>
		Mail Id<br>
		<input id="mail" placeholder="Mail Id" type="text" name="mailid"><br>
		Password<br>
		<input type="password" placeholder="password"  name="password"><br><br>
		<input type="submit" name="Create" value="Create">
	</form>	
	
	
</div>


</body>
</html>

	
    // all input verification
    $("#mail").on("keyup input",function(){

		var regex=/^([a-zA-Z0-9\.-]+)@([a-zA-Z-]+).([a-z]{2,8})(\.[a-z]{2,8})?$/;
		if(regex.test($(this).val()))
			{
			
			
			return true;
			}
		else
			{
			$("#two").addClass("disp");
			return false;
			}

		});

    $("#pass").on("keyup input",function(){

    	var regex=/(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[@])[a-zA-Z0-9@]{8,}/;
		if(regex.test($(this).val()))
			{
			document.getElementById("one").style.display= "none";
			return true;
			}
		else
			{
			document.getElementById("three").classList.add("alert-danger")
			document.getElementById("three").innerHTML="not correct";
			document.getElementById("three").style.display= "block";
			return false;
			}

		});
    $("#user").on("keyup input",function(){

    	var regex=/^(?=.*[a-zA-Z])[a-zA-Z]{3,}$/;
		if(regex.test($(this).val()))
			{
			document.getElementById("one").style.display= "none";
			return true;
			}
		else
			{
			document.getElementById("one").classList.add("alert-danger")
			document.getElementById("one").innerHTML="not correct";
			
			return false;
			}

		});
		
		
		
		$(document).ready(function(){





	
	 var btn=$('.sign_up').html();
	if(btn=="Sign Up")
		{

		 $('.sign_up').click(callServlet2);

		}
	if(btn=="Sign In")
		{
		 $('.sign_up').click(callServlet);

		}

	
$('.swift').click(function(){
  var signButton = $(this).html();
									      
  if(signButton == 'Sign Up')
  {
          
        	 $('.sign_up').html('Sign Up'); // sign up button text change
             $('.sign_in').html('Sign In'); // sign in button text change
             $('.swift_right').hide(); // second logo hide
             $('.b-forgot').hide(); // forgot option hide
             $('.form_title').html('Create Account');
             $('.b-subtext').html('or use your email for registration');
             $('.user_title').html('Welcome to e-Classroom');
             $('.user_subTitle').html('To keep Connected with us please </br> login with your personal info.');
             $('.b-title').css('margin-top','0px');
             $('.swift_left').show();
             $('.username').show();
             $('.b-wrapper').removeClass('swift_element');
             $('.sign_up').click(callServlet2);

   }
        else{
           

	            $('.sign_up').html('Sign In'); // sign up button text change
	            $('.sign_in').html('Sign Up'); // sign in button text change
	            $('.swift_right').show(); // second logo show
	            $('.b-forgot').show(); // forgot option show
	            $('.form_title').html('Sign in to Guide').css('margin-top','100px'); // form title text change
	            $('.b-subtext').html('or use your email account'); // form sub title text change
	            $('.user_title').html('Hello, Friend'); // user title text change
	            $('.user_subTitle').html('Enter your personal details </br> and start journey with us.'); // user sub title text change
	            $('.b-title').css('margin-top','100px'); // user section add margin top in css
	            $('.swift_left').hide(); // default logo hide
	            $('.username').hide(); // form user field hide
	            $('.b-wrapper').addClass('swift_element'); // add reverse
	            $('.sign_up').click(callServlet);
            
        }

    });




//validation
//var btn=$('.sign_up').html();
//if(btn=="Sign Up"){
	//$("#mail,#pass,#user").on("keyup input",function(){
		///alert();
		//var empty=false;
		
		
		//$("#mail,#pass,#user").each(function(){
		//if($(this).val()=='')
			//{
		
				//empty=true;
			//}
		//});
		//if(empty)
		//	{
				//$('#sbtn').attr('disabled', 'disabled');
			//}
	//	else{
	//	//	//$('#sbtn').removeAttr('disabled');
			
			//}
		//
	//});
//}//





	
	
});









function callServlet(){
	
document.getElementById("logreg").action="Login";
document.getElementById("logreg").method='get';
document.getElementById("logreg").submit();
}

function callServlet2(){
	
document.getElementById("logreg").action="Registration";
document.getElementById("logreg").method='post';
document.getElementById("logreg").submit();
}
		
		
		
		
		
		
		/*
		
		
		
		
const form=document.getElementById("logreg");
const user=document.getElementById("user");
const mail=document.getElementById("mail");
const pass=document.getElementById("pass");


form.addEventListener('submit', function(e) {
	e.preventDefault();
	checkInputs();
});




	



function checkInputs()
{

const userValue=user.value.trim();
const mailValue=mail.value.trim();
const passValue=pass.value.trim();

	if(userValue === '')
		{
		
		setErrorFor(user,'username cannot be blank');
		return false;
	}
	else if(!isUser(userValue))
		{
		setErrorFor(user,'User is not valid');
		return false;
	}
	else
		{
			
			setSuccessFor(user);
			return true;
		}

	if(mailValue === '')
	{
		
		setErrorFor(mail,'Email cannot be blank');
		return false;
	}
	else if(!isEmail(mailValue))
		{
		setErrorFor(mail,'Email is not valid');
		return false;
		}
	else
		{
			
			setSuccessFor(mail);
			return true;
		}


	if(passValue === '')
		{
		
		setErrorFor(pass,'Password cannot be blank');
		return false;
	}
	else if(!isPass(passValue))
		{
		setErrorFor(pass,'Password is not valid');
		return false;
	}
	else 
		{
			
			setSuccessFor(pass);
			return true;
		}
	
	return false;
	
}


function setErrorFor(input,message)
{
	const formGroup=input.parentElement;
	const small=formGroup.querySelector('small');
	small.innerText=message;
	formGroup.className='form-group error';
}

function setSuccessFor(input)
{
	const formGroup=input.parentElement;
	formGroup.className='form-group success';
}


function isEmail(email)
{
	return /^([a-zA-Z0-9\.-]+)@([a-zA-Z-]+).([a-z]{2,8})(\.[a-z]{2,8})?$/.test(email);
	
}

function isPass(pass)
{
	return /(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[@])[a-zA-Z0-9@]{8,}/.test(pass);
}

function isUser(user)
{
	return /^(?=.*[a-zA-Z])[a-zA-Z]{3,}$/.test(user);
}*/
