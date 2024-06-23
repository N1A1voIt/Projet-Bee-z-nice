package itu.project.beezniceback.benefice.models;

import java.math.BigDecimal;
import java.time.LocalDate;

public interface Profit {
    public LocalDate getStarter();

    public void setStarter(LocalDate starter);

    public BigDecimal getProfit();

    public void setProfit(BigDecimal profit);
}
