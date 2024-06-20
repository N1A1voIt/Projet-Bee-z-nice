package itu.project.beezniceback.benefice.models;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "foodorder")
public class FoodOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "paymenttypeid", nullable = false)
    private Integer paymentTypeId;

    @Column(name = "iddishes", nullable = false)
    private Integer idDishes;

    @Column(name = "customerid", nullable = false)
    private Long customerId;

    @Column(name = "ordertime", nullable = false)
    private LocalDateTime orderTime;

    @Column(name = "disheprice", nullable = false)
    private BigDecimal dishePrice;

    @Column(name = "dishepurchaseprice", nullable = false)
    private BigDecimal dishePurchasePrice;

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(Integer paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public Integer getIdDishes() {
        return idDishes;
    }

    public void setIdDishes(Integer idDishes) {
        this.idDishes = idDishes;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(LocalDateTime orderTime) {
        this.orderTime = orderTime;
    }

    public BigDecimal getDishePrice() {
        return dishePrice;
    }

    public void setDishePrice(BigDecimal dishePrice) {
        this.dishePrice = dishePrice;
    }

    public BigDecimal getDishePurchasePrice() {
        return dishePurchasePrice;
    }

    public void setDishePurchasePrice(BigDecimal dishePurchasePrice) {
        this.dishePurchasePrice = dishePurchasePrice;
    }
}
