package itu.project.beezniceback.chiffreaffaires.controller;

import itu.project.beezniceback.chiffreaffaires.service.FoodOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.Map;

@RestController
public class CaController {

    @Autowired
    private FoodOrderService foodOrderService;

    @GetMapping("/totalRevenue")
    public ResponseEntity<?> getTotalRevenue(@RequestParam Timestamp startDate, @RequestParam Timestamp endDate) {
        try {
            double totalRevenue = foodOrderService.calculateTotalRevenueBetweenDates(startDate, endDate);
            return ResponseEntity.ok(totalRevenue);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body("Invalid date parameters: " + e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred: " + e.getMessage());
        }
    }

    @GetMapping("/dailyRevenue")
    public ResponseEntity<?> getDailyRevenue(@RequestParam Timestamp startDate, @RequestParam Timestamp endDate) {
        try {
            Map<String, Double> dailyRevenue = foodOrderService.calculateDailyRevenueBetweenDates(startDate, endDate);
            return ResponseEntity.ok(dailyRevenue);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body("Invalid date parameters: " + e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred: " + e.getMessage());
        }
    }
}
