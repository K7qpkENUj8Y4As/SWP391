package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import model.Category;
import model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", urlPatterns = {"/category"})
public class CategoryController extends HttpServlet {

    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        categoryDAO = new CategoryDAO();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "list"; // mặc định là list
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCategory(request, response);
                break;
            case "view":
                viewCategoryProducts(request, response);
                break;
            default:
                listCategories(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                insertCategory(request, response);
                break;
            case "edit":
                updateCategory(request, response);
                break;
            default:
                response.sendRedirect("category?action=list");
                break;
        }
    }

    // ================= Các hàm xử lý ==================

    private void listCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/view/categorymanagement/listCategory.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/categorymanagement/createCategory.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category existingCategory = categoryDAO.getCategoryById(id);
        request.setAttribute("category", existingCategory);
        request.getRequestDispatcher("/view/categorymanagement/editCategory.jsp").forward(request, response);
    }

    private void insertCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String name = request.getParameter("name");
        Category newCategory = new Category();
        newCategory.setName(name);

        categoryDAO.addCategory(newCategory);
        response.sendRedirect("category?action=list");
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");

        Category category = new Category();
        category.setId(id);
        category.setName(name);

        categoryDAO.updateCategory(category);
        response.sendRedirect("category?action=list");
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        categoryDAO.deleteCategory(id);
        response.sendRedirect("category?action=list");
    }

    private void viewCategoryProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
        Category category = categoryDAO.getCategoryById(categoryId);
        List<Product> products = productDAO.getProductsByCategoryId(categoryId);

        request.setAttribute("category", category);
        request.setAttribute("products", products);
        request.getRequestDispatcher("/view/categorymanagement/listCategory.jsp").forward(request, response);
    }
}
