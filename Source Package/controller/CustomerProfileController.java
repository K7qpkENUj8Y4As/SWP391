package controller;

import dao.CustomerDAO;
import model.Account;
import model.Customer;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "CustomerProfileController", urlPatterns = {"/profile"})
public class CustomerProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account acc = (Account) session.getAttribute("acc");

        if (acc == null || !acc.isCustomer()) {
            resp.sendRedirect("/view/authentication/Login.jsp");
            return;
        }

        CustomerDAO dao = new CustomerDAO();
        Customer customer = dao.getCustomerByAccountId(acc.getAccountID());

        req.setAttribute("customer", customer);
        req.getRequestDispatcher("customer/profile.jsp").forward(req, resp);
    }
}
