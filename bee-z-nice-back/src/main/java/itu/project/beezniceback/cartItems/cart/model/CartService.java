package itu.project.beezniceback.cartItems.cart.model;

import itu.project.beezniceback.cartItems.cart.activeCart.ActiveCartLabeled;
import itu.project.beezniceback.cartItems.cart.activeCart.ActiveCartService;
import itu.project.beezniceback.cartItems.cart.addtocart.model.Addtocart;
import itu.project.beezniceback.cartItems.cart.addtocart.model.AddtocartService;
import itu.project.beezniceback.cartItems.cart.activeCart.ViewActiveCart;
import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.customersmoney.model.Customersmoney;
import itu.project.beezniceback.customersmoney.model.CustomersmoneyService;
import itu.project.beezniceback.dishes.model.Dishes;
import itu.project.beezniceback.dishes.model.DishesService;
import itu.project.beezniceback.foodorder.model.Foodorder;
import itu.project.beezniceback.foodorder.model.FoodorderService;
import itu.project.beezniceback.stockbyestablishment.model.Stockbyestablishment;
import itu.project.beezniceback.stockbyestablishment.model.StockbyestablishmentService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class CartService {
    @Autowired
    private EntityManager entityManager;
    @Autowired
    private StockbyestablishmentService stockService;
    @Autowired
    private DishesService dishesService;
    @Autowired
    private ActiveCartService activeCartService;
    @Autowired
    private AddtocartService addtocartService;
    @Autowired
    private CustomersmoneyService customersmoneyService;
    @Autowired
    private FoodorderService foodorderService;
    public CartService(){
//        listStock = getLastLines();
    }
    public List<Stockbyestablishment> getLastLines(LocalDateTime timestamp) {
        Query query = entityManager.createNativeQuery(
                "SELECT t.* " +
                        "FROM stockbyEstablishment t " +
                        "JOIN ( " +
                        "    SELECT idestablishment, iddishes, MAX(movedate) AS max_movedate " +
                        "    FROM stockbyEstablishment " +
                        "    GROUP BY idestablishment, iddishes " +
                        ") sub ON t.idestablishment = sub.idestablishment AND t.iddishes = sub.iddishes AND t.movedate = sub.max_movedate " +
                        "WHERE t.movedate <= :moveDate", Stockbyestablishment.class);
        query.setParameter("moveDate", timestamp);
        List<Stockbyestablishment> stockbyestablishments = query.getResultList();
        System.out.println("Stock length:"+stockbyestablishments.size());
        System.out.println("Stock date limit:"+timestamp.toString());
        return stockbyestablishments;
    }

    @Transactional
    public void saveMyCart(LoggedCustomer loggedCustomer) throws Exception{
        Customersmoney customersmoney = customersmoneyService.findByIdCustomer(loggedCustomer.getUniqId()).get();
        System.out.println("Customers money:"+customersmoney.getVirtualamount());
        List<ActiveCartLabeled> activeCarts = activeCartService.getLabeledListByIdUser(loggedCustomer.getId());
        double cartNetVal = cartValue(activeCarts);
        if (cartNetVal > customersmoneyService.getPayDoubleValue(loggedCustomer)) {
            throw new Exception("You don't have enough money to purchase those items");
        }
//        Timestamp commandTime = new Timestamp(System.currentTimeMillis());
        LocalDateTime commandTime = LocalDateTime.now();
        List<Stockbyestablishment> stockbyestablishments = getLastLines(commandTime);
        for (int i = 0; i < activeCarts.size(); i++) {
            System.out.println("Dishe ID:"+activeCarts.get(i).getIdDishe());
            decreaseStock(stockbyestablishments,activeCarts.get(i).getIdDishe(),activeCarts.get(i).getQuantity(),commandTime,loggedCustomer);
        }
        for (int i = 0; i < activeCarts.size(); i++) {
            for (int j = 0; j < activeCarts.get(i).getQuantity(); j++) {
                Foodorder foodorder = new Foodorder();
                foodorder.setPaymenttypeid(1);
                foodorder.setIddishes(activeCarts.get(i).getIdDishe());
                foodorder.setCustomerid(loggedCustomer.getId());
                foodorder.setOrdertime(commandTime);
                foodorder.setDisheprice(activeCarts.get(i).getSellingPrice());
                foodorder.setDishepurchaseprice(activeCarts.get(i).getPurchasePrice());
                foodorder.setIdaddtocart(activeCarts.get(i).getId());
                foodorderService.save(foodorder);
            }
        }
    }
    private double cartValue(List<ActiveCartLabeled> activeCartLabeleds){
        double sum = 0;
        for (ActiveCartLabeled activeCartLabeled : activeCartLabeleds) {
            sum += activeCartLabeled.getQuantity() * activeCartLabeled.getSellingPrice().doubleValue();
        }
        System.out.println("SUM:"+sum);
        return sum;
    }
    public void decreaseStock(List<Stockbyestablishment> stocks, int idDishes, int quantity, LocalDateTime decreaseTime, LoggedCustomer loggedCustomer){
        System.out.println("Id dishe: "+idDishes);
        Stockbyestablishment stockbyestablishment = getByIdDishesAndEstablishement(stocks,idDishes, loggedCustomer.getIdEstablishement());
        Stockbyestablishment stockbyestablishmentToSave = new Stockbyestablishment();
        stockbyestablishmentToSave.setIddishes(idDishes);
        stockbyestablishmentToSave.setIdestablishment(loggedCustomer.getIdEstablishement());
        stockbyestablishmentToSave.setRemainingstock(stockbyestablishment.getRemainingstock()-quantity);
        stockbyestablishmentToSave.setIdmovementtype(2);
        stockbyestablishmentToSave.setMovedate(decreaseTime);
        stockService.save(stockbyestablishmentToSave);
    }
    public Stockbyestablishment getByIdDishesAndEstablishement(List<Stockbyestablishment> stocks,int idDishes,int idEstablishment){
        for (int i = 0; i < stocks.size(); i++) {
            if (stocks.get(i).getIddishes() == idDishes && stocks.get(i).getIdestablishment()==idEstablishment){
                System.out.println("GET STOCK BY :"+stocks.get(i).getIddishes());
                return stocks.get(i);
            }
        }
        return null;
    }
    public void addToCart(int idDishes,int quantity,LoggedCustomer loggedCustomer){
        Optional<Dishes> dishes = dishesService.getById(idDishes);
        addToCart(dishes.get(),quantity,loggedCustomer);
    }
    public void removeToCart(int idDishes,LoggedCustomer loggedCustomer){
        Optional<Dishes> dishes = dishesService.getById(idDishes);
        removeToCart(dishes.get(),1,loggedCustomer);
    }
    public void addToCart(Dishes dishes,int quantity,LoggedCustomer loggedCustomer){
        List<ViewActiveCart> activeCarts = activeCartService.getByIdUser(loggedCustomer.getId());
        int index = cartContains(dishes,activeCarts);
        if (index != -1){
            activeCarts.get(index).setQuantity(activeCarts.get(index).getQuantity()+quantity);
            Addtocart addtocart = new Addtocart(activeCarts.get(index));
            addtocartService.update(addtocart);
        }
        else{
            Addtocart addtocart = new Addtocart();
            addtocart.setIddishe(dishes.getId());
            addtocart.setIduser(loggedCustomer.getId());
            addtocart.setQuantity(quantity);
            addtocartService.save(addtocart);
        }
    }
    public int cartContains(Dishes dishes,List<ViewActiveCart> activeCarts){
        for (int i = 0; i < activeCarts.size(); i++) {
            if (activeCarts.get(i).getIdDishe() == dishes.getId()){
                return i;
            }
        }
        return -1;
    }
    public void removeToCart(Dishes dishes,int quantity,LoggedCustomer loggedCustomer){
        List<ViewActiveCart> activeCarts = activeCartService.getByIdUser(loggedCustomer.getId());
        int index = cartContains(dishes,activeCarts);
        if (index != -1){
            activeCarts.get(index).setQuantity(activeCarts.get(index).getQuantity()-quantity);
            Addtocart addtocart = new Addtocart(activeCarts.get(index));
            addtocartService.update(addtocart);
        }
    }
//    @Transactional
//    public void saveCart(Cart cart, LoggedCustomer loggedCustomer){
//        try{
//            String sql = "INSERT INTO foodorder (paymenttypeid,iddishes,customerid,ordertime,disheprice,dishepurchaseprice) VALUES (?,?,?, CURRENT_TIMESTAMP,?, ?)";
//            HashMap<Dishes,Integer> elements = cart.getItemsAndQuantity();
//            List<Stockbyestablishment> stocks = getLastLines();
//            for (Map.Entry<Dishes, Integer> map: elements.entrySet()) {
//                for (int i = 0; i < map.getValue(); i++) {
//                    jdbcTemplate.update(sql, 1,map.getKey().getId(),loggedCustomer.getId(), map.getKey().getSellingprice(),map.getKey().getPurchaseprice());
//                }
//                this.decreaseStock(stocks, map.getKey().getId(), map.getValue(), loggedCustomer);
//            }
//        }catch (Exception e){
//            throw e;
//        }
//    }
}
