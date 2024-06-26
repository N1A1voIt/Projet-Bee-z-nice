package itu.project.beezniceback.customersmoney;

import java.time.LocalDateTime;

public class PayDto {
    private LocalDateTime orderDate;

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public PayDto() {
    }

    public PayDto(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }
}
