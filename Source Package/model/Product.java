/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
<<<<<<< HEAD
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dung
 */



import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class Product implements Serializable {
    private int id;
    private String name;
    private double price;
    private String image;
    private int categoryId;
    private Category category;
    private String description;
    private Date createAt;
    private int quantity;
    
    private List<ProductRaw> productRaws;
    
    public Product() {
        this.productRaws = new ArrayList<>();
    }
    
    public Product(int id, String name, double price, String image, int categoryId, 
                   String description, Date createAt, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.categoryId = categoryId;
        this.description = description;
        this.createAt = createAt;
        this.quantity = quantity;
        this.productRaws = new ArrayList<>();
    }
    
    public Product(int id, String name, double price, String image, Category category, 
                   String description, Date createAt, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.category = category;
        this.categoryId = category.getId();
        this.description = description;
        this.createAt = createAt;
        this.quantity = quantity;
        this.productRaws = new ArrayList<>();
    }
    
    
    
 
    public int getId() {
        return id;
    }
    
  
    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
  
    public void setName(String name) {
        this.name = name;
    }
    
  
    public double getPrice() {
        return price;
    }
    

    public void setPrice(double price) {
        this.price = price;
    }
    
  
    public String getImage() {
        return image;
    }
    
 
    public void setImage(String image) {
        this.image = image;
    }
    
  
    public int getCategoryId() {
        return categoryId;
    }
    
 
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
  
    public Category getCategory() {
        return category;
    }
    
 
    public void setCategory(Category category) {
        this.category = category;
        if (category != null) {
            this.categoryId = category.getId();
        }
    }
    
   
    public String getDescription() {
        return description;
    }
    
 
    public void setDescription(String description) {
        this.description = description;
    }
    
   
    public Date getCreateAt() {
        return createAt;
    }
    
   
 
    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
    
  
    public int getQuantity() {
        return quantity;
    }
    
   
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    // Cập nhật cho productRaws
    public List<ProductRaw> getProductRaws() {
        return productRaws;
    }
    
    public void setProductRaws(List<ProductRaw> productRaws) {
        this.productRaws = productRaws;
    }
    
    public void addProductRaw(ProductRaw productRaw) {
        if (this.productRaws == null) {
            this.productRaws = new ArrayList<>();
        }
        this.productRaws.add(productRaw);
    }
    
 
    public List<Raw> getRawMaterials() {
        List<Raw> rawList = new ArrayList<>();
        if (productRaws != null) {
            for (ProductRaw pr : productRaws) {
                if (pr.getRaw() != null) {
                    rawList.add(pr.getRaw());
                }
            }
        }
        return rawList;
    }
    
    
    public boolean hasEnoughRawMaterials() {
        if (productRaws == null || productRaws.isEmpty()) {
            return false;
        }
        
        for (ProductRaw pr : productRaws) {
            Raw raw = pr.getRaw();
            if (raw == null || raw.getQuantity() < pr.getQuantity()) {
                return false;
            }
        }
        
        return true;
    }
    
    // Check ExpiredRaw
    public List<Raw> getExpiredRawMaterials() {
        List<Raw> expiredRaws = new ArrayList<>();
        Date currentDate = new Date();
        
        if (productRaws != null) {
            for (ProductRaw pr : productRaws) {
                Raw raw = pr.getRaw();
                if (raw != null && raw.getExpriseDate() != null && 
                    raw.getExpriseDate().before(currentDate)) {
                    expiredRaws.add(raw);
                }
            }
        }
        
        return expiredRaws;
    }
    
    
    public Product createSimilarProduct() {
        Product newProduct = new Product();
        newProduct.setName(this.name);
        newProduct.setPrice(this.price);
        newProduct.setImage(this.image);
        newProduct.setCategoryId(this.categoryId);
        newProduct.setCategory(this.category);
        newProduct.setDescription(this.description);
        newProduct.setCreateAt(new Date()); // Ngày tạo mới
        newProduct.setQuantity(0); // Số lượng ban đầu là 0
        
        //copy list ProductRaw
        if (this.productRaws != null) {
            for (ProductRaw pr : this.productRaws) {
                ProductRaw newPR = new ProductRaw();
                newPR.setRaw(pr.getRaw());
                newPR.setRawId(pr.getRawId());
                newPR.setQuantity(pr.getQuantity());
                // ProductId updtae after create product
                newProduct.addProductRaw(newPR);
            }
        }
        
        return newProduct;
    }
    
    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + 
               ", categoryId=" + categoryId + ", description=" + description + 
               ", createAt=" + createAt + ", quantity=" + quantity + '}';
    }

    public void setRawMaterials(List<Raw> rawsByProductId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
=======
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package model;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author duongngo21
 */
@WebServlet(name = "Product", urlPatterns = {"/Product"})
public class Product extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Product</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Product at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
>>>>>>> f495d42 (Fix login bug and update folder structure)
