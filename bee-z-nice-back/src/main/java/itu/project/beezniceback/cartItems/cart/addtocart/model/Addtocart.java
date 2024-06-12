package itu.project.beezniceback.cartItems.cart.addtocart.model;
import itu.project.beezniceback.cartItems.cart.activeCart.ViewActiveCart;
import jakarta.persistence.*;


@Entity
@Table(name = "addtocart")
public class Addtocart{
//id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    //iddishe
    @Column(name = "iddishe")
    private int iddishe;
    //iduser
    @Column(name = "iduser")
    private long iduser;
    //quantity
    @Column(name = "quantity")
    private int quantity;

    public long getId(){
      return this.id;
    }

    public int getIddishe(){
      return this.iddishe;
    }

    public long getIduser(){
      return this.iduser;
    }

    public int getQuantity(){
      return this.quantity;
    }

    public void setId(long id){
      this.id=id;
    }

    public void setIddishe(int iddishe){
      this.iddishe=iddishe;
    }

    public void setIduser(long iduser){
      this.iduser=iduser;
    }

    public void setQuantity(int quantity){
      this.quantity=quantity;
    }
    public Addtocart(){

    }
    public Addtocart(ViewActiveCart viewActiveCart){
          this.id = viewActiveCart.getId();
          this.iddishe = viewActiveCart.getIdDishe();
          this.iduser = viewActiveCart.getIduser();
          this.quantity = viewActiveCart.getQuantity();
    }
}
