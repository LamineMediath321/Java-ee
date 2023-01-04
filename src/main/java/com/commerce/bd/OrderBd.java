package com.commerce.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jni.User;

import com.commerce.bean.Order;
import com.commerce.bean.Product;
import com.commerce.bean.Utilisateur;

public class OrderBd {
    private Connection connexion;
    
    public List<Order> recupererOrders() {
        List<Order> orders = new ArrayList<Order>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT DISTINCT o.id,nom,prenom,telephone,label,email,user,product,price FROM orders o,users u, products p WHERE o.user=u.id AND o.product=p.id ;");

            // Récupération des données
            while (resultat.next()) {
                Integer id = resultat.getInt("id");
                Integer userId = resultat.getInt("user");
                Integer productId = resultat.getInt("product");
                String email = resultat.getString("email");
                String nom = resultat.getString("nom");
                String prenom = resultat.getString("prenom");
                String telephone = resultat.getString("telephone");
                String label = resultat.getString("label");
                String price = resultat.getString("price");
                
                
                //Objet Utilisateur
                Utilisateur user = new Utilisateur();
                user.setEmail(email);
                user.setNom(nom);
                user.setPrenom(prenom);
                user.setTelephone(telephone);
                //Objet Product
                Product product = new Product();
                product.setLabel(label);
                product.setPrice(price);
                
                Order order = new Order();
                order.setId(id);
                order.setUser(user);
                order.setProduct(product);
               
                orders.add(order);
            }
        } catch (SQLException e) {
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (statement != null)
                    statement.close();
                if (connexion != null)
                    connexion.close();
            } catch (SQLException ignore) {
            }
        }
        
        return orders;
    }
    
    private void loadDatabase() {
        // Chargement du driver
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }

        try {
            connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void addOrder(Integer product ,String email) throws SQLException {
        loadDatabase();
        Order order = new Order();
        PreparedStatement pst = null;
		try {
			pst = connexion.prepareStatement("SELECT * FROM users WHERE email = ?");
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
        try {
			pst.setString(1, email);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        ResultSet rs = null;
		try {
			rs = pst.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
     
        if(rs.next()) {
        	Integer user = rs.getInt("id");
        	try {
                PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO orders(user, product) VALUES(?, ?);");
                preparedStatement.setInt(1, user);
                preparedStatement.setInt(2, product);
                
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
    }
}