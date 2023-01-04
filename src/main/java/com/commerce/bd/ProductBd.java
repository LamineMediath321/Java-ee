package com.commerce.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.commerce.bean.Product;

public class ProductBd {
    private Connection connexion;
    
    public List<Product> recupererProducts() {
        List<Product> products = new ArrayList<Product>();
        Statement statement = null;
        ResultSet resultat = null;

        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("SELECT id, label, description, price, stock, image FROM products;");

            // Récupération des données
            while (resultat.next()) {
            	Integer id = resultat.getInt("id");
                String label = resultat.getString("label");
                String description = resultat.getString("description");
                String price = resultat.getString("price");
                String stock = resultat.getString("stock");
                String image = resultat.getString("image");
                
                Product product = new Product();
                product.setId(id);
                product.setLabel(label);
                product.setDescription(description);
                product.setPrice(price);
                product.setStock(stock);
                product.setImage(image);
               
                
                products.add(product);
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
        
        return products;
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
}