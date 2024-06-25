package itu.project.beezniceback.supplierpayment.controller;

import itu.project.beezniceback.supplierpayment.model.Supplierpayment;
import itu.project.beezniceback.supplierpayment.model.SupplierpaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SupplierPaymentController {
    @Autowired
    private SupplierpaymentService supplierpaymentService;

    @GetMapping("/api/supplierPayment/findAll")
    public ResponseEntity<?> findAll(){return ResponseEntity.ok(supplierpaymentService.getAll());}

    @PostMapping("/api/supplierPayment/findAll")
    public void save(@RequestBody Supplierpayment supplierpayment){supplierpaymentService.save(supplierpayment);}
    
}
