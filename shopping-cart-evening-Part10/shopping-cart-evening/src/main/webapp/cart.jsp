<%@page import="com.shoppingcartevening.connection.DbCon"%>
<%@page import="com.shoppingcartevening.doa.ProductDoa"%>
<%@page import="com.shoppingcartevening.model.*"%>
<%@page import="java.util.*"%>
<%@page import= "java.text.DecimalFormat" %>


    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User)request.getSession().getAttribute("auth");
    if(auth !=null){
    	request.setAttribute("person",auth);
    }
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if(cart_list != null){
		ProductDoa pDoa = new ProductDoa(DbCon.getConnection());
		cartProduct = pDoa.getCartProducts(cart_list);
		double total = pDoa.getTotalCartPrice(cart_list);
		request.setAttribute("cart_list", cart_list);
		request.setAttribute("total", total);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Shopping Cart</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<style type="text/css">
.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow : none;
font-size: 25px;
}


</style>



</head>
<body>
<div class="container">
<%@include file = "include/navbar.jsp"%>
<div class ="container my-3">

				<table class = "table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			
			<tbody>
			<%
			if(cart_list != null){
				for(Cart c: cartProduct){%>
					<tr>
					<td><%=c.getName() %></td>
					<td><%=c.getCategory() %></td>
					<td><%=dcf.format(c.getPrice()) %> </td>
					<td>
					<form action="order-now" method="post" class="form-inline">
			<input type ="hidden" name="id" value ="<%=c.getId() %>" class="form-input">
			<div class = "form-group d-flex justify-content-between w-50">
			<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%= c.getId()%>"><i class= "fas fa-minus-square"></i></a>
			<input type="text" name="quantity" class="form-control w-50" value="<%=c.getQuantity() %>" readonly>
			<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%= c.getId()%>"><i class="fas fa-plus-square"></i></a>
			</div>
			<button type="submit" class="btn btn-sm text-white" style="background-color: #9b7653">Buy</button>
			</form>
						</td>
						<td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%=c.getId()%>"><i class="fa fa-trash"></i></a></td>
				
				 </tr>
				<%}
			}
			
			%>
		
			</tbody>
			</table>
			<div class="d-flex py-3"><h3>Total Price:$ ${(total>0)?dcf.format(total):0}</h3><a class="mx-3 btn " style="background-color: #d3ab9e" href="cart-check-out">Check Out</a></div>
	
		</div>


</div>


<%@include file = "include/footer.jsp"%></body>
</html>