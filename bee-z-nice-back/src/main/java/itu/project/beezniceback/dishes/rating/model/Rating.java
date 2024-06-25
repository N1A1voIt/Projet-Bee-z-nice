package itu.project.beezniceback.dishes.rating.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;

@Entity
@Table(name = "dishesrating")
public class Rating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    @JsonProperty("id")
    Long id;

    @Column(name = "iddishe")
    int idDishe;

    @Column(name = "idcustomer")
    Long idCustomer;

    @Column(name = "mark")
    int rating;

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Long getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(Long idCustomer) {
        this.idCustomer = idCustomer;
    }

    public int getIdDishe() {
        return idDishe;
    }

    public void setIdDishe(int idDishe) {
        this.idDishe = idDishe;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
