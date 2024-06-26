package itu.project.beezniceback.customersmoney.model;
import io.lettuce.core.dynamic.annotation.Param;
import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.foodorder.model.FoodorderService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Optional;
import java.util.List;
@Service
public class CustomersmoneyService{
   @Autowired
   private CustomersmoneyRepository customersmoneyRepository;
   @Autowired
   private CustomersmoneyViewRepository customersmoneyViewRepository;
   @Autowired
   private FoodorderService foodorderService;
   @Autowired
   private EntityManager entityManager;
   public List<CustomersmoneyView> getAll(){
      return customersmoneyViewRepository.findAll();
   }
   public void save(Customersmoney customersmoney){
   customersmoneyRepository.save(customersmoney);
   }
   public void delete(long id){
   customersmoneyRepository.deleteById(id);
   }
   public Optional<Customersmoney> getById(long id){
      return customersmoneyRepository.findById(id);
   }
   public void update(Customersmoney existingCustomersmoney){
      save(existingCustomersmoney);
   }
   public Optional<Customersmoney> findByIdCustomer(String customerId){return customersmoneyRepository.findByIdcustomer(customerId);}
   public List<Customersmoney> findMoney(String id){
      Query query = entityManager.createQuery("SELECT 0 as id,  idcustomer, sum(virtualamount) as virtualamount FROM customersmoney WHERE idcustomer = :id GROUP BY idcustomer",Customersmoney.class);
      query.setParameter("id",id);
      return query.getResultList();
   }
   public Customersmoney getPay(LoggedCustomer loggedCustomer, LocalDateTime localDateTime){
      System.out.println(localDateTime.toString());

      double expenses = foodorderService.getExpensesByIdUser((int)loggedCustomer.getId(),localDateTime);
      Customersmoney customersmoney;

      if(customersmoneyRepository.findMoney(loggedCustomer.getUniqId(),localDateTime).size() == 0){
         customersmoney = new Customersmoney(0, loggedCustomer.getUniqId(), new BigDecimal(0),localDateTime);
      }else{
         customersmoney = customersmoneyRepository.findMoney(loggedCustomer.getUniqId(),localDateTime).get(0);
         customersmoney.setVirtualamount(BigDecimal.valueOf(customersmoney.getVirtualamount().doubleValue()-expenses));
      }
      return customersmoney;
   }
   public double getPayDoubleValue(LoggedCustomer loggedCustomer,LocalDateTime localDateTime){
      double expenses = foodorderService.getExpensesByIdUser((int)loggedCustomer.getId(),localDateTime);
      Customersmoney customersmoney = customersmoneyRepository.findMoney(loggedCustomer.getUniqId(),localDateTime).get(0);
      return customersmoney.getVirtualamount().doubleValue()-expenses;
   }
}