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
@RequestMapping("/api/profits")
public class ProfitsController {

    @Autowired
    private ProfitsService foodOrderService;

    @PostMapping("/benefits")
    public ResponseEntity<List<DailyProfit>> getBenefitsBetweenDates(@RequestBody DateRangeDTO dateRangeDTO) {
        LocalDate startDate = dateRangeDTO.getStartDate();
        LocalDate endDate = dateRangeDTO.getEndDate();
        List<DailyProfit> benefits = foodOrderService.getBenefitsBetweenDates(startDate, endDate);
        return ResponseEntity.ok(benefits);
    }

    @PostMapping("/total-benefits")
    public ResponseEntity<BigDecimal> getTotalBenefitsBetweenDates(@RequestBody DateRangeDTO dateRangeDTO) {
        LocalDate startDate = dateRangeDTO.getStartDate();
        LocalDate endDate = dateRangeDTO.getEndDate();
        BigDecimal totalBenefits = foodOrderService.getTotalBenefitsBetweenDates(startDate, endDate);
        return ResponseEntity.ok(totalBenefits);
    }
}
