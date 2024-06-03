package itu.project.beezniceback.supplier.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;


@Entity
@Table(name = "supplier")
public class Supplier{
//id
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "id")
private int id;
//namesupplier
@Column(name = "namesupplier")
private String namesupplier;

  public int getId(){
      return this.id;
}

  public String getNamesupplier(){
      return this.namesupplier;
}

  public void setId(int id){
      this.id=id;
}

  public void setNamesupplier(String namesupplier){
      this.namesupplier=namesupplier;
}
}
