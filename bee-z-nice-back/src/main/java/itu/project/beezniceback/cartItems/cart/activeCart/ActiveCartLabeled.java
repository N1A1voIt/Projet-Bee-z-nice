package itu.project.beezniceback.cartItems.cart.activeCart;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.hibernate.annotations.Immutable;

import java.math.BigDecimal;

@Entity
@Table(name = "v_active_cart_labeled")
@Immutable
public class ActiveCartLabeled {
    @Id
    @Column(name = "id")
    private Long id;
    @Column(name = "iduser")
    private Long iduser;
    @Column(name = "iddishe")
    private int idDishe;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "image")
    private String image;
    @Column(name = "dishesname")
    private String dishesName;
    @Column(name = "sellingprice")
    private BigDecimal sellingPrice;
    @Column(name = "purchaseprice")
    private BigDecimal purchasePrice;
    @Column(name = "namesupplier")
    private String nameSupplier;
    @Column(name = "libelle")
    private String libelle;

    public String getNameSupplier() {
        return nameSupplier;
    }

    public void setNameSupplier(String nameSupplier) {
        this.nameSupplier = nameSupplier;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIduser() {
        return iduser;
    }

    public void setIduser(Long iduser) {
        this.iduser = iduser;
    }

    public int getIdDishe() {
        return idDishe;
    }

    public void setIdDishe(int idDishe) {
        this.idDishe = idDishe;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDishesName() {
        return dishesName;
    }

    public void setDishesName(String dishesName) {
        this.dishesName = dishesName;
    }

    public BigDecimal getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(BigDecimal sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public BigDecimal getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(BigDecimal purchasePrice) {
        this.purchasePrice = purchasePrice;
    }
}
