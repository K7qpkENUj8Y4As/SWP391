/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DashboardController", urlPatterns = {"/dashboard"})
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Nếu chưa login hoặc không phải Manager/Admin/Seller thì chặn
        if (session == null || session.getAttribute("account") == null) {
            response.sendRedirect("login");
            return;
        }

        String role = (String) session.getAttribute("role");
        if (role == null || role.equalsIgnoreCase("Customer")) {
            response.sendRedirect("home");
            return;
        }

        // Nếu hợp lệ thì forward tới dashboard.jsp
        request.getRequestDispatcher("/view/dashboard/dashboard.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "DashboardController for Manager/Admin/Seller.";
    }
}
