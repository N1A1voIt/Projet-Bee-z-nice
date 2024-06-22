package itu.project.beezniceback.benefice.models;

import java.math.BigDecimal;
import java.time.LocalDate;

public interface DailyProfit {
    // Getters and setters
    public LocalDate getDaty();

    public void setDaty(LocalDate daty);

    public BigDecimal getDailyProfit();

    public void setDailyProfit(BigDecimal dailyProfit);
}
