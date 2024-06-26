package itu.project.beezniceback.customersquery.model;

import java.time.LocalDateTime;

public class ValidationDTO {
    int id;
    LocalDateTime orderDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public ValidationDTO() {
    }

    public ValidationDTO(int id, LocalDateTime orderDate) {
        this.id = id;
        this.orderDate = orderDate;
    }
}
