<%
User user=(User)session.getAttribute("current-user");
if(user==null){
	session.setAttribute("message","You are not logged in !!Login first");
	response.sendRedirect("login.jsp");
	return;
}

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout page</title>
<%@include file="components/comman_css_js.jsp" %>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container">
	<div class="row mt-5">
		<div class="col-md-6">
			<div class="card">
				<h3 class="text-center my-3 mb-3">Your selected items</h3>
				<div class="cart-body">
					
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h3 class="text-center mb-5">Your details for order</h3>	
					<form action="payment.jsp">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  <div class="form-group">
    <label for="name">Your name</label>
    <input type="text"  value="<%= user.getUserAddress() %>"class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter email">
      </div>
      
      <div class="form-group">
    <label for="exampleFormControlTextarea1">Your Phone Number</label>
    <input type="number"  value="<%= user.getUserPhone() %>"class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter email">
   </div>
  
   <div class="form-group">
    <label for="exampleFormControlTextarea1">Your shipping address</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter your address"><%= user.getUserAddress() %></textarea>
  </div>
  
  <div class="container text-center">
  	<button class="btn btn-outline-success mt-3" onclick="payment.jsp">Checkout</button>
  	 
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