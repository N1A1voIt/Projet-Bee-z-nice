package itu.project.beezniceback.customersmoney.controller;
import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.authentification.tokenHandler.TokenGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.customersmoney.model.*;
@RestController
public class CustomersmoneyController{
    @Autowired
    private CustomersmoneyService customersmoneyService;
    @Autowired
    private TokenGenerator tokenGenerator;

    @GetMapping("/api/customersmoney/findAll")
    public ResponseEntity<?> findAll(){
    return ResponseEntity.ok(customersmoneyService.getAll());
    }
    @GetMapping("/api/customersmoney/findById/{id}")
    public ResponseEntity<?> findById(@PathVariable long id){
        return ResponseEntity.ok(customersmoneyService.getById(id));
    }
    @GetMapping("/api/customersmoney/getpay")
    public ResponseEntity<?> getPay(@RequestHeader(name = "Authorization") String authorizationHeader){
        try{
            LoggedCustomer loggedCustomer = tokenGenerator.decodeCustomer(authorizationHeader);
            return ResponseEntity.ok(customersmoneyService.getPay(loggedCustomer));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(e);
        }
    }
    @GetMapping("/api/customersmoney/delete/{id}")
    public void delete(@PathVariable long id){
    customersmoneyService.delete(id);
    }
    @PostMapping("/api/customersmoney/save")
    public void save(@RequestBody Customersmoney customersmoney){
    customersmoneyService.save(customersmoney);
    }
    @PostMapping("/api/customersmoney/update")
    public void update(@RequestBody Customersmoney customersmoney){
    customersmoneyService.save(customersmoney);
    }
}