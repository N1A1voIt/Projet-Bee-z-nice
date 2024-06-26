package itu.project.beezniceback.foodorder.model;
import itu.project.beezniceback.stockbyestablishment.model.Stockbyestablishment;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Optional;
import java.util.List;
@Service
public class FoodorderService{
   @Autowired
   private EntityManager entityManager;
   @Autowired
   private FoodorderRepository foodorderRepository;
   @Autowired
   private FoodorderViewRepository foodorderViewRepository;
   public List<FoodorderView> getAll(){
      return foodorderViewRepository.findAll();
   }
   public void save(Foodorder foodorder){
   foodorderRepository.save(foodorder);
   }
   public void delete(long id){
   foodorderRepository.deleteById(id);
   }
   public Optional<Foodorder> getById(long id){
      return foodorderRepository.findById(id);
   }
   public void update(Foodorder existingFoodorder){
      save(existingFoodorder);
   }


   public double getExpensesByIdUser(int idUser, LocalDateTime localDateTime){
      Query query = entityManager.createNativeQuery("SELECT COALESCE(SUM(dishePrice),0) as expenses FROM foodorder WHERE customerid = :idCustomer AND ordertime <= :filterTime", Expenses.class);
      query.setParameter("idCustomer",idUser);
      query.setParameter("filterTime",localDateTime);
      List<Expenses> expensesList = query.getResultList();
      Expenses expenses = new Expenses(new BigDecimal(0));
      if (!expensesList.isEmpty()){
         expenses = (Expenses) query.getResultList().get(0);
      }
      double ret = expenses.getExpenses().doubleValue();
   //   System.out.println("RET:"+foodorderRepository.getExpensesByUserId(idUser));
      return ret;
   }
}