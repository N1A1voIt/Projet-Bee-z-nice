package itu.project.beezniceback.establishment.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.establishment.model.*;
@RestController
public class EstablishmentController{
       @Autowired
      private EstablishmentService establishmentService;
       @GetMapping("/api/establishment/findAll")
public ResponseEntity<?> findAll(){
return ResponseEntity.ok(establishmentService.getAll());
}
       @GetMapping("/api/establishment/findById/{id}")
public ResponseEntity<?> findById(@PathVariable int id){
return ResponseEntity.ok(establishmentService.getById(id));
}
       @GetMapping("/api/establishment/delete/{id}")
public void delete(@PathVariable int id){
establishmentService.delete(id);
}
       @PostMapping("/api/establishment/save")
public void save(@RequestBody Establishment establishment){
establishmentService.save(establishment);
}
       @PostMapping("/api/establishment/update")
public void update(@RequestBody Establishment establishment){
establishmentService.save(establishment);
}
}