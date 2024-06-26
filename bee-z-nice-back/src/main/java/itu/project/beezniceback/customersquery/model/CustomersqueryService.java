package itu.project.beezniceback.customersquery.model;
import itu.project.beezniceback.customersmoney.model.Customersmoney;
import itu.project.beezniceback.customersmoney.model.CustomersmoneyService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.List;
@Service
public class CustomersqueryService{
@Autowired
private CustomersqueryRepository customersqueryRepository;
@Autowired
private CustomersqueryViewRepository customersqueryViewRepository;
@Autowired
private CustomersmoneyService customersmoneyService;

public List<CustomersqueryView> getAll(){
   return customersqueryViewRepository.findAll();
}
public List<Customersquery> getPendingRequest(LocalDateTime localDateTime){return customersqueryRepository.findByPendingAndDate(localDateTime);}
public void save(Customersquery customersquery){
customersqueryRepository.save(customersquery);
}
@Transactional
public Customersquery saveRequest(ValidationDTO validationDTO){
   Customersquery customersquery = this.getById(validationDTO.getId()).get();
   customersquery.setIspending(false);
   this.save(customersquery);
   customersmoneyService.saveQuery(customersquery,validationDTO.getOrderDate());
   return customersquery;
}
public void delete(long id){
customersqueryRepository.deleteById(id);
}
public Optional<Customersquery> getById(long id){
   return customersqueryRepository.findById(id);
}
public void update(Customersquery existingCustomersquery){
   save(existingCustomersquery);
}
}