package itu.project.beezniceback.chiffreaffaires.service;

import itu.project.beezniceback.chiffreaffaires.repository.FoodOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FoodOrderService {

    @Autowired
    private FoodOrderRepository foodOrderRepository;

    public double calculateTotalRevenueBetweenDates(Timestamp startDate, Timestamp endDate) {
        Double totalRevenue = foodOrderRepository.findTotalRevenueBetweenDates(startDate, endDate);
        return totalRevenue != null ? totalRevenue : 0.0;
    }

    public Map<String, Double> calculateDailyRevenueBetweenDates(Timestamp startDate, Timestamp endDate) {
        List<Object[]> results = foodOrderRepository.findDailyRevenueBetweenDates(startDate, endDate);
        Map<String, Double> dailyRevenue = new HashMap<>();
        for (Object[] result : results) {
            String date = result[0].toString();
            Double revenue = (Double) result[1];
            dailyRevenue.put(date, revenue);
        }
        return dailyRevenue;
    }
}
