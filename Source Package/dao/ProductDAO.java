/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductDAO {
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("Id"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getDouble("Price"));
                product.setImage(rs.getString("Image"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setDescription(rs.getString("Description"));
                product.setCreateAt(rs.getDate("CreateAt"));
                product.setQuantity(rs.getInt("Quantity"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE CategoryId = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("Id"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getDouble("Price"));
                product.setImage(rs.getString("Image"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setDescription(rs.getString("Description"));
                product.setCreateAt(rs.getDate("CreateAt"));
                product.setQuantity(rs.getInt("Quantity"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Product getProductById(int id) {
        String query = "SELECT * FROM Product WHERE Id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("Id"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getDouble("Price"));
                product.setImage(rs.getString("Image"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setDescription(rs.getString("Description"));
                product.setCreateAt(rs.getDate("CreateAt"));
                product.setQuantity(rs.getInt("Quantity"));
                
                RawDAO rawDAO = new RawDAO();
                product.setRawMaterials(rawDAO.getRawsByProductId(id));
                
                return product;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
public List<Product> getFeaturedProducts(int limit) {
    List<Product> products = new ArrayList<>();
    String query = "SELECT * FROM Product ORDER BY Id DESC LIMIT ?"; // Lấy sản phẩm mới nhất
    // Hoặc có thể dùng: "SELECT * FROM Product WHERE Featured = 1 LIMIT ?" nếu có trường Featured
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setInt(1, limit);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("Id"));
            product.setName(rs.getString("Name"));
            product.setPrice(rs.getDouble("Price"));
            product.setImage(rs.getString("Image"));
            product.setCategoryId(rs.getInt("CategoryId"));
            product.setQuantity(rs.getInt("Quantity"));
            product.setDescription(rs.getString("Description"));
            products.add(product);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return products;
}
  public List<Product> searchProductsByName(String keyword) {
    List<Product> list = new ArrayList<>();
    String query = "SELECT * FROM Product WHERE Name LIKE ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setString(1, "%" + keyword + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("Id"));
            product.setName(rs.getString("Name"));
            product.setPrice(rs.getDouble("Price"));
            product.setImage(rs.getString("Image"));
            product.setCategoryId(rs.getInt("CategoryId"));
            product.setDescription(rs.getString("Description"));
            product.setCreateAt(rs.getDate("CreateAt"));
            product.setQuantity(rs.getInt("Quantity"));
            list.add(product);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
  
  // Add a new Product
public boolean addProduct(Product product) {
    String query = "INSERT INTO Product (Name, Price, Image, CategoryId, Description, CreateAt, Quantity) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
        
        ps.setString(1, product.getName());
        ps.setDouble(2, product.getPrice());
        ps.setString(3, product.getImage());
        ps.setInt(4, product.getCategoryId());
        ps.setString(5, product.getDescription());
        ps.setDate(6, new java.sql.Date(product.getCreateAt().getTime()));
        ps.setInt(7, product.getQuantity());
        
        int affectedRows = ps.executeUpdate();
        
        if (affectedRows > 0) {
            // Get the generated product ID for potential use with raw materials
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    product.setId(generatedKeys.getInt(1));
                }
            }
            return true;
        }
        return false;
    } catch (Exception e) {
        System.out.println("Error in addProduct: " + e.getMessage());
        return false;
    }
}

// Update an existing Product
public boolean updateProduct(Product product) {
    String query = "UPDATE Product SET Name = ?, Price = ?, Image = ?, CategoryId = ?, Description = ?, Quantity = ? WHERE Id = ?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setString(1, product.getName());
        ps.setDouble(2, product.getPrice());
        ps.setString(3, product.getImage());
        ps.setInt(4, product.getCategoryId());
        ps.setString(5, product.getDescription());
        ps.setInt(6, product.getQuantity());
        ps.setInt(7, product.getId());
        
        int affectedRows = ps.executeUpdate();
        return (affectedRows > 0);
    } catch (Exception e) {
        System.out.println("Error in updateProduct: " + e.getMessage());
        return false;
    }
}

  
    public boolean deleteProduct(int productId) {
        String query = "DELETE FROM products WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, productId);

         
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
         } catch (Exception e) {
            e.printStackTrace();
           
            return false;
        } 
    }
}