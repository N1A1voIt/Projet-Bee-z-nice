package itu.project.beezniceback.benefice.controller;

import itu.project.beezniceback.benefice.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/api/profits")
public class ProfitsController {

    @Autowired
    private ProfitsService foodOrderService;

    @PostMapping("/benefits")
    public ResponseEntity<?> getBenefitsBetweenDates(@RequestBody DateRangeWithTypeDTO dateRangeDTO) {
        LocalDate startDate = dateRangeDTO.getStartDate();
        LocalDate endDate = dateRangeDTO.getEndDate();
        if (startDate == null){
            startDate = LocalDate.of(2000,01,12);
        }if (endDate == null){
            endDate = LocalDate.of(3000,01,12);
        }
        return ResponseEntity.ok(foodOrderService.getBenefitsBetweenDates(startDate, endDate,dateRangeDTO.getType()));
    }

    @PostMapping("/total-benefits")
    public ResponseEntity<BigDecimal> getTotalBenefitsBetweenDates(@RequestBody DateRangeDTO dateRangeDTO) {
        LocalDate startDate = dateRangeDTO.getStartDate();
        LocalDate endDate = dateRangeDTO.getEndDate();
        BigDecimal totalBenefits = foodOrderService.getTotalBenefitsBetweenDates(startDate, endDate,0);
        return ResponseEntity.ok(totalBenefits);
    }
}
