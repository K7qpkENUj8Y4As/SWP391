/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import dbConnection.DBConnection;
import java.util.ArrayList;
import java.util.Date;
import model.Order;
import model.OrderItem;

/**
 *
 * @author trung
 */
public class OrderDAO {

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();

        String sql = "SELECT Id, TotalPrice, Status, CreateAt, CustomerId, deliveryStatus, Note FROM [Order]";

        try (Connection conn = new DBConnection().getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("Id"));
                o.setTotalPrice(rs.getDouble("TotalPrice"));
                o.setStatus(rs.getBoolean("Status") ? 1 : 0); // convert bit to int
                o.setCreateAt(rs.getTimestamp("CreateAt"));   // get as java.util.Date
                o.setCustomerId(rs.getInt("CustomerId"));
                o.setDeliveryStatus(rs.getString("deliveryStatus"));
                o.setNote(rs.getString("Note"));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int createOrder(Order order) {
        int generatedId = -1;
        String sql = "INSERT INTO [Order] (TotalPrice, Status, CreateAt, CustomerId, DeliveryStatus, Note) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setDouble(1, order.getTotalPrice());
            ps.setInt(2, order.getStatus());
            ps.setTimestamp(3, new java.sql.Timestamp(order.getCreateAt().getTime()));
            ps.setInt(4, order.getCustomerId());
            //    ps.setInt(5, order.getDeliveryStatus());
            ps.setString(5, order.getDeliveryStatus());

            ps.setString(6, order.getNote());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generatedId;
    }

    public void createOrderItems(List<OrderItem> items) {
        String sql = "INSERT INTO OrderItem (OrderId, ProductId, Quantity, CreateAt, Price) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            for (OrderItem item : items) {
                ps.setInt(1, item.getOrderId());
                ps.setInt(2, item.getProductId());
                ps.setInt(3, item.getQuantity());
                ps.setTimestamp(4, new java.sql.Timestamp(item.getCreateAt().getTime()));
                ps.setDouble(5, item.getPrice());
                ps.addBatch();
            }
            ps.executeBatch();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateStatus(int orderId, int status) {
        String sql = "UPDATE [Order] SET Status = ? WHERE Id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, status);
            ps.setInt(2, orderId);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateOrderStatus(int orderId, int status, String deliveryStatus) {
        String sql = "UPDATE [Order] SET Status = ?, deliveryStatus = ? WHERE Id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, status);
            ps.setString(2, deliveryStatus);
            ps.setInt(3, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Integer> getTotalOrders() {
    List<Integer> result = new ArrayList<>();
    String sql = "SELECT COUNT(*) FROM [Order]";

    try (Connection conn = new DBConnection().getConnection(); 
         PreparedStatement stmt = conn.prepareStatement(sql); 
         ResultSet rs = stmt.executeQuery()) {

        if (rs.next()) {
            result.add(rs.getInt(1)); // Add the total count to the result list
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return result;
}

public List<Integer> getPendingOrders() {
    List<Integer> result = new ArrayList<>();
    String sql = "SELECT COUNT(*) FROM [Order] WHERE deliveryStatus = 'Not Delivered'";

    try (Connection conn = new DBConnection().getConnection(); 
         PreparedStatement stmt = conn.prepareStatement(sql); 
         ResultSet rs = stmt.executeQuery()) {

        if (rs.next()) {
            result.add(rs.getInt(1)); // Add the pending orders count to the result list
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return result;
}

public List<Double> getTotalRevenue() {
    List<Double> result = new ArrayList<>();
    String sql = "SELECT SUM(TotalPrice) FROM [Order] WHERE deliveryStatus = 'Delivered'";

    try (Connection conn = new DBConnection().getConnection(); 
         PreparedStatement stmt = conn.prepareStatement(sql); 
         ResultSet rs = stmt.executeQuery()) {

        if (rs.next()) {
            result.add(rs.getDouble(1)); // Add the total revenue to the result list
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return result;
}

    
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        Date now = new Date();
        Order order = new Order();
        order.setCreateAt(now);
        order.setCustomerId(1);
        dao.createOrder(order);
    }
}
