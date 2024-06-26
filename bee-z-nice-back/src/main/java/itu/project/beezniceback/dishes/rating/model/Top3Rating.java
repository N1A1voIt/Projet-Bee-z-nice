package itu.project.beezniceback.dishes.rating.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "v_top3_dishesrating")
public class Top3Rating {
    @Id
    @JsonProperty("id")
    @Column(name = "id")
    private int id;

    @Column(name = "dishesname")
    @JsonProperty("dishesname")
    private String dishesname;

    @Column(name = "idsupplier")
    @JsonProperty("idsupplier")
    private int idsupplier;

    @Column(name = "sellingprice")
    @JsonProperty("sellingprice")
    private BigDecimal sellingprice;

    @Column(name = "purchaseprice")
    @JsonProperty("purchaseprice")
    private BigDecimal purchaseprice;

    @Column(name = "idtype")
    @JsonProperty("idtype")
    private int idtype;

    @Column(name = "image")
    @JsonProperty("image")
    private String image;

    @Column(name = "avg_mark")
    @JsonProperty("rate")
    private Double rate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDishesname() {
        return dishesname;
    }

    public void setDishesname(String dishesname) {
        this.dishesname = dishesname;
    }

    public int getIdsupplier() {
        return idsupplier;
    }

    public void setIdsupplier(int idsupplier) {
        this.idsupplier = idsupplier;
    }

    public BigDecimal getSellingprice() {
        return sellingprice;
    }

    public void setSellingprice(BigDecimal sellingprice) {
        this.sellingprice = sellingprice;
    }

    public BigDecimal getPurchaseprice() {
        return purchaseprice;
    }

    public void setPurchaseprice(BigDecimal purchaseprice) {
        this.purchaseprice = purchaseprice;
    }

    public int getIdtype() {
        return idtype;
    }

    public void setIdtype(int idtype) {
        this.idtype = idtype;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
}