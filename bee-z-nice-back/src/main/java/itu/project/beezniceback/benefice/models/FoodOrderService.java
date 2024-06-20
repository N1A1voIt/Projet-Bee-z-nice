package itu.project.beezniceback.benefice.models;

import itu.project.beezniceback.benefice.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
public class FoodOrderService {

    @Autowired
    private FoodOrderRepository foodOrderRepository;

    public List<DailyProfit> getBenefitsBetweenDates(LocalDate startDate, LocalDate endDate) {
        return foodOrderRepository.calculateBenefits(startDate, endDate);
    }

    public BigDecimal getTotalBenefitsBetweenDates(LocalDate startDate, LocalDate endDate) {
        return foodOrderRepository.calculateTotalBenefits(startDate, endDate);
    }
}
