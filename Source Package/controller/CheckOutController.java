package controller;
import dao.OrderDAO;
import dao.VNPayHelper;
import model.Account;
import model.CartItem;
import model.Customer;
import model.Order;
import model.OrderItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class CheckOutController extends HttpServlet {
    private OrderDAO orderDAO;
    @Override
    public void init() throws ServletException {
        orderDAO = new OrderDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        // Tự động fill thông tin khách hàng
        if (customer != null) {
            request.setAttribute("fullname", customer.getFullName());
            request.setAttribute("address", customer.getAddress());
            request.setAttribute("phone", customer.getPhone());
        }

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");
        double totalAmount = 0;
        if (cartItems != null) {
            for (CartItem item : cartItems) {
                totalAmount += item.getProduct().getPrice() * item.getQuantity();
            }
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("totalAmount", totalAmount);

        request.getRequestDispatcher("/view/common/CheckOut.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        Customer customer = (Customer) session.getAttribute("customer");
        if (account == null || customer == null) {
            customer = new Customer();
            customer.setFullName(request.getParameter("fullname"));
            customer.setAddress(request.getParameter("address"));
            customer.setPhone(request.getParameter("phone"));
        }
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        String note = request.getParameter("note");
        String paymentMethod = request.getParameter("paymentMethod");

        // Tính tổng tiền
        double totalAmount = 0;
        for (CartItem item : cartItems) {
            totalAmount += item.getProduct().getPrice() * item.getQuantity();
        }

        Date now = new Date();

        // Tạo Order
        Order order = new Order();
        order.setTotalPrice(totalAmount);
        order.setStatus(0); // Chưa thanh toán
        order.setDeliveryStatus(0); // Chưa giao
        order.setCreateAt(now);
        order.setCustomerId(customer.getId());
        order.setNote(note);
        int orderId = orderDAO.createOrder(order);

        // Tạo OrderItems
        List<OrderItem> orderItems = new ArrayList<>();
        for (CartItem item : cartItems) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(orderId);
            orderItem.setProductId(item.getProduct().getId());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setPrice(item.getProduct().getPrice());
            orderItem.setCreateAt(now);
            orderItems.add(orderItem);
        }
        orderDAO.createOrderItems(orderItems);

        // Xử lý theo PaymentMethod
        if ("VNPAY".equalsIgnoreCase(paymentMethod)) {
            String paymentUrl = VNPayHelper.createPaymentUrl(order);
            response.sendRedirect(paymentUrl);
        } else {
            // Thanh toán COD
            session.removeAttribute("cartItems");
            session.removeAttribute("totalAmount");

            request.setAttribute("message", "Đặt hàng thành công! Thanh toán khi nhận hàng.");
            request.getRequestDispatcher("/view/common/PaymentResult.jsp").forward(request, response);
        }
    }
}
