package itu.project.beezniceback.customersmoney.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;


import java.math.BigDecimal;
import java.time.LocalDateTime;

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

@Column(name = "datedeposit")
private LocalDateTime dateDeposit;

    public Customersmoney() {
    }

    public Customersmoney(long id, String idcustomer, BigDecimal virtualamount, LocalDateTime dateDeposit) {
        this.id = id;
        this.idcustomer = idcustomer;
        this.virtualamount = virtualamount;
        this.dateDeposit = dateDeposit;
    }

    public LocalDateTime getDateDeposit() {
        return dateDeposit;
    }

    public void setDateDeposit(LocalDateTime dateDeposit) {
        this.dateDeposit = dateDeposit;
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
