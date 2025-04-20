/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

/**
 *
 * @author ADMIN
 */
public class ProductRaw implements Serializable {

    private int id;
    private int productId;
    private int rawId;
    private Product product;
    private Raw raw;

    public ProductRaw() {
    }

    public ProductRaw(int id, int productId, int rawId) {
        this.id = id;
        this.productId = productId;
        this.rawId = rawId;
    }

    public ProductRaw(int id, Product product, Raw raw) {
        this.id = id;
        this.product = product;
        this.raw = raw;
        this.productId = product.getId();
        this.rawId = raw.getId();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getRawId() {
        return rawId;
    }

    public void setRawId(int rawId) {
        this.rawId = rawId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
        if (product != null) {
            this.productId = product.getId();
        }
    }

    public Raw getRaw() {
        return raw;
    }

    public void setRaw(Raw raw) {
        this.raw = raw;
        if (raw != null) {
            this.rawId = raw.getId();
        }
    }

    @Override
    public String toString() {
        return "ProductRaw{" + "id=" + id + ", productId=" + productId + ", rawId=" + rawId + '}';
    }
}
