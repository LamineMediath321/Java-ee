package com.commerce.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		Connection connexion = null;
		try {
            Class.forName("com.mysql.jdbc.Driver");
            connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "");
            PreparedStatement pst = connexion.prepareStatement("SELECT * FROM users WHERE email = ? and mot_passe = ? and estActive = ?");
            pst.setString(1, email);
            pst.setString(2, pass);
            pst.setBoolean(3, true);
            ResultSet rs= pst.executeQuery();
            if(rs.next()) {
     
            	session.setAttribute("email", email);
            	String role =(rs.getString("ROLE")!=null) ? rs.getString("ROLE") : "";
            	if(role.equals("admin")) {
            		dispatcher = request.getRequestDispatcher("admin/accesRestreint.jsp");
            		session.setAttribute("role", "admin");
            	}
            	else {
            		dispatcher = request.getRequestDispatcher("WEB-INF/index.jsp");
            		session.setAttribute("role", "");
            		//dispatcher = request.getRequestDispatcher("WEB-INF/accesRestreint.jsp");
            	}
            }else {
            	request.setAttribute("status", "echec");
            	dispatcher = request.getRequestDispatcher("login.jsp");
            }
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
        	e.printStackTrace();
        }
	}

}
