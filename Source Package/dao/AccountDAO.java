/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author trung
 */
public class AccountDAO {

    public void insertAccount(Account acc) {
    String sql = "INSERT INTO Account (username, password, role, status,isCustomer) VALUES (?, ?, ?, ?,0)";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, acc.getUsername());
        ps.setString(2, acc.getPassword()); // Hash nếu cần
        ps.setString(3, acc.getRole());
        ps.setInt(4, acc.getStatus());
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    public void updateAccountStatus(int accountID, int status) {
    String sql = "UPDATE Account SET status = ? WHERE Id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, status);
        ps.setInt(2, accountID);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
 public List<Account> getAllAccount() {
    List<Account> list = new ArrayList<>();
    String query = "SELECT * FROM Account";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Account account = new Account();
            account.setAccountID(rs.getInt("ID"));
            account.setUsername(rs.getString("username"));
            account.setPassword(rs.getString("password"));
            account.setRole(rs.getString("role"));
            account.setStatus(rs.getInt("status"));
            account.setIsCustomer(rs.getInt("isCustomer"));
            
            list.add(account);
        }
    } catch (SQLException e) {
        System.out.println("Error in getAllAccount: " + e.getMessage());
    }
    
    return list;
}

 public List<Account> getAllAccount1() {
    List<Account> list = new ArrayList<>();
    String query = "SELECT * FROM Account WHERE role IN ('STAFF', 'CUSTOMER')";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Account account = new Account();
            account.setAccountID(rs.getInt("ID"));
            account.setUsername(rs.getString("username"));
            account.setPassword(rs.getString("password"));
            account.setRole(rs.getString("role"));
            account.setStatus(rs.getInt("status"));
            account.setIsCustomer(rs.getInt("isCustomer"));
            
            list.add(account);
        }
    } catch (SQLException e) {
        System.out.println("Error in getAllAccount: " + e.getMessage());
    }
    
    return list;
}


    
  public boolean registerCustomer(String username, String password, String email, String fullName) {
        String insertAccountSQL = "INSERT INTO Account (Username, Password, Role, Status, isCustomer) VALUES (?, ?, ?, ?,1)";
        String insertCustomerSQL = "INSERT INTO Customer (Email ,FullName ,Avatar ,Account_ID ,Phone,isGuest ) VALUES (?, ?, ?, ?,?,0)";

        try (Connection conn = new DBConnection().getConnection()) {
            conn.setAutoCommit(false);

            // 1. Tạo account
            PreparedStatement psAcc = conn.prepareStatement(insertAccountSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            psAcc.setString(1, username);
            psAcc.setString(2, password); 
            psAcc.setString(3, "CUSTOMER"); 
            psAcc.setInt(4, 1); 
            psAcc.executeUpdate();

            ResultSet rs = psAcc.getGeneratedKeys();
            int accId = -1;
            if (rs.next()) {
                accId = rs.getInt(1);
            } else {
                conn.rollback();
                return false;
            }

            // 2. Tạo customer
            PreparedStatement psCus = conn.prepareStatement(insertCustomerSQL);
            psCus.setString(1, email);
            psCus.setString(2, fullName);
            psCus.setString(3, "default.jpg"); // Avatar mặc định
            psCus.setInt(4, accId);
            psCus.setString(5, username);
            psCus.executeUpdate();

            conn.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
   public boolean isEmailExists( String email) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM Customer WHERE  email = ? ";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Nếu số lượng > 0 thì user/email đã tồn tại
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

  public Account login(String username, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Account account = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM Account WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                account = new Account();
                account.setAccountID(rs.getInt("id"));
                account.setUsername(rs.getString("username"));
                account.setStatus(rs.getInt("status"));
                account.setPassword(rs.getString("password"));
                account.setRole(rs.getString("role"));
            }
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }

        return account;
    }
 public boolean isPhoneExists(String username) {
       try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM Account WHERE  username = ? ";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Nếu số lượng > 0 thì user/email đã tồn tại
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

 public static void main(String[] args) throws SQLException {
       AccountDAO dao=new AccountDAO();
       HashUtilDAO hash=new HashUtilDAO();
      Account acc =dao.login("0323456789", hash.md5("123abcABC@"));
      System.out.println(acc.getUsername());
      System.out.println("what");}
}
