package itu.project.beezniceback.addtocart.model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;
import java.util.List;
@Service
public class AddtocartService{
@Autowired
private AddtocartRepository addtocartRepository;
@Autowired
private AddtocartViewRepository addtocartViewRepository;
public List<AddtocartView> getAll(){
   return addtocartViewRepository.findAll();
}
public void save(Addtocart addtocart){
addtocartRepository.save(addtocart);
}
public void delete(long id){
addtocartRepository.deleteById(id);
}
public Optional<Addtocart> getById(long id){
   return addtocartRepository.findById(id);
}
public void update(Addtocart existingAddtocart){
   save(existingAddtocart);
}
}