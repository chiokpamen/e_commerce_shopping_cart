<%@page import="com.shoppingcartevening.connection.DbCon" %>
<%@page import="com.shoppingcartevening.doa.ProductDoa" %>
<%@page import="com.shoppingcartevening.doa.OrderDoa" %>
<%@page import="com.shoppingcartevening.model.*" %>
<%@page import="java.util.*"%>
<%@page import= "java.text.DecimalFormat" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
 <%
 	DecimalFormat dcf = new DecimalFormat("#.##");
 	request.setAttribute("dcf", dcf);
 	
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
		request.setAttribute("auth", auth);
		orders = new OrderDoa(DbCon.getConnection()).userOrder(auth.getId());
		
	}else{
		//response.sendRedirect("login.jsp");
	}
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
<title>Shopping Cart - evening - orders</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body>

<div class="container">
<%@include file = "include/navbar.jsp"%>
<div class="container">
<div class ="card-header my-3">All Orders</div>
	<table class ="table table-light">
		<thead>
			<tr>
				<td scope="col">Date</td>
				<td scope="col">Name</td>
				<td scope="col">Category</td>
				<td scope="col">Quantity</td>
				<td scope="col">Price</td>
				<td scope="col">Cancel</td>
			</tr>
		</thead>
		<tbody>
		<%
		if(orders !=null){
			for(Order o:orders){%>
			<tr>
				<td><%= o.getDate()%></td>
				<td><%= o.getName()%></td>
				<td><%= o.getCategory()%></td>
				<td><%= o.getQuantity()%></td>
				<td><%=dcf.format(o.getPrice()) %> </td>
				<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>"><i class="bi bi-trash3"></i></a></td>		
			</tr>
		<%}
		}
		%>
		
		</tbody>
	
	</table>

</div>


</div>

<%@include file = "include/footer.jsp"%></body>
</html>