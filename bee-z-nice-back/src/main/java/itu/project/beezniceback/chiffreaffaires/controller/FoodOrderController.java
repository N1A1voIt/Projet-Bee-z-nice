package itu.project.beezniceback.chiffreaffaires.controller;

import itu.project.beezniceback.chiffreaffaires.service.FoodOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;
import java.util.Map;

@RestController
public class FoodOrderController {

    @Autowired
    private FoodOrderService foodOrderService;

    @GetMapping("/totalRevenue")
    public double getTotalRevenue(@RequestParam Timestamp startDate, @RequestParam Timestamp endDate) {
        return foodOrderService.calculateTotalRevenueBetweenDates(startDate, endDate);
    }

    @GetMapping("/dailyRevenue")
    public Map<String, Double> getDailyRevenue(@RequestParam Timestamp startDate, @RequestParam Timestamp endDate) {
        return foodOrderService.calculateDailyRevenueBetweenDates(startDate, endDate);
    }
}
