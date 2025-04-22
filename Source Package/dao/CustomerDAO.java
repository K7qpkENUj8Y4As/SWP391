package dao;

import dbConnection.DBConnection;
import model.Customer;
import java.sql.*;

public class CustomerDAO {

    public Customer getCustomerByAccountId(int accountId) {
        String sql = "SELECT * FROM Customer WHERE Account_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
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
                c.setAccountId(rs.getInt("Account_id"));
                return c;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
