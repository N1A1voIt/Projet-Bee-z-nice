package itu.project.beezniceback.stockbyestablishment.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;

import java.sql.Timestamp;
import java.time.LocalDateTime;


@Entity
@Immutable
@Table(name = "v_stockbyestablishment")
public class StockbyestablishmentView{
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
//remainingstock
@Column(name = "remainingstock")
private long remainingstock;
//type
@Column(name = "type")
private String type;
@Column(name = "movedate")
private LocalDateTime movedate;

    public LocalDateTime getMovedate() {
        return movedate;
    }

    public void setMovedate(LocalDateTime movedate) {
        this.movedate = movedate;
    }

    public long getId(){
      return this.id;
}

  public String getDishesname(){
      return this.dishesname;
}

  public String getName(){
      return this.name;
}

  public long getRemainingstock(){
      return this.remainingstock;
}

  public String getType(){
      return this.type;
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

  public void setRemainingstock(long remainingstock){
      this.remainingstock=remainingstock;
}

  public void setType(String type){
      this.type=type;
}
}
