package com.commerce.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.commerce.bd.OrderBd;
import com.commerce.bd.ProductBd;

/**
 * Servlet implementation class Produits
 */
@WebServlet("/Produits")
public class Produits extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Produits() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductBd productsTable = new ProductBd();
		HttpSession session = request.getSession();
		request.setAttribute("products", productsTable.recupererProducts());
		
		String id = request.getParameter("id");
		if(id!=null) {
			OrderBd orderTable = new OrderBd();
			String email = (String) session.getAttribute("email");
			Integer product = Integer.valueOf(id);
			try {
				orderTable.addOrder(product,email);
				request.setAttribute("status", "Success");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/produits.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
