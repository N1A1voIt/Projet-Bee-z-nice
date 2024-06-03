package itu.project.beezniceback.dishetype.model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;
import java.util.List;
@Service
public class DishetypeService{
@Autowired
private DishetypeRepository dishetypeRepository;
@Autowired
private DishetypeViewRepository dishetypeViewRepository;
public List<DishetypeView> getAll(){
   return dishetypeViewRepository.findAll();
}
public void save(Dishetype dishetype){
dishetypeRepository.save(dishetype);
}
public void delete(int id){
dishetypeRepository.deleteById(id);
}
public Optional<Dishetype> getById(int id){
   return dishetypeRepository.findById(id);
}
public void update(Dishetype existingDishetype){
   save(existingDishetype);
}
}