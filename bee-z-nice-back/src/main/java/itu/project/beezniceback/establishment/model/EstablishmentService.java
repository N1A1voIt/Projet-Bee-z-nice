package itu.project.beezniceback.establishment.model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Optional;
import java.util.List;
@Service
public class EstablishmentService{
@Autowired
private EstablishmentRepository establishmentRepository;
@Autowired
private EstablishmentViewRepository establishmentViewRepository;
public List<EstablishmentView> getAll(){
   return establishmentViewRepository.findAll();
}
public void save(Establishment establishment){
establishmentRepository.save(establishment);
}
public void delete(int id){
establishmentRepository.deleteById(id);
}
public Optional<Establishment> getById(int id){
   return establishmentRepository.findById(id);
}
public void update(Establishment existingEstablishment){
   save(existingEstablishment);
}
public List<EstablishmentsProfits> getProfits(LocalDate startDate,LocalDate endDate){return establishmentRepository.retrieveProfits(startDate,endDate);}
}