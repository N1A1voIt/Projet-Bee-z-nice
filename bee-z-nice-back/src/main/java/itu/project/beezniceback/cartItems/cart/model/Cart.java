package itu.project.beezniceback.cartItems.cart.model;

import itu.project.beezniceback.dishes.model.Dishes;

import java.util.HashMap;

public class Cart {
    HashMap<Dishes,Integer> itemsAndQuantity;

    public void addToCart(Dishes dishes,int quantity){
        if (itemsAndQuantity.containsKey(dishes)){
            quantity += itemsAndQuantity.get(dishes);
        }
        itemsAndQuantity.put(dishes,quantity);
    }
    public void removeToCart(Dishes dishes,int quantity){
        if (itemsAndQuantity.get(dishes) == 0){
            itemsAndQuantity.remove(dishes);
        }
        if (itemsAndQuantity.containsKey(dishes)){
            quantity -= itemsAndQuantity.get(dishes);
        }
        itemsAndQuantity.put(dishes,quantity);
    }
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
