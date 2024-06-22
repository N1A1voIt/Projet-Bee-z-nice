package itu.project.beezniceback.dashboard.model;

import java.time.LocalDate;

public class DashboardDTO {
    private LocalDate startDate;
    private LocalDate endDate;
    private int idEstablishment;

    public int getIdEstablishment() {
        return idEstablishment;
    }

    public void setIdEstablishment(int idEstablishment) {
        this.idEstablishment = idEstablishment;
    }

    // Getters and setters
    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
}
