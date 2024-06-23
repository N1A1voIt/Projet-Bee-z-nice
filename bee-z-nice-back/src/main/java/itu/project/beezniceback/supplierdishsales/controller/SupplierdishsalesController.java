package itu.project.beezniceback.supplierdishsales.controller;
import itu.project.beezniceback.benefice.models.DateRangeDTO;
import itu.project.beezniceback.supplierdishsales.model.SupplierdishsalesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

import java.time.LocalDate;

@RestController
public class SupplierdishsalesController{
       @Autowired
      private SupplierdishsalesService supplierdishsalesService;
       @GetMapping("/api/supplierdishsales/findAll")
        public ResponseEntity<?> findAll(){
            return ResponseEntity.ok(supplierdishsalesService.getAll());
        }
        @PostMapping("/api/supplierdishsales/activityByDate")
        public ResponseEntity<?> findActivityByDate(@RequestBody DateRangeDTO dateRangeDTO){
            LocalDate startDate = dateRangeDTO.getStartDate();
            LocalDate endDate = dateRangeDTO.getEndDate();
            if (startDate == null){
                startDate = LocalDate.of(2000,01,12);
            }if (endDate == null){
                endDate = LocalDate.of(3000,01,12);
            }
           return ResponseEntity.ok(supplierdishsalesService.getActivityByDate(startDate,endDate));
        }
}