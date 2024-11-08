<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New user</title>
<%@include file="components/comman_css_js.jsp" %>

</head>
<body>
<%@include file="components/navbar.jsp" %>

<div class="container-fluid">
	<div class="row mt-5">
	<div class="col-md-4 offset-md-4">
		<%@include file="components/message.jsp" %>
		
		<div class="card">
		
		
			<div class="card-body">
				<h3 class="text-center my-3">Sign up here!!</h3>
		
		<form action="RegisterServlet" method="post">
		
		<div class="form-group">
    <label for="name" >User Name</label>
    <input name="user_name" type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter here" aria-describedby="emailHelp">
      		</div>
  	
		<div class="form-group">
    <label for="email" >Email ID</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter here" aria-describedby="emailHelp">
      		</div>
  	
		<div class="form-group">
    <label for="password">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputEmail1" placeholder="Enter here" aria-describedby="emailHelp">
      		</div>
  	
		<div class="form-group">
    <label for="phone" >Phone Number</label>
    <input name="user_number" type="number" class="form-control" id="exampleInputEmail1" placeholder="Enter here" aria-describedby="emailHelp">
      		</div>
  	
		<div class="form-group">
    <label for="address" >Address</label>
    <textarea name="user_address" style="height:150px;" placeholder="Enter your Address here" class="form-control" ></textarea>
      		</div>
      		<br>
  	<div class="container text-center">
  		<button class="btn btn-outline-success">Register</button>
  		<button class="btn btn-outline-warning">Reset</button>
  
  	</div>
		</form>
			</div>
		</div>
	
	</div>
</div>
</div>

<%@include file="components/comman_modals.jsp" %>
<div class="footer">
<div class="footer-content">
	
	
</div>
<div class="footer-bottom">
	&copy; ThePublicStore.com | Designed by Rahul Bhatt
</div>
</div>
</body>
</html>