package itu.project.beezniceback.supplierpayment.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.hibernate.annotations.Immutable;

import java.math.BigDecimal;

/**
 * Mapping for DB view
 */
@Entity
@Immutable
@Table(name = "v_unpayed_stock")
public class VUnpayedStock {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "idsupplier")
    private Integer idsupplier;

    @Column(name = "namesupplier")
    private String namesupplier;

    @Column(name = "month")
    private BigDecimal month;

    @Column(name = "year")
    private BigDecimal year;

    @Column(name = "amount")
    private BigDecimal amount;

    public Long getId() {
        return id;
    }

    public Integer getIdsupplier() {
        return idsupplier;
    }

    public String getNamesupplier() {
        return namesupplier;
    }

    public BigDecimal getMonth() {
        return month;
    }

    public BigDecimal getYear() {
        return year;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    protected VUnpayedStock() {
    }
}