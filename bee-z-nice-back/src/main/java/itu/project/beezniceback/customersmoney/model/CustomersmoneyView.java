package itu.project.beezniceback.customersmoney.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;


import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Immutable
@Table(name = "v_customersmoney")
public class CustomersmoneyView{
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

    @Column(name = "datedeposit")
    private LocalDateTime dateDeposit;

    public LocalDateTime getDateDeposit() {
        return dateDeposit;
    }

    public void setDateDeposit(LocalDateTime dateDeposit) {
        this.dateDeposit = dateDeposit;
    }


    public long getId(){
      return this.id;
    }

    public String getNameemployee(){
      return this.nameemployee;
    }

    public BigDecimal getVirtualamount(){
      return this.virtualamount;
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
}
