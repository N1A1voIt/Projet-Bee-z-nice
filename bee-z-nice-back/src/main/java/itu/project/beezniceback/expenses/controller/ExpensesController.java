package itu.project.beezniceback.expenses.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import itu.project.beezniceback.expenses.model.ExpensesService;


@RestController
public class ExpensesController {
    @Autowired
    private ExpensesService expensesService;
    
    @GetMapping("/api/foodorder/prixRevient")
        public ResponseEntity<?> getTotalPrixRevient(@RequestParam Timestamp startDate, @RequestParam Timestamp endDate) {
        try {
            double totalPrixRevient = expensesService.calculPrixRevient(startDate, endDate);
            return ResponseEntity.ok(totalPrixRevient);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body("Invalid date parameters: " + e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred: " + e.getMessage());
        }
    }

}
