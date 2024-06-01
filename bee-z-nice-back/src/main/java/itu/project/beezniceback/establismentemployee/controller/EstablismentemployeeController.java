package itu.project.beezniceback.establismentemployee.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.establismentemployee.model.*;
@RestController
public class EstablismentemployeeController{
       @Autowired
      private EstablismentemployeeService establismentemployeeService;
       @GetMapping("/api/establismentemployee/findAll")
public ResponseEntity<?> findAll(){
return ResponseEntity.ok(establismentemployeeService.getAll());
}
       @GetMapping("/api/establismentemployee/findById/{id}")
public ResponseEntity<?> findById(@PathVariable String id){
return ResponseEntity.ok(establismentemployeeService.getById(id));
}
       @GetMapping("/api/establismentemployee/delete/{id}")
public void delete(@PathVariable String id){
establismentemployeeService.delete(id);
}
       @PostMapping("/api/establismentemployee/save")
public void save(@RequestBody Establismentemployee establismentemployee){
establismentemployeeService.save(establismentemployee);
}
       @PostMapping("/api/establismentemployee/update")
public void update(@RequestBody Establismentemployee establismentemployee){
establismentemployeeService.save(establismentemployee);
}
}