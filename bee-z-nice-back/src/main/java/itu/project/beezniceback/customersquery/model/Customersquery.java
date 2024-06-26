package itu.project.beezniceback.customersquery.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;
import org.springframework.cglib.core.Local;


import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "customersquery")
public class Customersquery{
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
//ispending
@Column(name = "ispending")
private Boolean ispending;
@Column(name = "daterequest")
private LocalDateTime daterequest;

    public LocalDateTime getDaterequest() {
        return daterequest;
    }

    public void setDaterequest(LocalDateTime daterequest) {
        this.daterequest = daterequest;
    }

    public long getId(){
      return this.id;
}

  public String getIdcustomer(){
      return this.idcustomer;
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

  public void setIdcustomer(String idcustomer){
      this.idcustomer=idcustomer;
}

  public void setVirtualamount(BigDecimal virtualamount){
      this.virtualamount=virtualamount;
}

  public void setIspending(Boolean ispending){
      this.ispending=ispending;
}
}
