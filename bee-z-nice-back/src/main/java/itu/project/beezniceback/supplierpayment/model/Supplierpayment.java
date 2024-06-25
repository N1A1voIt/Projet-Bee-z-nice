package itu.project.beezniceback.supplierpayment.model;

import jakarta.persistence.*;

import java.time.Instant;

@Entity
@Table(name = "supplierpayment")
public class Supplierpayment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "\"time\"")
    private Instant time;

    @Column(name = "idunpayedstock")
    private Long idunpayedstock;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Instant getTime() {
        return time;
    }

    public void setTime(Instant time) {
        this.time = time;
    }

    public Long getIdunpayedstock() {
        return idunpayedstock;
    }

    public void setIdunpayedstock(Long idunpayedstock) {
        this.idunpayedstock = idunpayedstock;
    }

}