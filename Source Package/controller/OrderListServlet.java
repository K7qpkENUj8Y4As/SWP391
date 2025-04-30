/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Order;

/**
 *
 * @author sunny
 */
@WebServlet(name = "OrderListServlet", urlPatterns = {"/orders"})
public class OrderListServlet extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
           HttpSession session = request.getSession(false);

        // Kiểm tra session và quyền truy cập
        if (session == null || session.getAttribute("account") == null) {
            response.sendRedirect("login");
            return;
        }

        String role = (String) session.getAttribute("role");

        // Kiểm tra nếu không phải Manager hoặc Seller thì chuyển hướng về home
        if (!"Seller".equalsIgnoreCase(role) && !"Manager".equalsIgnoreCase(role)) {
            response.sendRedirect("home");
            return;
        
        }
        OrderDAO dao = new OrderDAO();
        List<Order> orders = dao.getAllOrders();
        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/view/ordermanagement/orderList.jsp").forward(request, response);
    }
    @Override
//protected void doPost(HttpServletRequest request, HttpServletResponse response)
//        throws ServletException, IOException {
//    request.setCharacterEncoding("UTF-8");
//    response.setContentType("application/json");
//    response.setCharacterEncoding("UTF-8");
//
//    try {
//        int orderId = Integer.parseInt(request.getParameter("orderId"));
//        int status = Integer.parseInt(request.getParameter("status"));
//        String deliveryStatus = request.getParameter("deliveryStatus");
//  OrderDAO dao = new OrderDAO();
//        // Call the update method with void return type
//        dao.updateOrderStatus(orderId, status, deliveryStatus);
//
//        // Send a success response
//        response.setStatus(HttpServletResponse.SC_OK);
//        response.getWriter().write("{\"message\":\"Cập nhật trạng thái thành công.\"}");
//
//    } catch (NumberFormatException e) {
//        e.printStackTrace();
//        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Định dạng dữ liệu không hợp lệ.");
//    } catch (Exception e) {
//        e.printStackTrace();
//        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình xử lý.");
//    }
//}

protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    try {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int status = Integer.parseInt(request.getParameter("status")); // giữ lại
        String deliveryStatus = request.getParameter("deliveryStatus");

        OrderDAO dao = new OrderDAO();
        dao.updateOrderStatus(orderId, status, deliveryStatus);

        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write("{\"message\":\"Cập nhật trạng thái đơn hàng thành công.\"}");

    } catch (NumberFormatException e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu không hợp lệ.");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi xử lý phía máy chủ.");
    }
}


//        OrderDAO dao = new OrderDAO();
//        boolean updated = dao.updateOrderStatus(orderId, status, deliveryStatus);
//
//        if (updated) {s
//            response.setStatus(HttpServletResponse.SC_OK);
//            response.getWriter().write("{\"message\":\"Cập nhật trạng thái thành công.\"}");
//        } else {
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không thể cập nhật trạng thái đơn hàng.");
//        }
//    } catch (NumberFormatException e) {
//        e.printStackTrace();
//        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Định dạng dữ liệu không hợp lệ.");
//    } catch (Exception e) {
//        e.printStackTrace();
//        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi trong quá trình xử lý.");
//    }
//}
}
