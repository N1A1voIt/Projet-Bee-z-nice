package itu.project.beezniceback.stockbyestablishment.model;
import itu.project.beezniceback.authentification.model.LoggedCustomer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;
import java.util.List;
@Service
public class StockbyestablishmentService{
   @Autowired
   private StockbyestablishmentRepository stockbyestablishmentRepository;
   @Autowired
   private StockbyestablishmentViewRepository stockbyestablishmentViewRepository;
   public List<StockbyestablishmentView> getAll(){
      return stockbyestablishmentViewRepository.findAll();
   }

   public void save(Stockbyestablishment stockbyestablishment){
   stockbyestablishmentRepository.save(stockbyestablishment);
      if (stockbyestablishment.getIdmovementtype() == 1){

      }else{

      }
//      public void decreaseStock(List<Stockbyestablishment> stocks, int idDishes, int quantity, Timestamp decreaseTime, LoggedCustomer
//      loggedCustomer){
//         System.out.println("Id dishe: "+idDishes);
//         Stockbyestablishment stockbyestablishment = getByIdDishesAndEstablishement(stocks,idDishes, loggedCustomer.getIdEstablishement());
//         Stockbyestablishment stockbyestablishmentToSave = new Stockbyestablishment();
//         stockbyestablishmentToSave.setIddishes(idDishes);
//         stockbyestablishmentToSave.setIdestablishment(loggedCustomer.getIdEstablishement());
//         stockbyestablishmentToSave.setRemainingstock(stockbyestablishment.getRemainingstock()-quantity);
//         stockbyestablishmentToSave.setIdmovementtype(2);
//         stockbyestablishmentToSave.setMovedate(decreaseTime);
//         stockService.save(stockbyestablishmentToSave);
//      }

   }
   public void delete(long id){
   stockbyestablishmentRepository.deleteById(id);
   }
   public Optional<Stockbyestablishment> getById(long id){
      return stockbyestablishmentRepository.findById(id);
   }
   public void update(Stockbyestablishment existingStockbyestablishment){
      save(existingStockbyestablishment);
   }
}