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
}