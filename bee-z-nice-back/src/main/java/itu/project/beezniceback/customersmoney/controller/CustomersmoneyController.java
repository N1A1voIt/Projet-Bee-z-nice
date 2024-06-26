package itu.project.beezniceback.customersmoney.controller;
import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.authentification.tokenHandler.TokenGenerator;
import itu.project.beezniceback.customersmoney.PayDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.customersmoney.model.*;

import java.time.LocalDateTime;

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
    @PostMapping("/api/customersmoney/getpay")
    public ResponseEntity<?> getPay(@RequestBody PayDto payDto, @RequestHeader(name = "Authorization") String authorizationHeader){
        try{
            LoggedCustomer loggedCustomer = tokenGenerator.decodeCustomer(authorizationHeader);
            LocalDateTime localDateTime = payDto.getOrderDate();
            return ResponseEntity.ok(customersmoneyService.getPay(loggedCustomer,localDateTime));
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