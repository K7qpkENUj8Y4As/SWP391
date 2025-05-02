/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Order;

/**
 *
 * @author sunny
 */
@WebServlet(name = "ViewOrdersServlet", urlPatterns = {"/view-order"})
public class ViewOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
          HttpSession session = request.getSession();
        // Lấy tài khoản đăng nhập từ session
        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Lấy đơn hàng theo accountID (chính là CustomerId trong bảng Order)
            OrderDAO orderDAO = new OrderDAO();
            List<Order> orders = orderDAO.getOrdersByCustomerId(account.getAccountID());

            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/view/customer/view_orders.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Không thể lấy danh sách đơn hàng.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}