package itu.project.beezniceback.benefice.models;

import java.math.BigDecimal;
import java.time.LocalDate;

public class DailyProfit {
    private LocalDate date;
    private BigDecimal dailyProfit;

    public DailyProfit(LocalDate date, BigDecimal dailyProfit) {
        this.date = date;
        this.dailyProfit = dailyProfit;
    }

    // Getters and setters
    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public BigDecimal getDailyProfit() {
        return dailyProfit;
    }

    public void setDailyProfit(BigDecimal dailyProfit) {
        this.dailyProfit = dailyProfit;
    }
}
