package itu.project.beezniceback.expenses.model;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;

public class ExpensesService {
        @Autowired
        private ExpensesRepository expensesRepository;

        public double calculPrixRevient(Timestamp startDate, Timestamp endDate) {
        Double prixRevient = expensesRepository.findExpensesBetweenDates(startDate, endDate);
        return prixRevient != null ? prixRevient : 0.0;
    }

}
