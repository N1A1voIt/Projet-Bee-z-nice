package itu.project.beezniceback.supplierdishsales.model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
@Service
public class SupplierdishsalesService{
@Autowired
private SupplierdishsalesRepository supplierdishsalesRepository;
   public List<Supplierdishsales> getAll() {
      return supplierdishsalesRepository.findAll();
   }
   public List<Supplierdishsales> getActivityByDate(LocalDate startDate,LocalDate endDate){
      return supplierdishsalesRepository.findActiveSupplierByDate(startDate,endDate);
   }
}