package itu.project.beezniceback.stockbyestablishment.model;
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