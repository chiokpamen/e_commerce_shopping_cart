<%@page import="com.shoppingcartevening.connection.DbCon" %>
<%@page import="com.shoppingcartevening.doa.ProductDoa" %>
<%@page import="com.shoppingcartevening.model.*" %>
<%@page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
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
<title>Shopping Cart - evening- login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body>
<div class="container">
<%@include file = "include/navbar.jsp"%>
	<div class="container mt-5">
	<div class="card text-center">
  <div class="card-header" style="background-color: #d3ab9e">
    About Us
  </div>
  <div class="card-body">
    <h5 class="card-title">Welcome To Mega Store</h5>
    <p class="card-text">At Mega Store, we believe that fashion is a statement, a form of self-expression 
    that empowers individuals to embrace their unique style. Our online platform is more than just a marketplace;
     it's a destination where fashion enthusiasts and trendsetters come together to discover the latest styles 
     and curated collections.</p>
     <h5 class="card-title mt-5">Our Story</h5>
    <p class="card-text">Established with a passion for fashion, Mega Store was born from the idea that 
    shopping for clothing should be an enjoyable and inspiring experience. We set out to create a space 
    where fashion meets convenience, offering a carefully curated selection of clothing that reflects 
    the diversity of styles in today's dynamic world.</p>
     
    <a href="index.jsp" class="btn" style="background-color: #d3ab9e">Continue Shopping</a>
  </div>
</div>
</div>
</div>


<%@include file = "include/footer.jsp"%></body>
</html>