package itu.project.beezniceback.movementtype.model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;
import java.util.List;
@Service
public class MovementtypeService{
@Autowired
private MovementtypeRepository movementtypeRepository;
@Autowired
private MovementtypeViewRepository movementtypeViewRepository;
public List<MovementtypeView> getAll(){
   return movementtypeViewRepository.findAll();
}
public void save(Movementtype movementtype){
movementtypeRepository.save(movementtype);
}
public void delete(int id){
movementtypeRepository.deleteById(id);
}
public Optional<Movementtype> getById(int id){
   return movementtypeRepository.findById(id);
}
public void update(Movementtype existingMovementtype){
   save(existingMovementtype);
}
}