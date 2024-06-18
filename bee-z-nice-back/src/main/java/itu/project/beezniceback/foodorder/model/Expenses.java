package itu.project.beezniceback.foodorder.model;

import java.math.BigDecimal;

public class Expenses {
    private BigDecimal expenses;

    public Expenses() {
        // Default constructor required by Hibernate
    }

    public Expenses(BigDecimal expenses) {
        this.expenses = expenses;
    }

    public BigDecimal getExpenses() {
        return expenses;
    }

    public void setExpenses(BigDecimal expenses) {
        this.expenses = expenses;
    }
}
