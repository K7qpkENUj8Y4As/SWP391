package controller;

import dao.CategoryDAO;
import dao.CommentDAO;
import dao.OrderItemDAO;
import dao.ProductDAO;
import dao.ProductRawDAO;
import dao.RawDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Category;
import model.Product;
import model.Raw;

/**
 * Controller class for handling product-related operations
 *
 * @author ADMIN
 */
@WebServlet(name = "ProductController", urlPatterns = {"/product"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class ProductController extends HttpServlet {

    private ProductDAO productDAO;
    private CommentDAO commentDAO;
    private OrderItemDAO orderItemDAO;
    private ProductRawDAO productRawDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

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
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO(); // Assuming you have a CategoryDAO
        RawDAO rawDAO = new RawDAO();

        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            // List all products
            List<Product> products = productDAO.getAllProducts();
            List<Category> categories = categoryDAO.getAllCategories();
            request.setAttribute("products", products);
            request.setAttribute("categories", categories);

            request.getRequestDispatcher("/view/productmanagement/manageProduct.jsp").forward(request, response);

        } else if (action.equals("detail")) {
            // Show product details
            int productId = Integer.parseInt(request.getParameter("id"));

            Product product = productDAO.getProductById(productId);

            request.setAttribute("product", product);
            request.getRequestDispatcher("/view/productmanagement/detailProduct.jsp").forward(request, response);

        } else if (action.equals("search")) {
            // Search products by name
            String keyword = request.getParameter("keyword");
            List<Product> products = productDAO.searchProductsByName(keyword);
            List<Category> categories = categoryDAO.getAllCategories();

            request.setAttribute("products", products);
            request.setAttribute("categories", categories);

            request.setAttribute("keyword", keyword);
            request.getRequestDispatcher("/view/productmanagement/manageProduct.jsp").forward(request, response);

        } else if (action.equals("showAddForm")) {
            // Show the form to add a new product
            List<Category> categories = categoryDAO.getAllCategories();
            List<Raw> rawMaterials = rawDAO.getAllRaws();

            request.setAttribute("categories", categories);
            request.setAttribute("rawMaterials", rawMaterials);
            request.getRequestDispatcher("/view/productmanagement/addProduct.jsp").forward(request, response);

        } else if (action.equals("showEditForm")) {
            // Show the form to edit an existing product
            int productId = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(productId);

            List<Category> categories = categoryDAO.getAllCategories();
            List<Raw> rawMaterials = rawDAO.getAllRaws();

            // Get raw materials used in this product with quantities
            ProductRawDAO productRawDAO = new ProductRawDAO();
            Map<Raw, Integer> productRawQuantities = productRawDAO.getRawQuantitiesForProduct(productId);

            request.setAttribute("product", product);
            request.setAttribute("categories", categories);
            request.setAttribute("rawMaterials", rawMaterials);
            request.setAttribute("productRawQuantities", productRawQuantities);
            request.getRequestDispatcher("/view/productmanagement/editProduct.jsp").forward(request, response);

        } else if (action.equals("createSimilar")) {
            // Create a similar product based on an existing one
            int originalProductId = Integer.parseInt(request.getParameter("id"));
            Product originalProduct = productDAO.getProductById(originalProductId);

            // Get categories and raw materials for dropdowns
            List<Category> categories = categoryDAO.getAllCategories();
            List<Raw> allRawMaterials = rawDAO.getAllRaws();

            // Get raw materials used in this product with quantities
            ProductRawDAO productRawDAO = new ProductRawDAO();
            Map<Raw, Integer> productRawQuantities = productRawDAO.getRawQuantitiesForProduct(originalProductId);

            // Set original product data as template for the new product
            // Note: We're setting ID to 0 to indicate this is a new product
            Product templateProduct = new Product();
            templateProduct.setId(0); // New product
            templateProduct.setName(originalProduct.getName() + " (Copy)");
            templateProduct.setPrice(originalProduct.getPrice());
            templateProduct.setImage(originalProduct.getImage()); // Will be replaced if a new image is uploaded
            templateProduct.setCategoryId(originalProduct.getCategoryId());
            templateProduct.setDescription(originalProduct.getDescription());
            templateProduct.setQuantity(0); // Start with 0 quantity for new product

            request.setAttribute("product", templateProduct);
            request.setAttribute("categories", categories);
            request.setAttribute("rawMaterials", allRawMaterials);
            request.setAttribute("productRawQuantities", productRawQuantities);
            request.setAttribute("isSimilar", true); // Flag to indicate this is a "create similar" action
            request.getRequestDispatcher("/view/productmanagement/addProduct.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        ProductDAO productDAO = new ProductDAO();
        RawDAO rawDAO = new RawDAO();
        ProductRawDAO productRawDAO = new ProductRawDAO();

        String action = request.getParameter("action");

        if (action.equals("add")) {
            try {
                // Extract product information
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                String description = request.getParameter("description");
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                // Handle image upload
                String imagePath = "default-product.jpg"; // Default image path
                Part filePart = request.getPart("image");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = getFileName(filePart);
                    if (fileName != null && !fileName.isEmpty()) {
                        // Generate unique file name to prevent overwriting
                        String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                        String uploadPath = getServletContext().getRealPath("/images/products/");

                        // Create directory if it doesn't exist
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs();
                        }

                        // Save the file
                        filePart.write(uploadPath + File.separator + uniqueFileName);
                        imagePath = "images/products/" + uniqueFileName;
                    }
                }

                // Create product object
                Product product = new Product();
                product.setName(name);
                product.setPrice(price);
                product.setImage(imagePath);
                product.setCategoryId(categoryId);
                product.setDescription(description);
                product.setCreateAt(new Date());
                product.setQuantity(quantity);

                // Get raw materials from form
                Map<Integer, Integer> rawQuantities = new HashMap<>();
                String[] rawIds = request.getParameterValues("rawId");
                String[] rawQuantityArr = request.getParameterValues("rawQuantity");

                if (rawIds != null && rawQuantityArr != null) {
                    // Check if we have enough quantity of each raw material and not expired
                    boolean insufficientRaw = false;
                    String errorMessage = "";

                    for (int i = 0; i < rawIds.length; i++) {
                        int rawId = Integer.parseInt(rawIds[i]);
                        int rawQuantityPerProduct = Integer.parseInt(rawQuantityArr[i]);

                        if (rawQuantityPerProduct <= 0) {
                            continue;
                        }
                        // Check if the raw material exists and has enough quantity
                        Raw raw = rawDAO.getRawById(rawId);
                        if (raw == null) {
                            insufficientRaw = true;
                            errorMessage = "Raw material with ID " + rawId + " does not exist.";
                            break;
                        }

                        // Check if expired
                        if (rawDAO.isExpired(rawId)) {
                            insufficientRaw = true;
                            errorMessage = "Raw material '" + raw.getName() + "' is expired.";
                            break;
                        }

                        int totalRawUsed = rawQuantityPerProduct * quantity;

                        if (!rawDAO.hasEnoughQuantity(rawId, totalRawUsed)) {
                            insufficientRaw = true;
                            errorMessage = "Insufficient quantity of raw material '" + raw.getName() + "'. Required: " + totalRawUsed + ", Available: " + raw.getQuantity();
                            break;
                        }

                        rawQuantities.put(rawId, totalRawUsed);
                    }

                    if (insufficientRaw) {
                        // Set error message and forward back to the form
                        request.setAttribute("error", errorMessage);
                        request.setAttribute("product", product);

// Load lại danh sách nguyên liệu
                        List<Raw> rawList = rawDAO.getAllRaws();
                        for (Raw raw : rawList) {
                            boolean expired = rawDAO.isExpired(raw.getId());
                            //   raw.setExpired(expired);
                        }
                        request.setAttribute("raws", rawList);

// Load lại danh sách danh mục
                        CategoryDAO categoryDAO = new CategoryDAO();
                        List<Category> categoryList = categoryDAO.getAllCategories();
                        request.setAttribute("categories", categoryList);

                        request.getRequestDispatcher("/view/productmanagement/addProduct.jsp").forward(request, response);
                        return;
                    }
                }

                // Save product to get its ID
//                if (productDAO.addProduct(product)) {
//                    // Add raw materials to the product
//                    for (Map.Entry<Integer, Integer> entry : rawQuantities.entrySet()) {
//                        int rawId = entry.getKey();
//                        int rawQuantity = entry.getValue();
//                        
//                        if (rawQuantity > 0) {
//                            productRawDAO.addProductRaw(product.getId(), rawId, rawQuantity);
//                        }
//                    }
//                    
//                    // Redirect to product list with success message
//                    response.sendRedirect(request.getContextPath() + "/product?success=Product added successfully");
//                } else {
//                    // If failed to save product
//                    request.setAttribute("error", "Failed to add product. Please try again.");
//                    request.setAttribute("product", product);
//                    request.getRequestDispatcher("/view/productmanagement/addProduct.jsp").forward(request, response);
//                }
//                
//            } catch (Exception e) {
//                e.printStackTrace();
//                request.setAttribute("error", "An error occurred: " + e.getMessage());
//                request.getRequestDispatcher("/view/productmanagement/addProduct.jsp").forward(request, response);
//            }
// Lưu sản phẩm vào cơ sở dữ liệu
                if (productDAO.addProduct(product)) {
                    // Thêm nguyên liệu thô vào sản phẩm
                    for (Map.Entry<Integer, Integer> entry : rawQuantities.entrySet()) {
                        int rawId = entry.getKey();
                        int totalRawUsed = entry.getValue();
                        //       int rawQuantity = entry.getValue();

//        if (rawQuantity > 0) {
//            productRawDAO.addProductRaw(product.getId(), rawId, rawQuantity);
//
//            // Cập nhật số lượng nguyên liệu thô sau khi sử dụng
//            boolean updated = rawDAO.updateRawQuantity(rawId, rawQuantity); // Cập nhật số lượng raw
//            if (!updated) {
//                // Nếu không thể cập nhật số lượng raw, bạn có thể hiển thị thông báo lỗi hoặc thực hiện hành động khác
//                request.setAttribute("error", "Cập nhật số lượng nguyên liệu thô không thành công.");
//                request.getRequestDispatcher("/view/productmanagement/addProduct.jsp").forward(request, response);
//                return;
//            }
//        }
//    }
                        // Add product-raw relationship
                        productRawDAO.addProductRaw(product.getId(), rawId, totalRawUsed / quantity); // chỉ lưu định mức 1 sản phẩm

                        // Trừ nguyên liệu thật trong kho
                        rawDAO.updateRawQuantity(rawId, totalRawUsed);
                    }
                    // Chuyển hướng đến danh sách sản phẩm với thông báo thành công
                    response.sendRedirect(request.getContextPath() + "/product?success=Product added successfully");
                } else {
                    // Nếu không thể lưu sản phẩm
                    request.setAttribute("error", "Failed to add product. Please try again.");
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/view/productmanagement/addProduct.jsp").forward(request, response);
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("/view/productmanagement/addProduct.jsp").forward(request, response);
            }

        } else if (action.equals("edit")) {
            try {
                // Extract product information
                int productId = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                String description = request.getParameter("description");
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                // Get the current product to get its current image path
                Product currentProduct = productDAO.getProductById(productId);
                String imagePath = currentProduct.getImage(); // Keep current image by default

                // Handle image upload if a new image is provided
                Part filePart = request.getPart("image");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = getFileName(filePart);
                    if (fileName != null && !fileName.isEmpty()) {
                        // Generate unique file name
                        String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                        String uploadPath = getServletContext().getRealPath("/images/products/");

                        // Create directory if it doesn't exist
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs();
                        }

                        // Save the file
                        filePart.write(uploadPath + File.separator + uniqueFileName);
                        imagePath = "images/products/" + uniqueFileName;
                    }
                }

                // Update product object
                Product product = new Product();
                product.setId(productId);
                product.setName(name);
                product.setPrice(price);
                product.setImage(imagePath);
                product.setCategoryId(categoryId);
                product.setDescription(description);
                product.setQuantity(quantity);
                product.setCreateAt(currentProduct.getCreateAt()); // Keep the original creation date

                // Get raw materials from form
                Map<Integer, Integer> rawQuantities = new HashMap<>();
                String[] rawIds = request.getParameterValues("rawId");
                String[] rawQuantityArr = request.getParameterValues("rawQuantity");

                if (rawIds != null && rawQuantityArr != null) {
                    // Check if we have enough quantity of each raw material and not expired
                    boolean insufficientRaw = false;
                    String errorMessage = "";

                    for (int i = 0; i < rawIds.length; i++) {
                        int rawId = Integer.parseInt(rawIds[i]);
                        int rawQuantity = Integer.parseInt(rawQuantityArr[i]);

                        // Skip if quantity is 0
                        if (rawQuantity <= 0) {
                            continue;
                        }

                        // Check if the raw material exists
                        Raw raw = rawDAO.getRawById(rawId);
                        if (raw == null) {
                            insufficientRaw = true;
                            errorMessage = "Raw material with ID " + rawId + " does not exist.";
                            break;
                        }

                        // Check if expired
                        if (rawDAO.isExpired(rawId)) {
                            insufficientRaw = true;
                            errorMessage = "Raw material '" + raw.getName() + "' is expired.";
                            break;
                        }

                        // Add to map - for updates we don't check quantity as we're defining the formula
                        rawQuantities.put(rawId, rawQuantity);
                    }

                    if (insufficientRaw) {
                        // Set error message and forward back to the form
                        request.setAttribute("error", errorMessage);
                        request.setAttribute("product", product);
                        request.getRequestDispatcher("/view/productmanagement/editProduct.jsp").forward(request, response);
                        return;
                    }
                }

                // Update product
                if (productDAO.updateProduct(product)) {
                    // Get current raw materials for this product
//                    ProductRawDAO productRawDAO = new ProductRawDAO();
                    Map<Raw, Integer> currentRawQuantities = productRawDAO.getRawQuantitiesForProduct(productId);

                    // Remove all current raw materials from product
                    for (Map.Entry<Raw, Integer> entry : currentRawQuantities.entrySet()) {
                        productRawDAO.removeProductRaw(productId, entry.getKey().getId());
                    }

                    // Add new raw materials to the product
                    for (Map.Entry<Integer, Integer> entry : rawQuantities.entrySet()) {
                        int rawId = entry.getKey();
                        int rawQuantity = entry.getValue();

                        if (rawQuantity > 0) {
                            productRawDAO.addProductRaw(productId, rawId, rawQuantity);
                        }
                    }

                    // Redirect to product list with success message
                    response.sendRedirect(request.getContextPath() + "/product?success=Product updated successfully");
                } else {
                    // If failed to update product
                    request.setAttribute("error", "Failed to update product. Please try again.");
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/view/productmanagement/editProduct.jsp").forward(request, response);
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("/view/productmanagement/editProduct.jsp").forward(request, response);
            }

//        } else if (action.equals("delete")) {
//            try {
//                int productId = Integer.parseInt(request.getParameter("id"));
//
//                // First remove all raw materials associated with this product
          ////                ProductRawDAO productRawDAO = new ProductRawDAO();
//                Map<Raw, Integer> productRawQuantities = productRawDAO.getRawQuantitiesForProduct(productId);
//                for (Map.Entry<Raw, Integer> entry : productRawQuantities.entrySet()) {
//                    productRawDAO.removeProductRaw(productId, entry.getKey().getId());
//                }
//
//                // Then delete the product itself
//                // Assuming you have a deleteProduct method in ProductDAO
//                if (productDAO.deleteProduct(productId)) {
//                    response.sendRedirect(request.getContextPath() + "/product?success=Product deleted successfully");
//                } else {
//                    response.sendRedirect(request.getContextPath() + "/product?error=Failed to delete product");
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                response.sendRedirect(request.getContextPath() + "/product?error=An error occurred: " + e.getMessage());
//            }
//        } 



//} else if (action.equals("delete")) {
//    try {
//        int productId = Integer.parseInt(request.getParameter("id"));
//
//        // Sử dụng biến productRawDAO đã được định nghĩa từ trước
//        Map<Raw, Integer> productRawQuantities = productRawDAO.getRawQuantitiesForProduct(productId);
//
//        for (Map.Entry<Raw, Integer> entry : productRawQuantities.entrySet()) {
//            productRawDAO.removeProductRaw(productId, entry.getKey().getId());
//        }
//
//        // Chỉ khởi tạo ProductDAO nếu nó chưa được định nghĩa từ trước
//        if (productDAO == null) {
//           productDAO = new ProductDAO();
//        }
//
//        if (productDAO.deleteProduct(productId)) {
//            response.sendRedirect(request.getContextPath() + "/product?success=Product deleted successfully");
//        } else {
//            response.sendRedirect(request.getContextPath() + "/product?error=Failed to delete product");
//        }
//    } catch (Exception e) {
//        e.printStackTrace();
//        response.sendRedirect(request.getContextPath() + "/product?error=An error occurred: " + e.getMessage());
//    }
//}


    
} else if (action.equals("delete")) {
            try {
                int productId = Integer.parseInt(request.getParameter("id"));

                // Xóa comment trước (nếu có FK từ Comment → Product)
                if (commentDAO == null) {
                    commentDAO = new CommentDAO();
                }
                commentDAO.deleteCommentsByProductId(productId);

                // Xóa OrderItem trước (nếu có FK từ OrderItem → Product)
                if (orderItemDAO == null) {
                    orderItemDAO = new OrderItemDAO();
                }
                orderItemDAO.deleteOrderItemsByProductId(productId);

                // Xóa ProductRaw (nếu có FK từ ProductRaw → Product)
                if (productRawDAO == null) {
                    productRawDAO = new ProductRawDAO();
                }
                Map<Raw, Integer> productRawQuantities = productRawDAO.getRawQuantitiesForProduct(productId);
                for (Map.Entry<Raw, Integer> entry : productRawQuantities.entrySet()) {
                    productRawDAO.removeProductRaw(productId, entry.getKey().getId());
                }

                // Cuối cùng, xóa Product
                if (productDAO == null) {
                    productDAO = new ProductDAO();
                }

                if (productDAO.deleteProduct(productId)) {
                    response.sendRedirect(request.getContextPath() + "/product?success=Product deleted successfully");
                } else {
                    response.sendRedirect(request.getContextPath() + "/product?error=Failed to delete product");
                }

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/product?error=An error occurred: " + e.getMessage());
            }
        } else if (action.equals("produce")) {
            try {
                int productId = Integer.parseInt(request.getParameter("id"));
                int productionQuantity = Integer.parseInt(request.getParameter("productionQuantity"));

//                ProductRawDAO productRawDAO = new ProductRawDAO();
                // Check if we can produce this quantity
                if (!productRawDAO.canMakeProduct(productId, productionQuantity)) {
                    // Get the maximum possible quantity
                    int maxPossible = productRawDAO.getMaxProductQuantityPossible(productId);

                    request.setAttribute("error", "Cannot produce " + productionQuantity
                            + " units. Maximum possible with current raw materials: " + maxPossible);
                    request.getRequestDispatcher("/view/productmanagement/produceProduct.jsp").forward(request, response);
                    return;
                }

                // Process production
                if (productRawDAO.processProduction(productId, productionQuantity)) {
                    response.sendRedirect(request.getContextPath() + "/product?success=Successfully produced "
                            + productionQuantity + " units of product");
                } else {
                    request.setAttribute("error", "Failed to process production. Please try again.");
                    request.getRequestDispatcher("/view/productmanagement/produceProduct.jsp").forward(request, response);
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("/view/productmanagement/produceProduct.jsp").forward(request, response);
            }
        }
    }

    // Utility method to extract file name from HTTP header content-disposition
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
