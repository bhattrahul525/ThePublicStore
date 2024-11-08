<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User LOGIN - MyPublicStore</title>
<%@include file="components/comman_css_js.jsp" %>
<link rel="stylesheet" href="css/style.css">

</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-5 offset-md-3">
		
		
		<div class="card mt-3">
			<div class="card-header text-center custom-bg" >
				<h3>LOGIN HERE!!</h3>
			</div>
			<div class="card-body">
			
			<%@include file="components/message.jsp"%>
			
			<form action="LoginServlet" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text"></div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
  </div>
  <a href="register.jsp" class="text-center d-block mb-3">If not registered click here!</a>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary border-0 custom-bg">Submit</button>
	<button type="reset" class="btn btn-primary border-0 custom-bg">Reset</button>
  
  </div>
  </form>
			</div>
			
		</div>
		
		</div>
	</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

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