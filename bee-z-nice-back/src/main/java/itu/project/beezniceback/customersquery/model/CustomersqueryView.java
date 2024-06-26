package itu.project.beezniceback.customersquery.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;


import java.math.BigDecimal;

@Entity
@Immutable
@Table(name = "v_customersquery")
public class CustomersqueryView{
//id
@Id
@Column(name = "id")
private long id;
//nameemployee
@Column(name = "nameemployee")
private String nameemployee;
//virtualamount
@Column(name = "virtualamount")
private BigDecimal virtualamount;
//ispending
@Column(name = "ispending")
private Boolean ispending;

  public long getId(){
      return this.id;
}

  public String getNameemployee(){
      return this.nameemployee;
}

  public BigDecimal getVirtualamount(){
      return this.virtualamount;
}

  public Boolean getIspending(){
      return this.ispending;
}

  public void setId(long id){
      this.id=id;
}

  public void setNameemployee(String nameemployee){
      this.nameemployee=nameemployee;
}

  public void setVirtualamount(BigDecimal virtualamount){
      this.virtualamount=virtualamount;
}

  public void setIspending(Boolean ispending){
      this.ispending=ispending;
}
}
