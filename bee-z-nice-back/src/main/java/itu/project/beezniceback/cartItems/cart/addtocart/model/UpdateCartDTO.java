package itu.project.beezniceback.cartItems.cart.addtocart.model;

public class UpdateCartDTO {
    Long id;
    int iddishe;
    int quantity;

    public UpdateCartDTO(Long id, int iddishe, int quantity) {
        this.id = id;
        this.iddishe = iddishe;
        this.quantity = quantity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getIddishe() {
        return iddishe;
    }

    public void setIddishe(int iddishe) {
        this.iddishe = iddishe;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
