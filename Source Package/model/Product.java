/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
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
    private Category category;  // Đối tượng Category liên kết
    private String description;
    private Date createAt;
    private int quantity;
    private List<Raw> rawMaterials;  // Danh sách nguyên liệu của sản phẩm
    
    
    public Product() {
        this.rawMaterials = new ArrayList<>();
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
        this.rawMaterials = new ArrayList<>();
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
        this.rawMaterials = new ArrayList<>();
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
    
  
    public List<Raw> getRawMaterials() {
        return rawMaterials;
    }
    
  
    public void setRawMaterials(List<Raw> rawMaterials) {
        this.rawMaterials = rawMaterials;
    }
    
  
    public void addRawMaterial(Raw raw) {
        if (this.rawMaterials == null) {
            this.rawMaterials = new ArrayList<>();
        }
        this.rawMaterials.add(raw);
    }
    
    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + 
               ", categoryId=" + categoryId + ", description=" + description + 
               ", createAt=" + createAt + ", quantity=" + quantity + '}';
    }
}
