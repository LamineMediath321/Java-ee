package com.commerce.servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AddProduit
 */
@WebServlet("/AddProduit")
@MultipartConfig
public class AddProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/admin/addnew.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Part file = request.getPart("image");
		String imageFileName = file.getSubmittedFileName();
		String uploadPath = "C:/Users/lamzo/Documents/java/e_commerce/src/main/webapp/public/uploads/"+imageFileName;
		System.out.println(uploadPath);
		try {
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = file.getInputStream();
			
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		//With the database 
		Connection connexion = null;
		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "");
            
            //The values from form
            String label = request.getParameter("label");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String stock = request.getParameter("stock");
            
            PreparedStatement pst = connexion.prepareStatement("INSERT INTO products(label,description,price,stock,	image) VALUES(?, ?, ? ,? ,?) ");
            pst.setString(1, label);
            pst.setString(2, description);
            pst.setString(3, price);
            pst.setString(4, stock);
            pst.setString(5, imageFileName);
            int rowCount = pst.executeUpdate();
            if(rowCount>0) {
                request.setAttribute("label", label);
            	request.setAttribute("description", description);
            	request.setAttribute("price", price);
            	request.setAttribute("stock", stock);
            	request.setAttribute("image", imageFileName);
            	dispatcher = request.getRequestDispatcher("singleProduct.jsp");
            }
            else {
            	dispatcher = request.getRequestDispatcher("addnew.jsp");
            }
            dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
			
		
	}

}
