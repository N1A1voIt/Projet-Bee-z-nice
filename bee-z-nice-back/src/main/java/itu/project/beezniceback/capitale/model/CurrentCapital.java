package itu.project.beezniceback.capitale.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class CurrentCapital {

    @Id
    private Long id; // Id de l'entité, si nécessaire

    private Long capitale; // Champ représentant la valeur de la capitale

    // Getters et setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCapitale() {
        return capitale;
    }

    public void setCapitale(Long capitale) {
        this.capitale = capitale;
    }
}
