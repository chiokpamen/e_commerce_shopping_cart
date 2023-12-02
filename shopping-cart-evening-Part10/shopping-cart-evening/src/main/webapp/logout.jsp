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
<div class="container mt-5"       >
<div class="card w-75 mt-10 text-center"           style="background-color: #929fba">
  <div class="card-body">
    <h5 class="card-title">You have successfully logged out</h5>
    <p class="card-text">Thanks for visiting us.</p>
    <a href="login.jsp" class="btn btn-primary ">Login</a>
  </div>
</div>

</div>


</body>

</html>