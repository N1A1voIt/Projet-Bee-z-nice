package itu.project.beezniceback.supplierdishsales.model;
import jakarta.persistence.*;


@Entity
@Table(name = "v_supplier_dish_sales")
public class Supplierdishsales{
    @Id
    @Column(name = "idsupplier")
    private Long idSupplier;

    @Column(name = "namesupplier")
    private String nameSupplier;

    @Column(name = "dishes_sold")
    private Long dishesSold;

    @Column(name = "total_revenue")
    private Double totalRevenue;

    public Long getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(Long idSupplier) {
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

    public Double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(Double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
}
