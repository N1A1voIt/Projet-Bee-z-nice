package itu.project.beezniceback.movementtype.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;


@Entity
@Table(name = "movementtype")
public class Movementtype{
//id
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "id")
private int id;
//type
@Column(name = "type")
private String type;

  public int getId(){
      return this.id;
}

  public String getType(){
      return this.type;
}

  public void setId(int id){
      this.id=id;
}

  public void setType(String type){
      this.type=type;
}
}
