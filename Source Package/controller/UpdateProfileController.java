package controller;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.Account;
import model.Customer;

@WebServlet(name = "UpdateProfileController", urlPatterns = {"/updateProfile"})
public class UpdateProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin tài khoản từ session
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");

        if (acc != null) {
            CustomerDAO dao = new CustomerDAO();
            Customer customer = dao.getCustomerByAccountId(acc.getAccountID()); // tạo hàm này trong DAO nếu chưa có
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("/view/customer/EditProfile.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    int id = Integer.parseInt(request.getParameter("id"));
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String gender = request.getParameter("gender");

    // Giữ nguyên id và thêm accountId từ session
    HttpSession session = request.getSession();
    Account acc = (Account) session.getAttribute("account");

    if (acc != null) {
        Customer customer = new Customer(id, fullName, email, phone, address, gender);
        customer.setAccountId(acc.getAccountID()); // Đặt accountId vào đối tượng customer

        CustomerDAO dao = new CustomerDAO();
        boolean success = dao.updateCustomer(customer);

        if (success) {
            request.setAttribute("message", "Cập nhật thành công!");
        } else {
            request.setAttribute("message", "Cập nhật thất bại!");
        }

        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/view/customer/EditProfile.jsp").forward(request, response);
    } else {
        response.sendRedirect("login");
    }
}
}
