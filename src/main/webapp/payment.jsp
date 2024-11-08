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
<title>Payment page</title>
<%@include file="components/comman_css_js.jsp" %>
<link rel="stylesheet" href="css/checkout_style.css">
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container">
	<div class="row mt-5">
		<div class="col-md-6">
			<div class="card">
				<h3 class="text-center my-3 mb-3">The Final List</h3>
				<div class="cart-body">
					
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h3 class="text-center mb-5 ">Shippping Details</h3>	
					<form action="credit_card.jsp">
  
  
  <div class="form-group">
    <label for="name" style="font-size:20px;">Name: <%= user.getUserAddress() %></label>
      </div>
      
      <div class="form-group">
    <label for="exampleFormControlTextarea1"style="font-size:20px;">Phone Number : <%= user.getUserPhone() %></label>
     </div>
  
   <div class="form-group">
    <label for="exampleFormControlTextarea1"style="font-size:20px;">Address : <%= user.getUserAddress() %></label>
    </div>
    
    
    
  <div class="container text-center">
    <button class="btn btn-outline-success mt-3" onclick="#">Pay Now</button> 
  	 </div>
  			</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="components/comman_modals.jsp" %>


</body>
</html>