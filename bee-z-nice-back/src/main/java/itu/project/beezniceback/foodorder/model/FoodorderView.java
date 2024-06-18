package itu.project.beezniceback.foodorder.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;




import java.sql.Timestamp;
import java.math.BigDecimal;

@Entity
@Immutable
@Table(name = "v_foodorder")
public class FoodorderView{
//id
@Id
@Column(name = "id")
private long id;
//name
@Column(name = "name")
private String name;
//dishesname
@Column(name = "dishesname")
private String dishesname;
//mail
@Column(name = "mail")
private String mail;
//ordertime
@Column(name = "ordertime")
private Timestamp ordertime;
//disheprice
@Column(name = "disheprice")
private BigDecimal disheprice;
//dishepurchaseprice
@Column(name = "dishepurchaseprice")
private BigDecimal dishepurchaseprice;
//quantity
@Column(name = "quantity")
private int quantity;

  public long getId(){
      return this.id;
}

  public String getName(){
      return this.name;
}

  public String getDishesname(){
      return this.dishesname;
}

  public String getMail(){
      return this.mail;
}

  public Timestamp getOrdertime(){
      return this.ordertime;
}

  public BigDecimal getDisheprice(){
      return this.disheprice;
}

  public BigDecimal getDishepurchaseprice(){
      return this.dishepurchaseprice;
}

  public int getQuantity(){
      return this.quantity;
}

  public void setId(long id){
      this.id=id;
}

  public void setName(String name){
      this.name=name;
}

  public void setDishesname(String dishesname){
      this.dishesname=dishesname;
}

  public void setMail(String mail){
      this.mail=mail;
}

  public void setOrdertime(Timestamp ordertime){
      this.ordertime=ordertime;
}

  public void setDisheprice(BigDecimal disheprice){
      this.disheprice=disheprice;
}

  public void setDishepurchaseprice(BigDecimal dishepurchaseprice){
      this.dishepurchaseprice=dishepurchaseprice;
}

  public void setQuantity(int quantity){
      this.quantity=quantity;
}
}
