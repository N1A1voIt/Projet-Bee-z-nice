package itu.project.beezniceback.chiffreaffaires.model;

import java.sql.Timestamp;

import jakarta.persistence.*;

@Entity
@Table(name="foodOrder")
public class FoodOrder {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    
    @Column(name = "payementTypeId")
    private int payementTypeId;

    @Column(name = "idDishes")
    private int idDishes;

    @Column(name = "customerId")
    private int customerId;

    @Column(name = "orderTime")
    private Timestamp orderTime;

    @Column(name = "dishePrice")
    private Double dishePrice;

    @Column(name = "dishePurchasePrice")
    private Double dishePurchasePrice;

    public FoodOrder(long id, int payementTypeId, int idDishes, int customerId, Timestamp orderTime, Double dishePrice,
            Double dishePurchasePrice) {
        this.id = id;
        this.payementTypeId = payementTypeId;
        this.idDishes = idDishes;
        this.customerId = customerId;
        this.orderTime = orderTime;
        this.dishePrice = dishePrice;
        this.dishePurchasePrice = dishePurchasePrice;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getPayementTypeId() {
        return payementTypeId;
    }

    public void setPayementTypeId(int payementTypeId) {
        this.payementTypeId = payementTypeId;
    }

    public int getIdDishes() {
        return idDishes;
    }

    public void setIdDishes(int idDishes) {
        this.idDishes = idDishes;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    public Double getDishePrice() {
        return dishePrice;
    }

    public void setDishePrice(Double dishePrice) {
        this.dishePrice = dishePrice;
    }

    public Double getDishePurchasePrice() {
        return dishePurchasePrice;
    }

    public void setDishePurchasePrice(Double dishePurchasePrice) {
        this.dishePurchasePrice = dishePurchasePrice;
    }

    



}
