package itu.project.beezniceback.capitale.controller;

import itu.project.beezniceback.capitale.service.CurrentCapitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CapitaleController {

    @Autowired
    private CurrentCapitalService currentCapitalService;

    // Endpoint pour récupérer la valeur de la capitale
    @GetMapping("/capitale")
    public ResponseEntity<Long> getCapitale() {
        Long capitale = currentCapitalService.getCapitale();
        return ResponseEntity.ok(capitale);
    }
}
