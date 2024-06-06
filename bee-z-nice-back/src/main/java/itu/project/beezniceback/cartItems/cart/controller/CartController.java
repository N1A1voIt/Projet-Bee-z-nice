package itu.project.beezniceback.cartItems.cart.controller;

import io.jsonwebtoken.Claims;
import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.authentification.tokenHandler.TokenGenerator;
import itu.project.beezniceback.cartItems.cart.dto.DisheQuantityDTO;
import itu.project.beezniceback.cartItems.cart.model.Cart;
import itu.project.beezniceback.cartItems.cart.model.CartService;
import org.antlr.v4.runtime.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
public class CartController {
    @Autowired
    private TokenGenerator tokenGenerator;
    @Autowired
    private CartService cartService;
    @PostMapping("/api/cart/addToCart")
    public ResponseEntity<?> addToCart(@RequestBody DisheQuantityDTO disheQuantityDTO, @RequestHeader(name = "Authorization") String authorizationHeader){
        try{
            LoggedCustomer loggedCustomer = tokenGenerator.decodeCustomer(authorizationHeader);
            cartService.addToCart(disheQuantityDTO.getId(), disheQuantityDTO.getQuantity(), loggedCustomer);
            return ResponseEntity.ok(true);
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(e);
        }
    }
    @GetMapping("/api/cart/pendingRequest")
    public ResponseEntity<?> pendingRequest(@RequestHeader(name = "Authorization") String authorizationHeader){
        return null;
    }
    @PostMapping("/api/cart/removeToCart")
    public ResponseEntity<?> removeToCart(@RequestBody DisheQuantityDTO disheQuantityDTO, @RequestHeader(name = "Authorization") String authorizationHeader){
        try{
            LoggedCustomer loggedCustomer = tokenGenerator.decodeCustomer(authorizationHeader);
            cartService.removeToCart(disheQuantityDTO.getId(), loggedCustomer);
            return ResponseEntity.ok(true);
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(e);
        }
    }
//    @GetMapping(name = "/api/removeItem/{id}")
//    public ResponseEntity<?> removeToCart(@RequestHeader(name = "Authorization") String authorizationHeader,@PathVariable int idDishe){
//        try{
////            Cart cart = tokenGenerator.getCartFromClaims(authorizationHeader);
////            cartService.removeToCart(idDishe,cart);
//            return ResponseEntity.ok(true);
//        }catch (Exception e){
//            return ResponseEntity.badRequest().body(e);
//        }
//    }
//    public ResponseEntity<?> buy(){
//
//    }
}
