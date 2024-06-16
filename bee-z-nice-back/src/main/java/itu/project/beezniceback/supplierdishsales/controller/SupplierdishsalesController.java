package itu.project.beezniceback.supplierdishsales.controller;
import itu.project.beezniceback.supplierdishsales.model.SupplierdishsalesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

@RestController
public class SupplierdishsalesController{
       @Autowired
      private SupplierdishsalesService supplierdishsalesService;
       @GetMapping("/api/supplierdishsales/findAll")
public ResponseEntity<?> findAll(){
return ResponseEntity.ok(supplierdishsalesService.getAll());
}
}