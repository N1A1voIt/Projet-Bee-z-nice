package itu.project.beezniceback.cartItems.cart.dto;

public class DisheQuantityDTO {
    int id;
    int quantity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public DisheQuantityDTO(int id, int quantity) {
        this.id = id;
        this.quantity = quantity;
    }
}
