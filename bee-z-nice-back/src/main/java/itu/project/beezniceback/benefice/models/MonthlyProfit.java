package itu.project.beezniceback.benefice.models;

import java.math.BigDecimal;
import java.time.LocalDate;

public interface MonthlyProfit {
    public LocalDate getMonth_start();

    public void setMonth_start(LocalDate month_start);

    public BigDecimal getMonthlyProfit();

    public void setMonthlyProfit(BigDecimal monthlyProfit);
}
