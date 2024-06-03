package itu.project.beezniceback.dishes.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;



import java.math.BigDecimal;


@Entity
@Immutable
@Table(name = "v_dishes")
public class DishesView{
//id
@Id
@Column(name = "id")
private int id;
//dishesname
@Column(name = "dishesname")
private String dishesname;
//namesupplier
@Column(name = "namesupplier")
private String namesupplier;
//sellingprice
@Column(name = "sellingprice")
private BigDecimal sellingprice;
//purchaseprice
@Column(name = "purchaseprice")
private BigDecimal purchaseprice;
//libelle
@Column(name = "libelle")
private String libelle;
//image
@Column(name = "image")
private String image;

  public int getId(){
      return this.id;
}

  public String getDishesname(){
      return this.dishesname;
}

  public String getNamesupplier(){
      return this.namesupplier;
}

  public BigDecimal getSellingprice(){
      return this.sellingprice;
}

  public BigDecimal getPurchaseprice(){
      return this.purchaseprice;
}

  public String getLibelle(){
      return this.libelle;
}

  public String getImage(){
      return this.image;
}

  public void setId(int id){
      this.id=id;
}

  public void setDishesname(String dishesname){
      this.dishesname=dishesname;
}

  public void setNamesupplier(String namesupplier){
      this.namesupplier=namesupplier;
}

  public void setSellingprice(BigDecimal sellingprice){
      this.sellingprice=sellingprice;
}

  public void setPurchaseprice(BigDecimal purchaseprice){
      this.purchaseprice=purchaseprice;
}

  public void setLibelle(String libelle){
      this.libelle=libelle;
}

  public void setImage(String image){
      this.image=image;
}
}
