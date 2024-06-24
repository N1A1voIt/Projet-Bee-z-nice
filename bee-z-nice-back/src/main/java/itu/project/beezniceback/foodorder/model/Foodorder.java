package itu.project.beezniceback.foodorder.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;




import java.sql.Timestamp;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "foodorder")
public class Foodorder{
//id
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "id")
private long id;
//paymenttypeid
@Column(name = "paymenttypeid")
private int paymenttypeid;
//iddishes
@Column(name = "iddishes")
private int iddishes;
//customerid
@Column(name = "customerid")
private long customerid;
//ordertime
@Column(name = "ordertime")
private LocalDateTime ordertime;
//disheprice
@Column(name = "disheprice")
private BigDecimal disheprice;
//dishepurchaseprice
@Column(name = "dishepurchaseprice")
private BigDecimal dishepurchaseprice;
//idaddtocart
@Column(name = "idaddtocart")
private long idaddtocart;

  public long getId(){
      return this.id;
}

  public int getPaymenttypeid(){
      return this.paymenttypeid;
}

  public int getIddishes(){
      return this.iddishes;
}

  public long getCustomerid(){
      return this.customerid;
}

  public LocalDateTime getOrdertime(){
      return this.ordertime;
}

  public BigDecimal getDisheprice(){
      return this.disheprice;
}

  public BigDecimal getDishepurchaseprice(){
      return this.dishepurchaseprice;
}

  public long getIdaddtocart(){
      return this.idaddtocart;
}

  public void setId(long id){
      this.id=id;
}

  public void setPaymenttypeid(int paymenttypeid){
      this.paymenttypeid=paymenttypeid;
}

  public void setIddishes(int iddishes){
      this.iddishes=iddishes;
}

  public void setCustomerid(long customerid){
      this.customerid=customerid;
}

  public void setOrdertime(LocalDateTime ordertime){
      this.ordertime=ordertime;
}

  public void setDisheprice(BigDecimal disheprice){
      this.disheprice=disheprice;
}

  public void setDishepurchaseprice(BigDecimal dishepurchaseprice){
      this.dishepurchaseprice=dishepurchaseprice;
}

  public void setIdaddtocart(long idaddtocart){
      this.idaddtocart=idaddtocart;
}
}
