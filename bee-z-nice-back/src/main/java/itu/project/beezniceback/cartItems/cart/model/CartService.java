package itu.project.beezniceback.cartItems.cart.model;

import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.dishes.model.Dishes;
import itu.project.beezniceback.dishes.model.DishesService;
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
import java.util.*;

@Service
public class CartService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private EntityManager entityManager;
    @Autowired
    private StockbyestablishmentService stockService;
    //    private List<Stockbyestablishment> listStock;
    @Autowired
    private DishesService dishesService;
    public CartService(){
//        listStock = getLastLines();
    }
    public List<Stockbyestablishment> getLastLines(){
        Query query = entityManager.createNativeQuery("SELECT * FROM v_stock_last_lines",Stockbyestablishment.class);
        return query.getResultList();
    }
    public void decreaseStock(List<Stockbyestablishment> stocks,int idDishes,int quantity,LoggedCustomer loggedCustomer){
        Stockbyestablishment stockbyestablishment = getByIdDishesAndEstablishement(stocks,idDishes, loggedCustomer.getIdEstablishement());
        Stockbyestablishment stockbyestablishmentToSave = new Stockbyestablishment();
        stockbyestablishment.setIddishes(idDishes);
        stockbyestablishment.setIdestablishment(loggedCustomer.getIdEstablishement());
        stockbyestablishment.setRemainingstock(stockbyestablishment.getRemainingstock()-quantity);
        stockbyestablishment.setIdestablishment(loggedCustomer.getIdEstablishement());
        stockService.save(stockbyestablishmentToSave);
    }
    public Stockbyestablishment getByIdDishesAndEstablishement(List<Stockbyestablishment> stocks,int idDishes,int idEstablishment){
        for (int i = 0; i < stocks.size(); i++) {
            if (stocks.get(i).getIddishes() == idDishes && stocks.get(i).getIdestablishment()==idEstablishment){
                return stocks.get(i);
            }
        }
        return null;
    }
    public void addToCart(int idDishes,Cart cart){
        Optional<Dishes> dishes = dishesService.getById(idDishes);
        addToCart(dishes.get(),1,cart);
    }
    public void removeToCart(int idDishes,Cart cart){
        Optional<Dishes> dishes = dishesService.getById(idDishes);
        removeToCart(dishes.get(),1,cart);
    }
    public void addToCart(Dishes dishes,int quantity,Cart cart){
        if (cart.getItemsAndQuantity().containsKey(dishes)){
            quantity += cart.getItemsAndQuantity().get(dishes);
        }
        cart.getItemsAndQuantity().put(dishes,quantity);
    }
    public void removeToCart(Dishes dishes,int quantity,Cart cart){
        if (cart.getItemsAndQuantity().get(dishes) == 0){
            cart.getItemsAndQuantity().remove(dishes);
        }
        if (cart.getItemsAndQuantity().containsKey(dishes)){
            quantity -= cart.getItemsAndQuantity().get(dishes);
        }
        cart.getItemsAndQuantity().put(dishes,quantity);
    }
    @Transactional
    public void saveCart(Cart cart, LoggedCustomer loggedCustomer){
        try{
            String sql = "INSERT INTO foodorder (paymenttypeid,iddishes,customerid,ordertime,disheprice,dishepurchaseprice) VALUES (?,?,?, CURRENT_TIMESTAMP,?, ?)";
            HashMap<Dishes,Integer> elements = cart.getItemsAndQuantity();
            List<Stockbyestablishment> stocks = getLastLines();
            for (Map.Entry<Dishes, Integer> map: elements.entrySet()) {
                for (int i = 0; i < map.getValue(); i++) {
                    jdbcTemplate.update(sql, 1,map.getKey().getId(),loggedCustomer.getId(), map.getKey().getSellingprice(),map.getKey().getPurchaseprice());
                }
                this.decreaseStock(stocks, map.getKey().getId(), map.getValue(), loggedCustomer);
            }
        }catch (Exception e){
            throw e;
        }
    }
}
