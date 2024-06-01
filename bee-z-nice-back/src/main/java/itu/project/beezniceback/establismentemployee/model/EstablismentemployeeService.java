package itu.project.beezniceback.establismentemployee.model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;
import java.util.List;
@Service
public class EstablismentemployeeService{
@Autowired
private EstablismentemployeeRepository establismentemployeeRepository;
@Autowired
private EstablismentemployeeViewRepository establismentemployeeViewRepository;
public List<EstablismentemployeeView> getAll(){
   return establismentemployeeViewRepository.findAll();
}
public void save(Establismentemployee establismentemployee){
establismentemployeeRepository.save(establismentemployee);
}
public void delete(String id){
establismentemployeeRepository.deleteById(id);
}
public Optional<Establismentemployee> getById(String id){
   return establismentemployeeRepository.findById(id);
}
public void update(Establismentemployee existingEstablismentemployee){
   save(existingEstablismentemployee);
}
}