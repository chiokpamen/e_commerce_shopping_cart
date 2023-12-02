<div class="container">
<nav class="navbar navbar-expand-lg rounded-1"
style="background-color: #d3ab9e">
  <a class="navbar-brand ml-4" href="index.jsp">
   <img src="product-images/megastore.jpg" alt="" width="35" height="29">
  Mega Store
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home</a> 
      </li>
      <li class="nav-item">
        <a class="nav-link" href="cart.jsp"><i class="bi bi-cart2"></i><span class="badge badge-dark ">${cart_list.size()} </span></a>
      </li>
      
    
    	 <li class="nav-item">
         <a class="nav-link" href="orders.jsp">Order</a>
       </li>
        <li class="nav-item">
         <a class="nav-link" href="about.jsp">About Us</a>
       </li>
        <li class="nav-item">
         <a class="nav-link" href="contact.jsp">Contact Us</a>
       </li>
        <li class="nav-item" id="logoutBtn">
         <a class="nav-link" href="logout.jsp">Logout</a>
       </li>
    	 <li class="nav-item">
         <a class="nav-link" href="login.jsp">Login</a>
       </li>
   
    </ul>
  </div>
  
</nav>
</div>