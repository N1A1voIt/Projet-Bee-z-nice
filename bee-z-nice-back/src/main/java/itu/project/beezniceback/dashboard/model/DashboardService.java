package itu.project.beezniceback.dashboard.model;

import itu.project.beezniceback.benefice.models.ProfitsService;
import itu.project.beezniceback.dishetype.model.DishetypeRepository;
import itu.project.beezniceback.dishetype.model.MostSoldTypes;
import itu.project.beezniceback.establishment.model.EstablishmentService;
import itu.project.beezniceback.establishment.model.EstablishmentsProfits;
import itu.project.beezniceback.expenses.model.ExpensesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
public class DashboardService {
    @Autowired
    private ProfitsService profitsService;
    @Autowired
    private ExpensesService expensesService;
    @Autowired
    private EstablishmentService establishmentService;
    @Autowired
    private DishetypeRepository dishetypeRepository;
    public DashboardElements findElements(LocalDate startDate, LocalDate endDate,int idEstablishment){
        DashboardElements dashboardElements = new DashboardElements();
        BigDecimal expenses = BigDecimal.valueOf(expensesService.calculPrixRevient(startDate,endDate,idEstablishment));
        BigDecimal benefits = profitsService.getTotalBenefitsBetweenDates(startDate,endDate,idEstablishment);
        BigDecimal capital = new BigDecimal(0);
        if (expenses == null){
            capital = BigDecimal.valueOf(0);
        }if (expenses != null){
            capital = BigDecimal.valueOf(benefits.doubleValue() + expenses.doubleValue());
        }
        List<EstablishmentsProfits> establishmentsProfits = establishmentService.getProfits(startDate,endDate);
        List<MostSoldTypes> mostSoldTypes;
        if (idEstablishment == 0){
            mostSoldTypes = dishetypeRepository.findMostSoldTypes(startDate,endDate);
        }else {
            mostSoldTypes = dishetypeRepository.findMostSoldTypesByIdEstablishment(idEstablishment,startDate,endDate);
        }
        dashboardElements.setBenefits(benefits);
        dashboardElements.setCapital(capital);
        dashboardElements.setCost(expenses);
        dashboardElements.setEstablishmentsProfits(establishmentsProfits);
        dashboardElements.setMostSoldTypes(mostSoldTypes);
        return dashboardElements;
    }
}
