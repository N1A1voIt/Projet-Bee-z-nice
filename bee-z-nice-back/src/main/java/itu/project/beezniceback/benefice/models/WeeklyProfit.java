package itu.project.beezniceback.benefice.models;

import java.math.BigDecimal;
import java.time.LocalDate;

public interface WeeklyProfit {
    public LocalDate getWeek_start();

    public void setWeek_start(LocalDate week_start);

    public BigDecimal getWeeklyProfit();

    public void setWeeklyProfit(BigDecimal weeklyProfit);
}
