package itu.project.beezniceback.establishment.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;



@Entity
@Table(name = "establishment")
public class Establishment{
//id
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "id")
private int id;
//name
@Column(name = "name")
private String name;
//location
@Column(name = "location")
private String location;

  public int getId(){
      return this.id;
}

  public String getName(){
      return this.name;
}

  public String getLocation(){
      return this.location;
}

  public void setId(int id){
      this.id=id;
}

  public void setName(String name){
      this.name=name;
}

  public void setLocation(String location){
      this.location=location;
}
}
