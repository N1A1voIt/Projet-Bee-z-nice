package itu.project.beezniceback.dishes.rating.dto;

public class RatingUpdateDTO {
    Long id;
    int idDishe;
    int rate;

    public int getIdDishe() {
        return idDishe;
    }

    public void setIdDishe(int idDishe) {
        this.idDishe = idDishe;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
