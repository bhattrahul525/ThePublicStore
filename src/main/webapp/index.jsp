<%@page import="org.stringtemplate.v4.compiler.CodeGenerator.list_return"%>
<%@page import="com.rahul.ThePublicStore.helper.helper"%>
<%@page import="com.rahul.ThePublicStore.entities.Category"%>
<%@page import="com.rahul.ThePublicStore.dao.CategoryDao"%>
<%@page import="com.rahul.ThePublicStore.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.rahul.ThePublicStore.dao.ProductDao"%>
<%@page import="com.rahul.ThePublicStore.helper.FactoryProvider"%>
<html>
<head>
<title>Ecom Website</title>

<%@include file="components/comman_css_js.jsp" %>
<link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@include file="components/navbar.jsp" %>

	<!-- carausel -->
	
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="image/5.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="image/2.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="image/3.jpg" alt="Third slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="image/4.jpg" alt="Fourth slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="image/1.jpg" alt="Fifth slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="mt-3 mb-3">
	<h2>DEALS OF THE DAY</h2>
</div>
	
<div class="container-fluid">
	<div class="row mt-3 mx-2">

	<%
	String cat=request.getParameter("category");
		
	
		ProductDao dao=new ProductDao(FactoryProvider.getFactory());
		List<Product> list=null;
		if(cat==null){
			
			list= dao.getAllProducts();
		}
		else {
			int cid=Integer.parseInt(cat.trim());
			list=dao.getAllProductsById(cid);
			
			
		}
		
		CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist=cdao.getCategories();
	%>
	
	
<div class="col-md-12">
	<div class="row">
		<div class="col-md-14">
			<div class="card-columns" style="display:inline-block;column-break-inside: avoid;">
				<!-- Traversing products -->
				<%
				for(Product p:list){
				
				%>
				
				<div class="card product-card">
				
					<div class="container text-center">
						<img class="card-img-top m-2" src="image/Products/<%= p.getpPhoto() %>" style="max-height:200px;max-width:100%;width:auto;" alt="Card image cap">
					
					</div>
				
					<div class="card-body"> 
						<h5 class="card-title"><%=p.getpName() %></h5>
						
						<p class="card-text">
							<%= helper.get10Words(p.getpDescription())%>
						</p>
					</div>
				<div class="card-footer text-center">
					<button class="btn custom-bg" 
					onclick="add_to_cart('<%= p.getPid() %>','<%= p.getpName()%>','<%= p.getPriceAfterApplyingDiscount() %>')">
					Add to cart
					</button>
					
					<button class="btn btn-outline-primary ">&#8377;<%= p.getPriceAfterApplyingDiscount() %>>/-<span class="text-secondary discount-label">&#8377; <%= p.getpPrice()%> , <%= p.getpDiscount()%>% off</span></button>
			 
				</div>
				
				</div>
				
				<%} 
				
					if(list.size()==0){
						out.println("<h3>No items in this category</h3>");					}
				
				%>
			</div>
		</div>

	</div>

</div>
</div>
</div>

<div class="footer">
<div class="footer-content">
	
	
</div>
<div class="footer-bottom">
	&copy; ThePublicStore.com | Designed by Rahul Bhatt
</div>
</div>

<%@include file="components/comman_modals.jsp" %>
</body>
</html>
