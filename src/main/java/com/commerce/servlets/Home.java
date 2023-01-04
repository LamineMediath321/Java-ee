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

@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Home() {
        super();
        
    }
  
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
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
