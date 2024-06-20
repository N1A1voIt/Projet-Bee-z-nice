package itu.project.beezniceback.dishes.rating.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import itu.project.beezniceback.dishes.model.Dishes;
import jakarta.persistence.Column;

import java.math.BigDecimal;

public class RatingDisheView {
    @JsonProperty("id")
    private Long id;
    @JsonProperty("iddishe")
    private int iddishe;

    public int getIddishe() {
        return iddishe;
    }

    public void setIddishe(int iddishe) {
        this.iddishe = iddishe;
    }

    @JsonProperty("dishesname")
    private String dishesname;

    @JsonProperty("idsupplier")
    private int idsupplier;

    @JsonProperty("sellingprice")
    private BigDecimal sellingprice;

    @JsonProperty("purchaseprice")
    private BigDecimal purchaseprice;

    @JsonProperty("idtype")
    private int idtype;

    @JsonProperty("image")
    private String image;

    @JsonProperty("rate")
    private int rate;

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public RatingDisheView(Long id, int iddishe,String dishesname, int idsupplier, BigDecimal sellingprice, BigDecimal purchaseprice, int idtype, String image, int rate) {
        this.id = id;
        this.iddishe = iddishe;
        this.dishesname = dishesname;
        this.idsupplier = idsupplier;
        this.sellingprice = sellingprice;
        this.purchaseprice = purchaseprice;
        this.idtype = idtype;
        this.image = image;
        this.rate = rate;
    }
    public RatingDisheView(Dishes dishes,int rate){
        this.setIddishe(dishes.getId());
        this.setDishesname(dishes.getDishesname());
        this.setIdsupplier(dishes.getIdsupplier());
        this.setIdtype(dishes.getIdtype());
        this.setPurchaseprice(dishes.getPurchaseprice());
        this.setSellingprice(dishes.getSellingprice());
        this.setImage(dishes.getImage());
        this.setRate(rate);
    }
    public RatingDisheView(){

    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
}
