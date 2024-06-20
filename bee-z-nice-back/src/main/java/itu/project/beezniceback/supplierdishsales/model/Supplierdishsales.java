package itu.project.beezniceback.supplierdishsales.model;
import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;

import java.math.BigDecimal;


@Entity
@Immutable
@Table(name = "v_supplier_dish_sales")
public class Supplierdishsales{
    @Column(name = "idsupplier")
    private int idSupplier;

    @Column(name = "namesupplier")
    private String nameSupplier;

    @Column(name = "dishes_sold")
    private Long dishesSold;

    @Column(name = "total_revenue")
    private BigDecimal totalRevenue;

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
    }

    public String getNameSupplier() {
        return nameSupplier;
    }

    public void setNameSupplier(String nameSupplier) {
        this.nameSupplier = nameSupplier;
    }

    public Long getDishesSold() {
        return dishesSold;
    }

    public void setDishesSold(Long dishesSold) {
        this.dishesSold = dishesSold;
    }

    public BigDecimal getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(BigDecimal totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
}
