package itu.project.beezniceback.establismentemployee.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;



@Entity
@Immutable
@Table(name = "v_establismentemployee")
public class EstablismentemployeeView{
//id
@Id
@Column(name = "id")
private String id;
//name
@Column(name = "name")
private String name;
//nameemployee
@Column(name = "nameemployee")
private String nameemployee;

  public String getId(){
      return this.id;
}

  public String getName(){
      return this.name;
}

  public String getNameemployee(){
      return this.nameemployee;
}

  public void setId(String id){
      this.id=id;
}

  public void setName(String name){
      this.name=name;
}

  public void setNameemployee(String nameemployee){
      this.nameemployee=nameemployee;
}
}
