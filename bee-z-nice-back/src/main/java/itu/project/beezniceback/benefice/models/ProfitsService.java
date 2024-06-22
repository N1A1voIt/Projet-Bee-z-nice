package itu.project.beezniceback.benefice.models;

import itu.project.beezniceback.benefice.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
public class ProfitsService {

    @Autowired
    private ProfitsRepository foodOrderRepository;

    public List<DailyProfit> getBenefitsBetweenDates(LocalDate startDate, LocalDate endDate) {
        return foodOrderRepository.calculateBenefits(startDate, endDate);
    }

    public BigDecimal getTotalBenefitsBetweenDates(LocalDate startDate, LocalDate endDate,int idEstablishment) {
        DailyProfit dailyProfit = foodOrderRepository.calculateTotalBenefits(startDate, endDate);
        if (idEstablishment != 0){
            dailyProfit = foodOrderRepository.calculateTotalBenefitsByEstablishment(idEstablishment,startDate, endDate);
        }
        if (dailyProfit == null){
            System.out.println("Daily profit is null");
        }
        return dailyProfit != null ? dailyProfit.getDailyProfit() : new BigDecimal(0);
    }
}
