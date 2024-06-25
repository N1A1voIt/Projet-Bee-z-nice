package itu.project.beezniceback.dashboard.controller;

import itu.project.beezniceback.benefice.models.DateRangeDTO;
import itu.project.beezniceback.dashboard.model.DashboardDTO;
import itu.project.beezniceback.dashboard.model.DashboardService;
import itu.project.beezniceback.establishment.model.EstablishmentService;
import itu.project.beezniceback.establishment.model.EstablishmentsProfits;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

import static org.springframework.http.ResponseEntity.ok;

@RestController
public class DashboardController {
    @Autowired
    private DashboardService dashboardService;
    @PostMapping("/api/dashboard")
    public ResponseEntity<?> retrieveDashboard(@RequestBody DashboardDTO dashboardDto){
        LocalDate startDate = dashboardDto.getStartDate();
        LocalDate endDate = dashboardDto.getEndDate();
        if (startDate == null){
            startDate = LocalDate.of(2000,01,12);
        }if (endDate == null){
            endDate = LocalDate.of(3000,01,12);
        }
        return ResponseEntity.ok(dashboardService.findElements(startDate,endDate,dashboardDto.getIdEstablishment()));
    }

}
