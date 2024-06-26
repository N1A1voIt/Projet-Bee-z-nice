package itu.project.beezniceback.dishes.model;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;



import java.math.BigDecimal;


@Entity
@Table(name = "dishes")
public class Dishes{
//id
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "id")
@JsonProperty("id")
private int id;
//dishesname
@Column(name = "dishesname")
@JsonProperty("dishesname")
private String dishesname;
//idsupplier
@Column(name = "idsupplier")
@JsonProperty("idsupplier")
private int idsupplier;
//sellingprice
@Column(name = "sellingprice")
@JsonProperty("sellingprice")
private BigDecimal sellingprice;
//purchaseprice
@Column(name = "purchaseprice")
@JsonProperty("purchaseprice")
private BigDecimal purchaseprice;
//idtype
@Column(name = "idtype")
@JsonProperty("idtype")
private int idtype;
//image
@Column(name = "image")
@JsonProperty("image")
private String image;

  public int getId(){
      return this.id;
}

  public String getDishesname(){
      return this.dishesname;
}

  public int getIdsupplier(){
      return this.idsupplier;
}

  public BigDecimal getSellingprice(){
      return this.sellingprice;
}

  public BigDecimal getPurchaseprice(){
      return this.purchaseprice;
}

  public int getIdtype(){
      return this.idtype;
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

  public void setIdsupplier(int idsupplier){
      this.idsupplier=idsupplier;
}

  public void setSellingprice(BigDecimal sellingprice){
      this.sellingprice=sellingprice;
}

  public void setPurchaseprice(BigDecimal purchaseprice){
      this.purchaseprice=purchaseprice;
}

  public void setIdtype(int idtype){
      this.idtype=idtype;
}

  public void setImage(String image){
      this.image=image;
}
}
