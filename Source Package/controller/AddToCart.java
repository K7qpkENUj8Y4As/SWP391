/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.Product;

/**
 *
 * @author trung
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {
 private ProductDAO productDAO = new ProductDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Get product ID from request
            int productId = Integer.parseInt(request.getParameter("productId"));
            
            // Get or create cart in session
            HttpSession session = request.getSession();
            List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");
            
            if (cartItems == null) {
                cartItems = new ArrayList<>();
                session.setAttribute("cart", cartItems);
            }
            
            // Check if product already exists in cart
            boolean productExists = false;
            for (CartItem item : cartItems) {
                if (item.getProduct().getId() == productId) {
                    item.setQuantity(item.getQuantity() + 1);
                    productExists = true;
                    break;
                }
            }
            
            // If product not in cart, add new item
            if (!productExists) {
                Product product = productDAO.getProductById(productId);
                if (product != null) {
                    cartItems.add(new CartItem(product, 1));
                } else {
                    throw new ServletException("Product not found");
                }
            }
            
            // Return success response
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"success\", \"cartCount\":" + cartItems.size() + "}");
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }
}
