package itu.project.beezniceback.customersquery.controller;
import itu.project.beezniceback.customersmoney.PayDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.customersquery.model.*;
@RestController
public class CustomersqueryController{
       @Autowired
      private CustomersqueryService customersqueryService;
       @PostMapping("/api/customersquery/findPendingRequest")
        public ResponseEntity<?> findPendingRequest(@RequestBody PayDto payDto){
            return ResponseEntity.ok(customersqueryService.getPendingRequest(payDto.getOrderDate()));
        }
       @GetMapping("/api/customersquery/findById/{id}")
        public ResponseEntity<?> findById(@PathVariable long id){
        return ResponseEntity.ok(customersqueryService.getById(id));
        }
        @PostMapping("/api/customersquery/validate")
        public ResponseEntity<?> validate(@RequestBody ValidationDTO validationDTO){
            try{
                return ResponseEntity.ok(customersqueryService.saveRequest(validationDTO));
            }catch (Exception e){
                return ResponseEntity.badRequest().body("Une erreur s'est passé du coté serveur");
            }
        }
       @GetMapping("/api/customersquery/delete/{id}")
public void delete(@PathVariable long id){
customersqueryService.delete(id);
}
       @PostMapping("/api/customersquery/save")
public void save(@RequestBody Customersquery customersquery){
customersqueryService.save(customersquery);
}
       @PostMapping("/api/customersquery/update")
public void update(@RequestBody Customersquery customersquery){
customersqueryService.save(customersquery);
}
}