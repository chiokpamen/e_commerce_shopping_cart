<%@page import="com.shoppingcartevening.connection.DbCon" %>
<%@page import="com.shoppingcartevening.doa.ProductDoa" %>
<%@page import="com.shoppingcartevening.model.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
ProductDoa pd = new ProductDoa(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Mega Store</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

<%@include file = "include/header.jsp"%>

</head>
<body>

<div class="container">
<%@include file = "include/navbar.jsp"%>
	<div class= "container">
	<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="product-images/silver-bracelet2.jpg" class="img-fluid d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h3 class="text-#9b7653 font-weight-bold ">Our Cyber Sale is finally here!</h3>
        <p  class="text-#9b7653 font-weight-bold ">20% off site wide.</p>
        <a href="index.jsp" class="btn btn-dark rounded-pill">Shop Now</a>
      </div>
    </div>
    <div class="carousel-item">
      <img src="product-images/sunshades2.jpg" class="img-fluid d-block w-100 " alt="...">
      <div class="carousel-caption .mr-3">
        <h3 class="text-#9b7659 font-weight-bold ">Trendy Sunglasses</h3>
        <p  class="text-#9b7653 font-weight-bold "></p>
        <a href="index.jsp" class="btn btn-dark rounded-pill">Shop Now</a>
      </div>
    </div>
    <div class="carousel-item">
      <img src="product-images/nike-sneakers2.jpg" class="img-fluid d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h3 class="text-#9b7653 font-weight-bold ">Shop Latest Styles</h3>
        <p  class="text-#9b7653 font-weight-bold "></p>
        <a href="index.jsp" class="btn btn-dark rounded-pill">Shop Now</a>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
		<div class="card-header my-3"><h5>All Products</h5></div>
			<div class ="row">
			<% 
			if(!products.isEmpty()){
				for(Product p:products){%>
					<div class="col-md-3 my-3">
					<div class="card w-100" style="width: 18rem;">
						  <img src="product-images/<%= p.getImage() %>" class="card-img-top" alt="...">
						  <div class="card-body" style="background-color: #ebd8d0">
						    <h5 class="card-title"><%= p.getName() %></h5>
						    <h6 class="price">Price: $<%= p.getPrice() %></h6>
						    <h6 class="category">Category: <%= p.getCategory() %>"</h6>
						    <div class ="mt-3 d-flex justify-content-between" >
						    <a href="add-to-cart?id=<%=p.getId() %>" class="btn rounded-pill text-white" style="background-color: #14272f">Add to Cart</a>
						    <a href="order-now?quantity=1&id=<%=p.getId() %>" class="btn rounded-pill text-white" style="background-color: #9b7653">Buy Now</a>
						    </div>    
		  				</div>
					</div>
				</div>
				
				<% }
			}
			%>
		
	</div>
</div>

</div>

<%@include file = "include/footer.jsp"%>
</body>
</html>