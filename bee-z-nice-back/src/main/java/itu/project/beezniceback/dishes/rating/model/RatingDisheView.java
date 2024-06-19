package itu.project.beezniceback.dishes.rating.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import itu.project.beezniceback.dishes.model.Dishes;
import jakarta.persistence.Column;

import java.math.BigDecimal;

public class RatingDisheView {
    @JsonProperty("id")
    private int id;
    //dishesname
    @JsonProperty("dishesname")
    private String dishesname;
    //idsupplier
    @JsonProperty("idsupplier")
    private int idsupplier;
    //sellingprice
    @JsonProperty("sellingprice")
    private BigDecimal sellingprice;
    //purchaseprice
    @JsonProperty("purchaseprice")
    private BigDecimal purchaseprice;
    //idtype
    @JsonProperty("idtype")
    private int idtype;
    //image
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

    public RatingDisheView(int id, String dishesname, int idsupplier, BigDecimal sellingprice, BigDecimal purchaseprice, int idtype, String image, int rate) {
        this.id = id;
        this.dishesname = dishesname;
        this.idsupplier = idsupplier;
        this.sellingprice = sellingprice;
        this.purchaseprice = purchaseprice;
        this.idtype = idtype;
        this.image = image;
        this.rate = rate;
    }
    public RatingDisheView(Dishes dishes,int rate){
        this.setId(dishes.getId());
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
}
