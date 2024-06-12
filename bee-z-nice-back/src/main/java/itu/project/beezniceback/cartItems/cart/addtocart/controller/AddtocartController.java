package itu.project.beezniceback.cartItems.cart.addtocart.controller;
import itu.project.beezniceback.cartItems.cart.addtocart.model.Addtocart;
import itu.project.beezniceback.cartItems.cart.addtocart.model.AddtocartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
@RestController
public class AddtocartController{
       @Autowired
      private AddtocartService addtocartService;
       @GetMapping("/api/addtocart/findAll")
public ResponseEntity<?> findAll(){
return ResponseEntity.ok(addtocartService.getAll());
}
       @GetMapping("/api/addtocart/findById/{id}")
public ResponseEntity<?> findById(@PathVariable long id){
return ResponseEntity.ok(addtocartService.getById(id));
}
       @GetMapping("/api/addtocart/delete/{id}")
public void delete(@PathVariable long id){
           System.out.println("Delete ");
           addtocartService.delete(id);
}
       @PostMapping("/api/addtocart/save")
public void save(@RequestBody Addtocart addtocart){
addtocartService.save(addtocart);
}
       @PostMapping("/api/addtocart/update")
public void update(@RequestBody Addtocart addtocart){
addtocartService.save(addtocart);
}
}