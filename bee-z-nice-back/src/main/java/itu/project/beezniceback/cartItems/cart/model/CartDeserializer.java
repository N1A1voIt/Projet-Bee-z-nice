package itu.project.beezniceback.cartItems.cart.model;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import itu.project.beezniceback.cartItems.cart.model.Cart;
import itu.project.beezniceback.dishes.model.Dishes;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CartDeserializer extends JsonDeserializer<Cart> {

    private static final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public Cart deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        Map<?,?> claimsAsMap = objectMapper.readValue(jsonParser, Map.class);
        HashMap<Dishes, Integer> itemsAndQuantity = new HashMap<>();
        for (Map.Entry<?,?> entry : claimsAsMap.entrySet()) {
            String dishJson = (String) entry.getKey();
            Dishes dish = objectMapper.readValue(dishJson, Dishes.class);
            int quantity = ((Number) entry.getValue()).intValue();
            itemsAndQuantity.put(dish, quantity);
        }

        return new Cart(itemsAndQuantity);
    }
}
