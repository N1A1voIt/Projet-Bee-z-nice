package itu.project.beezniceback.dashboard.model;

import itu.project.beezniceback.dishetype.model.MostSoldTypes;
import itu.project.beezniceback.establishment.model.EstablishmentsProfits;

import java.math.BigDecimal;
import java.util.List;

public class DashboardElements {
    BigDecimal capital;
    BigDecimal benefits;
    BigDecimal cost;
    List<EstablishmentsProfits> establishmentsProfits;
    List<MostSoldTypes> mostSoldTypes;

    public List<MostSoldTypes> getMostSoldTypes() {
        return mostSoldTypes;
    }

    public void setMostSoldTypes(List<MostSoldTypes> mostSoldTypes) {
        this.mostSoldTypes = mostSoldTypes;
    }

    public List<EstablishmentsProfits> getEstablishmentsProfits() {
        return establishmentsProfits;
    }

    public void setEstablishmentsProfits(List<EstablishmentsProfits> establishmentsProfits) {
        this.establishmentsProfits = establishmentsProfits;
    }

    public BigDecimal getCapital() {
        return capital;
    }

    public void setCapital(BigDecimal capital) {
        this.capital = capital;
    }

    public BigDecimal getBenefits() {
        return benefits;
    }

    public void setBenefits(BigDecimal benefits) {
        this.benefits = benefits;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }
}
