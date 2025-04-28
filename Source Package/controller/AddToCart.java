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

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            // Get product ID from request
            String productIdParam = request.getParameter("productId");

            if (productIdParam == null || productIdParam.isEmpty()) {
                out.write("{\"success\":false, \"message\":\"Product ID is missing\"}");
                return;
            }

            int productId;
            try {
                productId = Integer.parseInt(productIdParam);
            } catch (NumberFormatException e) {
                out.write("{\"success\":false, \"message\":\"Invalid product ID\"}");
                return;
            }

            Product product = productDAO.getProductById2(productId);
            if (product == null) {
                out.write("{\"success\":false, \"message\":\"Product not found\"}");
                return;
            }

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
                cartItems.add(new CartItem(product, 1));
            }

            // Success JSON
            out.write("{\"success\":true, \"cartCount\":" + cartItems.size() + "}");
        }
    }
}

