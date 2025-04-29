/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderItemDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.OrderItem;

/**
 *
 * @author sunny
 */
@WebServlet(name = "OrderItemsController", urlPatterns = {"/OrderItems"})
public class OrderItemsController extends HttpServlet {

 
    @Override


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderIdParam = request.getParameter("orderId");

        if (orderIdParam == null || orderIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing orderId parameter.");
            return;
        }

        try {
            int orderId = Integer.parseInt(orderIdParam);

            OrderItemDAO orderitemdao = new OrderItemDAO();
            List<OrderItem> orderItems = orderitemdao.getOrderItemsByOrderId(orderId);

            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            for (OrderItem item : orderItems) {
                out.println("<tr>");
                out.println("<td>" + item.getProductName() + "</td>");
                out.println("<td>" + item.getProductId() + "</td>");
                out.println("<td>" + item.getQuantity() + "</td>");
                out.println("<td>" + item.getPrice() + " đ</td>");
                out.println("<td>" + (item.getQuantity() * item.getPrice()) + " đ</td>");
                out.println("</tr>");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid orderId parameter.");
        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage(), e);
        }
    }
    }