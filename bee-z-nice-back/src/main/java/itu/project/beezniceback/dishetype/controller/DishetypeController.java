package itu.project.beezniceback.dishetype.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.dishetype.model.*;
@RestController
public class DishetypeController{
       @Autowired
      private DishetypeService dishetypeService;
       @GetMapping("/api/dishetype/findAll")
public ResponseEntity<?> findAll(){
return ResponseEntity.ok(dishetypeService.getAll());
}
       @GetMapping("/api/dishetype/findById/{id}")
public ResponseEntity<?> findById(@PathVariable int id){
return ResponseEntity.ok(dishetypeService.getById(id));
}
       @GetMapping("/api/dishetype/delete/{id}")
public void delete(@PathVariable int id){
dishetypeService.delete(id);
}
       @PostMapping("/api/dishetype/save")
public void save(@RequestBody Dishetype dishetype){
dishetypeService.save(dishetype);
}
       @PostMapping("/api/dishetype/update")
public void update(@RequestBody Dishetype dishetype){
dishetypeService.save(dishetype);
}
}