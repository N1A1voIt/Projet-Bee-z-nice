package itu.project.beezniceback.supplierpayment.controller;

import itu.project.beezniceback.supplierpayment.model.Supplierpayment;
import itu.project.beezniceback.supplierpayment.model.SupplierpaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.time.LocalDate;

@RestController
public class SupplierPaymentController {
    @Autowired
    private SupplierpaymentService supplierpaymentService;

    @GetMapping("/api/supplierPayment/findAll")
    public ResponseEntity<?> findAll(){return ResponseEntity.ok(supplierpaymentService.getAll());}

    @PostMapping("/api/supplierPayment/save")
    public void save(@PathVariable("idunpayedstock") String id){
        Supplierpayment supplierpayment=new Supplierpayment();
        supplierpayment.setIdunpayedstock(Long.parseLong(id));
        supplierpayment.setTime(Instant.from(LocalDate.now()));
        supplierpaymentService.save(supplierpayment);
    }
    
}
