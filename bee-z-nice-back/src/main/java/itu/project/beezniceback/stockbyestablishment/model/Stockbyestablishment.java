package itu.project.beezniceback.stockbyestablishment.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;
@Entity
@Table(name = "stockbyestablishment")
public class Stockbyestablishment{
//id
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "id")
private long id;
//iddishes
@Column(name = "iddishes")
private long iddishes;
//idestablishment
@Column(name = "idestablishment")
private long idestablishment;
//remainingstock
@Column(name = "remainingstock")
private long remainingstock;
//idmovementtype
@Column(name = "idmovementtype")
private int idmovementtype;

  public long getId(){
      return this.id;
}

  public long getIddishes(){
      return this.iddishes;
}

  public long getIdestablishment(){
      return this.idestablishment;
}

  public long getRemainingstock(){
      return this.remainingstock;
}

  public int getIdmovementtype(){
      return this.idmovementtype;
}

  public void setId(long id){
      this.id=id;
}

  public void setIddishes(long iddishes){
      this.iddishes=iddishes;
}

  public void setIdestablishment(long idestablishment){
      this.idestablishment=idestablishment;
}

  public void setRemainingstock(long remainingstock){
      this.remainingstock=remainingstock;
}

  public void setIdmovementtype(int idmovementtype){
      this.idmovementtype=idmovementtype;
}
}
