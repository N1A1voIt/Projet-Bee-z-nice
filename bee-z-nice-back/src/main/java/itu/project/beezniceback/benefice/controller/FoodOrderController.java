package itu.project.beezniceback.benefice.controller;

import itu.project.beezniceback.benefice.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/food-orders")
public class FoodOrderController {

    @Autowired
    private FoodOrderService foodOrderService;

    @GetMapping("/benefits")
    public ResponseEntity<List<DailyProfit>> getBenefitsBetweenDates(
            @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        List<DailyProfit> benefits = foodOrderService.getBenefitsBetweenDates(startDate, endDate);
        return ResponseEntity.ok(benefits);
    }

    @GetMapping("/total-benefits")
    public ResponseEntity<BigDecimal> getTotalBenefitsBetweenDates(
            @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        BigDecimal totalBenefits = foodOrderService.getTotalBenefitsBetweenDates(startDate, endDate);
        return ResponseEntity.ok(totalBenefits);
    }
}
