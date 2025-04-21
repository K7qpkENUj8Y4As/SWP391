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
        
        String action = request.getParameter("action");
        
        if (action == null || action.equals("list")) {
            List<Product> products = productDAO.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/view/productmanagement/listProduct.jsp").forward(request, response);
        } else if (action.equals("detail")) {

            int productId = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(productId);
            
           
            request.setAttribute("product", product);
            request.getRequestDispatcher("/view/productmanagement/detailProduct.jsp").forward(request, response);
        } else if (action.equals("search")) {
            // Tìm kiếm sản phẩm
            String keyword = request.getParameter("keyword");
           List<Product> products = productDAO.searchProductsByName(keyword);
            
            request.setAttribute("products", products);
            request.setAttribute("keyword", keyword);
            request.getRequestDispatcher("/view/productmanagement/listProduct.jsp").forward(request, response);
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