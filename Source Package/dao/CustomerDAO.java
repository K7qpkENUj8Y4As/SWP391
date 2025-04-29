package dao;

import dbConnection.DBConnection;
import java.sql.*;
import java.util.*;
import model.Customer;

public class CustomerDAO {
    public List<Customer> getAllCustomers() {
        List<Customer> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM Customer";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt("Id"));
                c.setFullName(rs.getString("FullName"));
                c.setEmail(rs.getString("Email"));
                c.setPhone(rs.getString("Phone"));
                c.setAddress(rs.getString("Address"));
                c.setGender(rs.getString("Gender"));
                c.setAvatar(rs.getString("Avatar"));
                c.setAccountId(rs.getInt("Account_id"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
   public Customer getCustomerByAccountId(int accountId) {
    String sql = "SELECT * FROM Customer WHERE Id=?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, accountId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Customer c = new Customer();
            c.setId(rs.getInt("Id"));
            c.setFullName(rs.getString("FullName"));
            c.setEmail(rs.getString("Email"));
            c.setPhone(rs.getString("Phone"));
            c.setAddress(rs.getString("Address"));
            c.setGender(rs.getString("Gender"));
            c.setAvatar(rs.getString("Avatar"));
            c.setAccountId(accountId);
            return c;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

    
   public boolean updateCustomer(Customer customer) {
    String sql = "UPDATE Customer SET FullName=?, Email=?, Phone=?, Address=?, Gender=? WHERE Id=?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, customer.getFullName());
        ps.setString(2, customer.getEmail());
        ps.setString(3, customer.getPhone());
        ps.setString(4, customer.getAddress());
        ps.setString(5, customer.getGender());
        ps.setInt(6, customer.getId());

        int rows = ps.executeUpdate();
        return rows > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
   public void insertAccount(Customer acc) {
    String sql = "INSERT INTO Customer (Email ,FullName ,Avatar  ,Phone,isGuest ) VALUES (?, ?, ?,?,0)";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, acc.getEmail());
        ps.setString(2, acc.getFullName()); // Hash nếu cần
        ps.setString(3, "default.jsp");
        ps.setString(4, acc.getPhone());
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
}