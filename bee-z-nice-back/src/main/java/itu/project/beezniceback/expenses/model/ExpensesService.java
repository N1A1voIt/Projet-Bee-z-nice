package itu.project.beezniceback.expenses.model;

import java.sql.Timestamp;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpensesService {
        @Autowired
        private ExpensesRepository expensesRepository;

        public double calculPrixRevient(LocalDate startDate, LocalDate endDate)
        {
                Timestamp startTimestamp = Timestamp.valueOf(startDate.atStartOfDay());
                Timestamp endTimestamp = Timestamp.valueOf(endDate.atStartOfDay());
                OganizationExpensesDTO prixRevient = expensesRepository.findExpensesBetweenDates(startTimestamp,endTimestamp);
                return prixRevient != null ? prixRevient.getTotal_prix_reviens().doubleValue() : 0.0;
        }

}
