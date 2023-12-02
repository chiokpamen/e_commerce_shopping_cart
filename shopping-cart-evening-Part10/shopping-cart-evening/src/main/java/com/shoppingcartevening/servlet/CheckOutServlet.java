package com.shoppingcartevening.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.shoppingcartevening.connection.DbCon;
import com.shoppingcartevening.doa.OrderDoa;
import com.shoppingcartevening.model.Cart;
import com.shoppingcartevening.model.Order;
import com.shoppingcartevening.model.User;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();

			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

			User auth = (User) request.getSession().getAttribute("auth");

			if (cart_list != null && auth != null) {

				for (Cart c : cart_list) {
					Order order = new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));

					OrderDoa oDoa = new OrderDoa(DbCon.getConnection());
					boolean result = oDoa.insertOrder(order);

					if (!result) {
						break;
					}
				}
				cart_list.clear();
				response.sendRedirect("checkout.jsp");

			} else {
				if (auth == null) {
					response.sendRedirect("login.jsp");
				}

				response.sendRedirect("cart.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

