<%@page import="com.rahul.ThePublicStore.entities.Category"%>
<%@page import="com.rahul.ThePublicStore.entities.User" %>
<%@page import="org.stringtemplate.v4.compiler.CodeGenerator.list_return"%>
<%@page import="com.rahul.ThePublicStore.helper.helper"%>
<%@page import="com.rahul.ThePublicStore.dao.CategoryDao"%>
<%@page import="com.rahul.ThePublicStore.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.rahul.ThePublicStore.dao.ProductDao"%>
<%@page import="com.rahul.ThePublicStore.helper.FactoryProvider"%>

<% 
	User user1=(User)session.getAttribute("current-user");
	

%>



<nav class="navbar navbar-expand-lg navbar-light custom-bg">
   <div class="container">
   	<div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><h3>ThePublicStore</h3></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">HOME</a>
        </li>
        
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a href="index.jsp" class="list-group-item list-group-item-action active" aria-current="true">All products</a>
        
          <%

          CategoryDao cdao2=new CategoryDao(FactoryProvider.getFactory());
          List<Category> qwer=cdao2.getCategories();
	
			for(Category c:qwer){
			%>
			
			
			<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>	
			
			
			<% 
			}
		%>
          
          </div>
      </li>
        
      </ul>
      <ul class="navbar-nav ml-auto">
      
      
      <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size:25px;"></i><span class="cart-items"  style="font-size:20px">()</span></a>
        </li>
        
      
      <% 
      if(user1==null)
      {
    	  %>
      
      	<li class="nav-item">
          <a class="nav-link active mt-1" aria-current="page" href="login.jsp">Login</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active mt-1" aria-current="page" href="register.jsp">Register</a>
        </li>
        <% 
        }
      else{
      %>
    	  <li class="nav-item">
          <a class="nav-link active" aria-current="page" 
          href="<%=user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp" %>">
          <%= user1.getUserName() %>
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="LogoutServlet">Logout</a>
        </li>
      <% 
      }
      %>
      </ul>
    </div>
  </div>
   </div>
</nav>