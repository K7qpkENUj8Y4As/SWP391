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
import java.util.List;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        ProductDAO productDAO = new ProductDAO();
       // CommentDAO commentDAO = new CommentDAO(); // Nếu bạn muốn hiển thị bình luận
        
        String action = request.getParameter("action");
        
        if (action == null || action.equals("list")) {
            // Hiển thị tất cả sản phẩm
            List<Product> products = productDAO.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("product-list.jsp").forward(request, response);
        } else if (action.equals("detail")) {
            // Hiển thị chi tiết sản phẩm
            int productId = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(productId);
            
            // Lấy bình luận nếu cần
            // List<Comment> comments = commentDAO.getCommentsByProductId(productId);
            
            request.setAttribute("product", product);
            // request.setAttribute("comments", comments);
            request.getRequestDispatcher("product-detail.jsp").forward(request, response);
        } else if (action.equals("search")) {
            // Tìm kiếm sản phẩm
            String keyword = request.getParameter("keyword");
           List<Product> products = productDAO.searchProductsByName(keyword);
            
            request.setAttribute("products", products);
            request.setAttribute("keyword", keyword);
            request.getRequestDispatcher("product-list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}