<%@page import="org.stringtemplate.v4.compiler.CodeGenerator.list_return"%>
<%@page import="com.rahul.ThePublicStore.helper.helper"%>
<%@page import="com.rahul.ThePublicStore.entities.Category"%>
<%@page import="com.rahul.ThePublicStore.dao.CategoryDao"%>
<%@page import="com.rahul.ThePublicStore.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.rahul.ThePublicStore.dao.ProductDao"%>
<%@page import="com.rahul.ThePublicStore.helper.FactoryProvider"%>


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

<%@include file="components/comman_css_js.jsp" %>
<link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css">
<link rel="stylesheet" href="css/recipt_style.css">

<meta charset="ISO-8859-1">
<title>Recipt</title>


</head>
<body>

<%@include file="components/navbar.jsp" %> 

<div class="container ">
	<div class="row">
		<div class="col-md-7 offset-md-3">
		
		
		<div class="card mt-3">
			<div class="card-header text-center" >
				<h3>Recipt</h3>
			</div>
			<div class="card-body">
			
					<form action="index.jsp">
  
  
  <div class="form-group">
    <label for="name" style="font-size:20px;">Name: <%= user.getUserAddress() %></label>
      </div>
      
      <div class="form-group">
    <label for="exampleFormControlTextarea1"style="font-size:20px;">Phone Number : <%= user.getUserPhone() %></label>
     </div>
  
   <div class="form-group">
    <label for="exampleFormControlTextarea1"style="font-size:20px;">Address : <%= user.getUserAddress() %></label>
    </div>
  
   <div class="form-group">
    <label for="exampleFormControlTextarea1"style="font-size:20px;">Mode of Payment : Online</label>
    </div>
    
    <div class="form-group">
    <label for="exampleFormControlTextarea1"style="font-size:20px;">Items : </label>
    </div>
    
    <div class="col-md-6">
			<div class="card">
				<div class="cart-body">
					
				</div>
			
		</div>
    <div class="text-center">
				<button class="btn text-center btn-primary" onclick="deleteCart()">Continue Shopping</button>
			
			</div>
  					</form>
  					
				</div>
			</div>
</div>

			

			</div>
			
		</div>



</body>
</html>