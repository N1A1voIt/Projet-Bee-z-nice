package itu.project.beezniceback.supplier.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.supplier.model.*;
@RestController
public class SupplierController{
       @Autowired
      private SupplierService supplierService;
       @GetMapping("/api/supplier/findAll")
public ResponseEntity<?> findAll(){
return ResponseEntity.ok(supplierService.getAll());
}
       @GetMapping("/api/supplier/findById/{id}")
public ResponseEntity<?> findById(@PathVariable int id){
return ResponseEntity.ok(supplierService.getById(id));
}
       @GetMapping("/api/supplier/delete/{id}")
public void delete(@PathVariable int id){
supplierService.delete(id);
}
       @PostMapping("/api/supplier/save")
public void save(@RequestBody Supplier supplier){
supplierService.save(supplier);
}
       @PostMapping("/api/supplier/update")
public void update(@RequestBody Supplier supplier){
supplierService.save(supplier);
}
}