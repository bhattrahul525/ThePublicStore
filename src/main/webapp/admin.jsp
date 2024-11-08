<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="com.ibm.icu.impl.ICUService.Factory"%>
<%@page import="com.rahul.ThePublicStore.helper.helper"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.rahul.ThePublicStore.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.rahul.ThePublicStore.helper.FactoryProvider"%>
<%@page import="com.rahul.ThePublicStore.entities.User" %>
<%@page import="com.rahul.ThePublicStore.dao.CategoryDao" %>
<% 
	User user=(User)session.getAttribute("current-user");
	if(user==null){
		session.setAttribute("message","You are not logged in !!Login first");
		response.sendRedirect("login.jsp");
		return;
	}
	else{
		if(user.getUserType().equals("normal")){
			session.setAttribute("message","You are not admin ! Do not access this page");
			response.sendRedirect("login.jsp");
			return;
		}
	}

%>

<% 
        	
        		CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
        		List<Category> list = cdao.getCategories();
        		
        		Map<String,Long>m=helper.getCounts(FactoryProvider.getFactory());
        		
        	%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin panel</title>
<%@include file="components/comman_css_js.jsp" %>

</head>
<body>
<%@include file="components/navbar.jsp" %>

<div class="container admin">

	<div class="container-fluid mt-3">
		<%@include file="components/message.jsp" %>
	</div>

	<div class="row mt-3">
			<div class="col md-4">
			<div class="card"data-toggle="tooltip" data-placement="left" title="Number of users in this website">
				<div class="card-body text-center">
					
					<div class="container"> 
						<img style="max-width:125px" class="img-fluid rounded-circle" src="image/group.png" alt="user_icon">
					</div>
					<h1><%=m.get("userCount") %></h1>
					<h1 class="text-uppercase text-muted">users</h1>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card" data-toggle="tooltip" data-placement="top" title="Number of users in this website">
				<div class="card-body text-center">
					<div class="container"> 
						<img style="max-width:125px" class="img-fluid " src="image/task-list.png" alt="user_icon">
					</div>
					<h1><%= list.size() %></h1>
					<h1 class="text-uppercase text-muted">categories</h1>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card">
				<div class="card-body text-center">
					<div class="container"> 
						<img style="max-width:125px" class="img-fluid " src="image/trolley.png" alt="user_icon">
					</div>
					<h1><%=m.get("productCount") %></h1>
					<h1 class="text-uppercase text-muted">products</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-3">
		<div class="col md-6">
			<div class="card" data-toggle="modal" data-target="#add-category-modal">
				<div class="card-body text-center">
					<div class="container"> 
						<img style="max-width:125px" class="img-fluid" src="image/calculator.png" alt="user_icon">
					</div>
					<p class="mt-2">Click here to add new category</p>
					<h1 class="text-uppercase text-muted">Add Category</h1>
				</div>
			</div>
		</div>
		<div class="col md-6">
			<div class="card" data-toggle="modal" data-target="#add-product-modal">
				<div class="card-body text-center">
					<div class="container"> 
						<img style="max-width:125px" class="img-fluid " src="image/plus.png" alt="user_icon">
					</div>
					<p class="mt-2">Click here to add new product</p>
					<h1 class="text-uppercase text-muted">Add Products</h1>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg">
        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form action="ProductOperationServlet" method="post">
        	
        	<input type="hidden" name="operation" value="addCategory">
        	
        	
        	<div class="form-group">
        		<input type="text" class="form-control" name="catTitle" placeholder="Enter category Title" required/>
        	</div>
        	<div class="form-group mt-2">
        		<textarea class="form-control" placeholder="Enter category description" name="catDescription" 
        		style="height:150px;" required></textarea>	
        	</div>
        	
        	<div class="container text-center mt-2">
        		
        		<button class="btn btn-outline-success">Add Category</button>
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg">
        <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
        
        <input type="hidden"  name="operation" value="addProduct"/>
        
        	<div class="form-group">
        		<input type="text" class="form-control" name="pName" placeholder="Enter product Title" required/>
        	</div>
        	<div class="form-group mt-2">
        		<textarea class="form-control" placeholder="Enter product description" name="pDescription" 
        		style="height:150px;" required></textarea>	
        	</div>
        	<div class="form-group">
        		<input type="number" class="form-control" name="pPrice" placeholder="Enter product Price" required/>
        	</div>
        	<div class="form-group mt-2">
        		<input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required/>	
        	</div>
        	<div class="form-group mt-2">
        		<input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required/>	
        	</div>
        	
        	
        	<div class="form-group mt-2">
        		<select name="catId" class="form-control" id="">
        			
        			<% 
        				for(Category c:list){
        			%>
        			<option value="<%= c.getCategoryId() %>" >
        				<%= c.getCategoryTitle() %>
        			</option>
        			<%} %>
        			</select>	
        	</div>
        	
        	<div class="form-group mt-2">
        		<label for="pPic">Select Picture of product</label>
        		<br>
        		<input class="mt-2" type="file" name="pPic" required/>
        	</div><hr>
        	<div class="container text-center mt-2">
        		
        		<button class="btn btn-outline-success">Add product</button>
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
        	</div>
        	</form>
      </div>
    </div>
  </div>
  </div>
  <script>
  $(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
  </script>
  
  <div class="footer">
<div class="footer-content">
	
	
</div>
<div class="footer-bottom">
	&copy; ThePublicStore.com | Designed by Rahul Bhatt
</div>
</div>
  </body>
</html>
<%@include file="components/comman_modals.jsp" %>
