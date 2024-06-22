package itu.project.beezniceback.expenses.controller;

import java.sql.Timestamp;
import java.time.LocalDate;

import itu.project.beezniceback.expenses.model.DateRangeRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import itu.project.beezniceback.expenses.model.ExpensesService;


@RestController
public class ExpensesController {
    @Autowired
    private ExpensesService expensesService;
    
    @PostMapping("/api/foodorder/prixRevient")
        public ResponseEntity<?> getTotalPrixRevient(@RequestBody DateRangeRequest dateRangeRequest) {
        try {
            LocalDate startDate = dateRangeRequest.getStartDate();
            LocalDate endDate = dateRangeRequest.getEndDate();
//            int idEstablishment = dateRangeRequest.get
            double totalPrixRevient = expensesService.calculPrixRevient(startDate, endDate,0);
            return ResponseEntity.ok(totalPrixRevient);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body("Invalid date parameters: " + e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred: " + e.getMessage());
        }
    }

}
