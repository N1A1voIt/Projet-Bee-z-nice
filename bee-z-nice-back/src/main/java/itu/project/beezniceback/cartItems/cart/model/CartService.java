package itu.project.beezniceback.cartItems.cart.model;

import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.dishes.model.Dishes;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

@Service
public class CartService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Transactional
    public void saveCart(Cart cart, LoggedCustomer loggedCustomer){
        try{
            String sql = "INSERT INTO foodorder (paymenttypeid,iddishes,customerid,ordertime,disheprice,dishepurchaseprice) VALUES (?, ?,?, CURRENT_TIMESTAMP,?, ?)";
            HashMap<Dishes,Integer> elements = cart.getItemsAndQuantity();
            for (Map.Entry<Dishes, Integer> map: elements.entrySet()) {
                for (int i = 0; i < map.getValue(); i++) {
                    jdbcTemplate.update(sql, 1,map.getKey().getId(),loggedCustomer.getId(), map.getKey().getSellingprice(),map.getKey().getPurchaseprice());
                }
            }
        }catch (Exception e){
            throw e;
        }
    }
}
