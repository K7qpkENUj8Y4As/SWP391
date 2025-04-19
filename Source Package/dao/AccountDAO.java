/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author trung
 */
public class AccountDAO {
 


    
  public boolean registerCustomer(String username, String password, String email, String address) {
        String insertAccountSQL = "INSERT INTO Account (Username, Password, Role, Status) VALUES (?, ?, ?, ?)";
        String insertCustomerSQL = "INSERT INTO Customer (Email, Address, Avatar, AccountID) VALUES (?, ?, ?, ?)";

        try (Connection conn = new DBConnection().getConnection()) {
            conn.setAutoCommit(false);

            // 1. Tạo account
            PreparedStatement psAcc = conn.prepareStatement(insertAccountSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            psAcc.setString(1, username);
            psAcc.setString(2, password); 
            psAcc.setString(3, "customer"); 
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
            psCus.setString(2, address);
            psCus.setString(3, "default.jpg"); // Avatar mặc định
            psCus.setInt(4, accId);
            psCus.executeUpdate();

            conn.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
