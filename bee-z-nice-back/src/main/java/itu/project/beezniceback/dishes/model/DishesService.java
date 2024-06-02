package itu.project.beezniceback.dishes.model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;
import java.util.List;
@Service
public class DishesService{
@Autowired
private DishesRepository dishesRepository;
@Autowired
private DishesViewRepository dishesViewRepository;
public List<DishesView> getAll(){
   return dishesViewRepository.findAll();
}
public void save(Dishes dishes){
dishesRepository.save(dishes);
}
public void delete(int id){
dishesRepository.deleteById(id);
}
public Optional<Dishes> getById(int id){
   return dishesRepository.findById(id);
}
public void update(Dishes existingDishes){
   save(existingDishes);
}
public List<DishesView> getByIdType(int id){
   List<Dishes> dishes = dishesRepository.findByIdtype(id);
   System.out.println("Here");
   List<DishesView> dishesViews = getAll();
   List<DishesView> ret = new ArrayList<>();
   for (int i = 0; i < dishes.size(); i++) {
      for (int j = 0; j < dishesViews.size(); j++) {
         if (dishes.get(i).getId() == dishesViews.get(j).getId()){
            ret.add(dishesViews.get(j));
         }
      }
   }
   return ret;
}
}