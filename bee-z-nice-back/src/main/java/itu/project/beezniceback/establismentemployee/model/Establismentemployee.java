package itu.project.beezniceback.establismentemployee.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;



@Entity
@Table(name = "establismentemployee")
public class Establismentemployee{
//id
@Id
@Column(name = "id")
private String id;
//idestablishment
@Column(name = "idestablishment")
private int idestablishment;
//nameemployee
@Column(name = "nameemployee")
private String nameemployee;

  public String getId(){
      return this.id;
}

  public int getIdestablishment(){
      return this.idestablishment;
}

  public String getNameemployee(){
      return this.nameemployee;
}

  public void setId(String id){
      this.id=id;
}

  public void setIdestablishment(int idestablishment){
      this.idestablishment=idestablishment;
}

  public void setNameemployee(String nameemployee){
      this.nameemployee=nameemployee;
}
}
