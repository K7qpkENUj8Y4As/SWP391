/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class OrderItemDAO {
    public boolean deleteOrderItemsByProductId(int productId) {
    String query = "DELETE FROM OrderItem WHERE ProductId = ?";
    try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

        ps.setInt(1, productId);
        int rowsDeleted = ps.executeUpdate();
        System.out.println("Order items deleted: " + rowsDeleted);
        return rowsDeleted > 0;

    } catch (SQLException e) {
        System.out.println("Error deleting order items: " + e.getMessage());
        return false;
    }
}

}
