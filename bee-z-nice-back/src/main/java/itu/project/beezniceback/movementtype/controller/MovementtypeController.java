package itu.project.beezniceback.movementtype.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.movementtype.model.*;
@RestController
public class MovementtypeController{
       @Autowired
      private MovementtypeService movementtypeService;
       @GetMapping("/api/movementtype/findAll")
public ResponseEntity<?> findAll(){
return ResponseEntity.ok(movementtypeService.getAll());
}
       @GetMapping("/api/movementtype/findById/{id}")
public ResponseEntity<?> findById(@PathVariable int id){
return ResponseEntity.ok(movementtypeService.getById(id));
}
       @GetMapping("/api/movementtype/delete/{id}")
public void delete(@PathVariable int id){
movementtypeService.delete(id);
}
       @PostMapping("/api/movementtype/save")
public void save(@RequestBody Movementtype movementtype){
movementtypeService.save(movementtype);
}
       @PostMapping("/api/movementtype/update")
public void update(@RequestBody Movementtype movementtype){
movementtypeService.save(movementtype);
}
}