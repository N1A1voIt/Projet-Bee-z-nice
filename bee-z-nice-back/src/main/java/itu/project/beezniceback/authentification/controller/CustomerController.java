package itu.project.beezniceback.authentification.controller;

import eval.example.codegenerator.javaPackageManager.modelFileGenerator.GenerateModel;
import io.jsonwebtoken.Claims;
import itu.project.beezniceback.authentification.dto.LoginDTO;
import itu.project.beezniceback.authentification.model.Customer;
import itu.project.beezniceback.authentification.model.CustomerException;
import itu.project.beezniceback.authentification.model.CustomerService;
import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.authentification.tokenHandler.TokenGenerator;
import itu.project.beezniceback.cartItems.cart.CartToken;
import itu.project.beezniceback.cartItems.cart.dto.DisheQuantityDTO;
import itu.project.beezniceback.cartItems.cart.model.Cart;
import itu.project.beezniceback.cartItems.cart.model.CartService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
//import org.springframework.session.SessionRepository;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private HttpSession httpSession;

    @Autowired
    private TokenGenerator tokenGenerator;

    @Autowired
    private GenerateModel generateModel;

    @Autowired
    private CartToken cartToken;

    @GetMapping("/api/test")
    public ResponseEntity<?> generateCRUD(){
        try{
            generateModel.generateModel();
            return ResponseEntity.ok("Hello");
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e);
        }
    }

    @PostMapping("/api/register")
    public ResponseEntity<?> createUser(@RequestBody Customer customer) {
        try {
            LoggedCustomer loggedCustomer = customerService.authenticate(customer);
            String token = tokenGenerator.generateToken(loggedCustomer,new Cart(new HashMap<>()));
            System.out.println(token);
            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", token);
            return ResponseEntity.ok().headers(headers).body(loggedCustomer);
        } catch (CustomerException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred: " + e.getMessage());
        }
    }

    @PostMapping("/api/login")
    public ResponseEntity<?> login(@RequestBody LoginDTO loginDTO) {
        try {
            LoggedCustomer loggedCustomer = customerService.login(loginDTO);
            String token = tokenGenerator.generateToken(loggedCustomer,new Cart(new HashMap<>()));
            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", token);
            return ResponseEntity.ok().headers(headers).body(loggedCustomer);
        } catch (CustomerException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred: " + e.getMessage());
        }
    }

//    @GetMapping("/api/sessionAttributes")
//    public Map<String, Object> getSessionAttributes(Session session) {
//        // Create a Map to store session attributes
//        Map<String, Object> sessionAttributes = new HashMap<>();
//
//        // Get the names of all attributes bound to the session
//        Enumeration<String> attributeNames = (Enumeration<String>) session.getAttributeNames();
//
//        // Iterate through the attribute names and retrieve their values
//        while (attributeNames.hasMoreElements()) {
//            String attributeName = attributeNames.nextElement();
//            Object attributeValue = session.getAttribute(attributeName);
//            sessionAttributes.put(attributeName, attributeValue);
//        }
//
//        // Return the Map containing all session attributes
//        return sessionAttributes;
//    };

    @GetMapping("/api/checkSession")
    public ResponseEntity<?> sessionExist() {
//        System.out.println( httpSession.getAttribute("message"));
        if (httpSession.getAttribute("user") != null) {
            return ResponseEntity.ok( httpSession.getAttribute("user"));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not found in session");
        }
    }
    @GetMapping("/api/my-profile")
    public ResponseEntity<?> myProfile(@RequestHeader(name = "Authorization") String authorizationHeader) {
        System.out.println(authorizationHeader);
        Claims claims = tokenGenerator.decodeToken(authorizationHeader);
        Map<String, Object> loggedCustomer = claims.get("user",Map.class);
        if (loggedCustomer != null) {
            return ResponseEntity.ok(loggedCustomer);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not found in session");
        }
    }
}
