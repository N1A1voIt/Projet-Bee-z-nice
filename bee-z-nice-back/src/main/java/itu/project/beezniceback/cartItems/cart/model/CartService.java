package itu.project.beezniceback.cartItems.cart.model;

import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.dishes.model.Dishes;
import itu.project.beezniceback.stockbyestablishment.model.Stockbyestablishment;
import itu.project.beezniceback.stockbyestablishment.model.StockbyestablishmentService;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CartService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private EntityManager entityManager;
    @Autowired
    private StockbyestablishmentService stockService;
    public List<Stockbyestablishment> getLastLines(){
        Query query = entityManager.createNativeQuery("SELECT * FROM v_stock_last_lines",Stockbyestablishment.class);
        return query.getResultList();
    }
    public void decreaseStock(int idDishes,int quantity,LoggedCustomer loggedCustomer){
        Query query = entityManager.createNativeQuery("SELECT * FROM v_stock_last_lines WHERE iddishes = :idDishes AND idestablishment = :idEstablishement",Stockbyestablishment.class);
        query.setParameter("idDishes",idDishes);
        query.setParameter("idEstablishement",loggedCustomer.getIdEstablishement());
        Stockbyestablishment stockbyestablishment = (Stockbyestablishment) query.getResultList().get(0);
        Stockbyestablishment stockbyestablishmentToSave = new Stockbyestablishment();
        stockbyestablishment.setIddishes(idDishes);
        stockbyestablishment.setIdestablishment(loggedCustomer.getIdEstablishement());
        stockbyestablishment.setRemainingstock(stockbyestablishment.getRemainingstock()-quantity);
        stockbyestablishment.setIdestablishment(loggedCustomer.getIdEstablishement());
    }
    @Transactional
    public void saveCart(Cart cart, LoggedCustomer loggedCustomer){
        try{
            String sql = "INSERT INTO foodorder (paymenttypeid,iddishes,customerid,ordertime,disheprice,dishepurchaseprice) VALUES (?,?,?, CURRENT_TIMESTAMP,?, ?)";
            HashMap<Dishes,Integer> elements = cart.getItemsAndQuantity();
            for (Map.Entry<Dishes, Integer> map: elements.entrySet()) {
                for (int i = 0; i < map.getValue(); i++) {
                    jdbcTemplate.update(sql, 1,map.getKey().getId(),loggedCustomer.getId(), map.getKey().getSellingprice(),map.getKey().getPurchaseprice());
                    Stockbyestablishment stockbyestablishment = new Stockbyestablishment();
                    stockbyestablishment.setIddishes(map.getKey().getId());
                    stockbyestablishment.setIdestablishment(loggedCustomer.getIdEstablishement());
                    stockbyestablishment.setRemainingstock();
                    stockbyestablishment.setIdestablishment(loggedCustomer.getIdEstablishement());
                    stockService.save();
                }
            }
        }catch (Exception e){
            throw e;
        }
    }
}
