package itu.project.beezniceback.foodorder.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.foodorder.model.*;
@RestController
public class FoodorderController{
       @Autowired
      private FoodorderService foodorderService;
       @GetMapping("/api/foodorder/findAll")
public ResponseEntity<?> findAll(){
return ResponseEntity.ok(foodorderService.getAll());
}
       @GetMapping("/api/foodorder/findById/{id}")
public ResponseEntity<?> findById(@PathVariable long id){
return ResponseEntity.ok(foodorderService.getById(id));
}
       @GetMapping("/api/foodorder/delete/{id}")
public void delete(@PathVariable long id){
foodorderService.delete(id);
}
       @PostMapping("/api/foodorder/save")
public void save(@RequestBody Foodorder foodorder){
foodorderService.save(foodorder);
}
       @PostMapping("/api/foodorder/update")
public void update(@RequestBody Foodorder foodorder){
foodorderService.save(foodorder);
}
}