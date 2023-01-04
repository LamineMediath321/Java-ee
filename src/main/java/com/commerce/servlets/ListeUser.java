package com.commerce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commerce.bd.UserBd;

@WebServlet("/ListeUser")
public class ListeUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ListeUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBd usersTable = new UserBd();
		request.setAttribute("users", usersTable.recupererUtilisateurs());
		this.getServletContext().getRequestDispatcher("/admin/listUser.jsp").forward(request, response);
	}


}