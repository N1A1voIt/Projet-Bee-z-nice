package itu.project.beezniceback.cartItems.cart.activeCart;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.hibernate.annotations.Immutable;

@Entity
@Immutable
@Table(name = "v_active_cart")
public class ViewActiveCart {
    @Id
    @Column(name = "id")
    private Long id;
    @Column(name = "iddishe")
    private int idDishe;
    @Column(name = "iduser")
    private Long iduser;
    @Column(name = "quantity")
    private int quantity;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getIdDishe() {
        return idDishe;
    }

    public void setIdDishe(int idDishe) {
        this.idDishe = idDishe;
    }

    public Long getIduser() {
        return iduser;
    }

    public void setIduser(Long iduser) {
        this.iduser = iduser;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
