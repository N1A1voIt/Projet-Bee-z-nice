package itu.project.beezniceback.addtocart.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;




@Entity
@Immutable
@Table(name = "v_addtocart")
public class AddtocartView{
//id
@Id
@Column(name = "id")
private long id;
//dishesname
@Column(name = "dishesname")
private String dishesname;
//name
@Column(name = "name")
private String name;
//quantity
@Column(name = "quantity")
private int quantity;

  public long getId(){
      return this.id;
}

  public String getDishesname(){
      return this.dishesname;
}

  public String getName(){
      return this.name;
}

  public int getQuantity(){
      return this.quantity;
}

  public void setId(long id){
      this.id=id;
}

  public void setDishesname(String dishesname){
      this.dishesname=dishesname;
}

  public void setName(String name){
      this.name=name;
}

  public void setQuantity(int quantity){
      this.quantity=quantity;
}
}
