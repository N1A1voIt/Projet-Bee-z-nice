package itu.project.beezniceback.cartItems.cart.controller;

import io.jsonwebtoken.Claims;
import itu.project.beezniceback.authentification.tokenHandler.TokenGenerator;
import itu.project.beezniceback.cartItems.cart.model.Cart;
import itu.project.beezniceback.cartItems.cart.model.CartService;
import org.antlr.v4.runtime.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class CartController {
    @Autowired
    private TokenGenerator tokenGenerator;
    @Autowired
    private CartService cartService;
    @GetMapping(name = "/api/addToCart/{id}")
    public ResponseEntity<?> addToCart(@RequestHeader(name = "Authorization") String authorizationHeader, @PathVariable int idDishe){
        try{
            Cart cart = tokenGenerator.getCartFromClaims(authorizationHeader);
            cartService.addToCart(idDishe,cart);
            return ResponseEntity.ok(true);
        }catch (Exception e){
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
