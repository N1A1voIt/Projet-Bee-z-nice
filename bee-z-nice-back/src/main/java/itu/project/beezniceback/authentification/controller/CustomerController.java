package itu.project.beezniceback.authentification.controller;

import eval.example.codegenerator.javaPackageManager.modelFileGenerator.GenerateModel;
import itu.project.beezniceback.authentification.model.Customer;
import itu.project.beezniceback.authentification.model.CustomerException;
import itu.project.beezniceback.authentification.model.CustomerService;
import itu.project.beezniceback.authentification.model.LoggedCustomer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
@Service
@RestController
public class CustomerController {

    @Autowired
    private GenerateModel generateModel;
    @Autowired
    private CustomerService customerService;
    @GetMapping("/api/test")
    public void test() throws Exception {
        generateModel.generateModel();
    }
    @PostMapping("/api/register")
    public ResponseEntity<?> createUser(@RequestBody Customer customer, HttpServletRequest request){
        try{
            LoggedCustomer loggedCustomer = customerService.authenticate(customer);
            request.getSession().setAttribute("user",loggedCustomer);
            return ResponseEntity.ok(loggedCustomer);
        }catch (CustomerException e) {
            System.out.println(e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred: " + e.getMessage());
        }
    }
}
