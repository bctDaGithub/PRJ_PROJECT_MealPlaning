/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author Cong Tuong
 */
public class Dishes {

    private String dishId;
    private String dishName;
    private String description;
    private String price;
    private String category;
    private boolean available;

    public Dishes(String dishId, String dishName, String description, String price, String category, boolean available) {
        this.dishId = dishId;
        this.dishName = dishName;
        this.description = description;
        this.price = price;
        this.category = category;
        this.available = available;
    }

    public String getDishId() {
        return dishId;
    }

    public String getDishName() {
        return dishName;
    }

    public String getDescription() {
        return description;
    }

    public String getPrice() {
        return price;
    }

    public String getCategory() {
        return category;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setDishId(String dishId) {
        this.dishId = dishId;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
}
