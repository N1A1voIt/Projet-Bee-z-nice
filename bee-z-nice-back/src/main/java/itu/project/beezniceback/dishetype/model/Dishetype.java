package itu.project.beezniceback.dishetype.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;



@Entity
@Table(name = "dishetype")
public class Dishetype{
//id
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "id")
private int id;
//libelle
@Column(name = "libelle")
private String libelle;
//image_name
@Column(name = "image_name")
private String image_name;

  public int getId(){
      return this.id;
}

  public String getLibelle(){
      return this.libelle;
}

  public String getImage_name(){
      return this.image_name;
}

  public void setId(int id){
      this.id=id;
}

  public void setLibelle(String libelle){
      this.libelle=libelle;
}

  public void setImage_name(String image_name){
      this.image_name=image_name;
}
}
