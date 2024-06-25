package itu.project.beezniceback.supplierdishsales.model;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface SupplierdishsalesRepository extends JpaRepository<Supplierdishsales, Long> {
    @Query(value = "SELECT d.idsupplier AS idsupplier, " +
            "       s.namesupplier AS namesupplier, " +
            "       COUNT(*) AS dishes_sold, " +
            "       SUM(f.disheprice) AS total_revenue " +
            "FROM foodorder f " +
            "    JOIN dishes d ON f.iddishes = d.id " +
            "    JOIN supplier s ON d.idsupplier = s.id " +
            "WHERE f.ordertime BETWEEN :startDate AND :endDate " +
            "GROUP BY d.idsupplier, s.namesupplier", nativeQuery = true)
    List<Supplierdishsales> findActiveSupplierByDate(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

}