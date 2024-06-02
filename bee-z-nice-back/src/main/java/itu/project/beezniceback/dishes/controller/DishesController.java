package itu.project.beezniceback.dishes.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.dishes.model.*;
@RestController
public class DishesController{
    @Autowired
    private DishesService dishesService;
    @GetMapping("/api/dishes/findAll")
    public ResponseEntity<?> findAll(){
    return ResponseEntity.ok(dishesService.getAll());
    }
    @GetMapping("/api/dishes/findById/{id}")
    public ResponseEntity<?> findById(@PathVariable int id){
    return ResponseEntity.ok(dishesService.getById(id));
    }
    @GetMapping("/api/dishes/findByIdType/{id}")
    public ResponseEntity<?> findByIdType(@PathVariable int id){return ResponseEntity.ok(dishesService.getByIdType(id));}
    @GetMapping("/api/dishes/delete/{id}")
    public void delete(@PathVariable int id){
    dishesService.delete(id);
    }
    @PostMapping("/api/dishes/save")
    public void save(@RequestBody Dishes dishes){
    dishesService.save(dishes);
    }
    @PostMapping("/api/dishes/update")
    public void update(@RequestBody Dishes dishes){
    dishesService.save(dishes);
    }
}