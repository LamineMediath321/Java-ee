package com.commerce.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/register")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/registration.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String contact = request.getParameter("contact");
		RequestDispatcher dispatcher = null;
		Connection connexion = null;
		 try {
	            Class.forName("com.mysql.jdbc.Driver");
	            connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "");
	           
	            PreparedStatement pst = connexion.prepareStatement("SELECT * FROM users WHERE email = ?");
	            pst.setString(1, email);
	            ResultSet rs= pst.executeQuery();
	         
	            if(rs.next()) {
	            	request.setAttribute("status", "echec");
	            	dispatcher = request.getRequestDispatcher("registration.jsp");
	            }else {
	            	
	            	pst = connexion.prepareStatement("INSERT INTO users(nom, prenom,email,mot_passe,telephone,estActive,role) VALUES(?, ?, ?, ?, ?, ?, ?);");
		            pst.setString(1, nom);
		            pst.setString(2, prenom);
		            pst.setString(3, email);
		            pst.setString(4, pass);
		            pst.setString(5, contact);
		            pst.setBoolean(6, true);
		            pst.setString(7, "user");
		            int rowCount = pst.executeUpdate();
		            dispatcher = request.getRequestDispatcher("registration.jsp");
		            if(rowCount>0) {
		            	request.setAttribute("status","succes");
		            }
		            else {
		            	request.setAttribute("status","echec");
		            }
		           dispatcher.forward(request, response);
	            }
	            dispatcher.forward(request, response);
	            
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }finally {
	        	if(connexion!=null) {
	        		try {
						connexion.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	        	}
	        }
	}

}
