package itu.project.beezniceback.stockbyestablishment.model;
import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.cartItems.cart.model.CartService;
import itu.project.beezniceback.dishes.model.DishesService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.List;
@Service
public class StockbyestablishmentService{
   @Autowired
   private StockbyestablishmentRepository stockbyestablishmentRepository;
   @Autowired
   private StockbyestablishmentViewRepository stockbyestablishmentViewRepository;

   @Autowired
   private DishesService dishesService;
   @Autowired
   private EntityManager entityManager;
   public List<StockbyestablishmentView> getAll(){
      return stockbyestablishmentViewRepository.findAll();
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
   public Stockbyestablishment getByIdDishesAndEstablishement(List<Stockbyestablishment> stocks,int idDishes,int idEstablishment){
      for (int i = 0; i < stocks.size(); i++) {
         if (stocks.get(i).getIddishes() == idDishes && stocks.get(i).getIdestablishment()==idEstablishment){
            System.out.println("GET STOCK BY :"+stocks.get(i).getIddishes());
            return stocks.get(i);
         }
      }
      return null;
   }
   public Stockbyestablishment save(Stockbyestablishment stockbyestablishment) throws Exception {
      if (stockbyestablishment.getIdmovementtype() == 1){
         Stockbyestablishment stockbyestablishment1 = this.getByIdDishesAndEstablishement(this.getLastLines(stockbyestablishment.getMovedate()),(int)stockbyestablishment.getIddishes(),(int)stockbyestablishment.getIdestablishment());
         if (stockbyestablishment1 == null){
            stockbyestablishmentRepository.save(stockbyestablishment);
         }else{
            stockbyestablishment.setRemainingstock(stockbyestablishment1.getRemainingstock()+stockbyestablishment1.getRemainingstock());
            stockbyestablishmentRepository.save(stockbyestablishment);
         }
      } if (stockbyestablishment.getIdmovementtype() == 2){
         Stockbyestablishment stockbyestablishment1 = this.getByIdDishesAndEstablishement(this.getLastLines(stockbyestablishment.getMovedate()),(int)stockbyestablishment.getIddishes(),(int)stockbyestablishment.getIdestablishment());
         if (stockbyestablishment1 == null ||  stockbyestablishment1.getRemainingstock() - stockbyestablishment.getRemainingstock()  < 0){
            throw new Exception("Stock de "+dishesService.getById((int)stockbyestablishment.getIddishes()).get().getDishesname()+" insuffisant");
         }else{
            stockbyestablishment.setRemainingstock(stockbyestablishment1.getRemainingstock() - stockbyestablishment.getRemainingstock());
            stockbyestablishmentRepository.save(stockbyestablishment);
         }
      }
      return stockbyestablishment;
   }
   public void delete(long id){
   stockbyestablishmentRepository.deleteById(id);
   }
   public Optional<Stockbyestablishment> getById(long id){
      return stockbyestablishmentRepository.findById(id);
   }
   public void update(Stockbyestablishment existingStockbyestablishment) throws Exception {
      save(existingStockbyestablishment);
   }
}