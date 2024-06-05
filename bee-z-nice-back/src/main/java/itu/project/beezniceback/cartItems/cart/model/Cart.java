package itu.project.beezniceback.cartItems.cart.model;

import itu.project.beezniceback.dishes.model.Dishes;
import itu.project.beezniceback.dishes.model.DishesService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class Cart {

    HashMap<Dishes,Integer> itemsAndQuantity;
    public Cart(HashMap<Dishes, Integer> itemsAndQuantity) {
        this.itemsAndQuantity = itemsAndQuantity;
    }

    public HashMap<Dishes, Integer> getItemsAndQuantity() {
        return itemsAndQuantity;
    }

    public void setItemsAndQuantity(HashMap<Dishes, Integer> itemsAndQuantity) {
        this.itemsAndQuantity = itemsAndQuantity;
    }
}
