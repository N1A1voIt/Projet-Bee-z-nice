package itu.project.beezniceback.customersmoney.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;


import java.math.BigDecimal;
@Entity
@Table(name = "customersmoney")
public class Customersmoney{
//id
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "id")
private long id;
//idcustomer
@Column(name = "idcustomer")
private String idcustomer;
//virtualamount
@Column(name = "virtualamount")
private BigDecimal virtualamount;

  public long getId(){
      return this.id;
}

  public String getIdcustomer(){
      return this.idcustomer;
}

  public BigDecimal getVirtualamount(){
      return this.virtualamount;
}

  public void setId(long id){
      this.id=id;
}

  public void setIdcustomer(String idcustomer){
      this.idcustomer=idcustomer;
}

  public void setVirtualamount(BigDecimal virtualamount){
      this.virtualamount=virtualamount;
}
}
