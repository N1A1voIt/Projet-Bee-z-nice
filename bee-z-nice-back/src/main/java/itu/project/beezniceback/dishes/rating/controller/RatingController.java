package itu.project.beezniceback.dishes.rating.controller;

import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.authentification.tokenHandler.TokenGenerator;
import itu.project.beezniceback.dishes.rating.model.Rating;
import itu.project.beezniceback.dishes.rating.model.RatingDisheView;
import itu.project.beezniceback.dishes.rating.model.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class RatingController {
    @Autowired
    private RatingService ratingService;
    @Autowired
    private TokenGenerator tokenGenerator;
    @PostMapping("/api/rating/save")
    public ResponseEntity<?> handleRatingRequest(@RequestBody Rating rating){
        try{
            return ResponseEntity.ok(ratingService.save(rating));
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
    @GetMapping("/api/rating/findall")
    public ResponseEntity<?> findall(@RequestHeader(name = "Authorization") String authorizationHeader){
        try{
            LoggedCustomer loggedCustomer = tokenGenerator.decodeCustomer(authorizationHeader);
            List<RatingDisheView> ratingDisheViews = ratingService.retrieveRatingDisheById(loggedCustomer);
            return ResponseEntity.ok(ratingDisheViews);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
