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
  <div class="card-header">
    <h5 class="card-title">Connect with Us</h5>
  </div>
  <div class="card-body">
    
    <p class="card-text">Join our community of fashion enthusiasts! Follow us on social media for the 
    latest updates, styling tips, and exclusive promotions. We love hearing from our customers, so feel
     free to reach out with any questions or feedback.
</p>
     <h5 class="card-title">....</h5>
    <p class="card-text">Thank you for choosing Mega Store as your fashion destination. 
    Happy shopping, and here's to expressing your unique style with confidence!
</p>

<!-- Wrapper container -->
<div class="container py-4">

  <!-- Bootstrap 5 starter form -->
  <form id="contactForm">

    <!-- Name input -->
    <div class="mb-3">
      <label class="form-label" for="name"></label>
      <input class="form-control" id="name" type="text" placeholder="Name" data-sb-validations="required" />
    </div>

    <!-- Email address input -->
    <div class="mb-3">
      <label class="form-label" for="emailAddress"></label>
      <input class="form-control" id="emailAddress" type="email" placeholder="Email Address" data-sb-validations="required, email" />
    </div>

    <!-- Message input -->
    <div class="mb-3">
      <label class="form-label" for="message"></label>
      <textarea class="form-control" id="message" type="text" placeholder="Message" style="height: 10rem;" data-sb-validations="required"></textarea>
    </div>


  </form>

    <!-- Form submit button -->
    <div >
      <button class="btn " type="submit" style="background-color: #d3ab9e">Submit</button>
    </div>

</div>
     
 
  </div>
</div>
</div>
</div>


<%@include file = "include/footer.jsp"%></body>
</html>