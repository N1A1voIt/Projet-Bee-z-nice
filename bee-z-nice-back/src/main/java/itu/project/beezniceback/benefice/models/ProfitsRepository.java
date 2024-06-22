package itu.project.beezniceback.benefice.models;

import itu.project.beezniceback.foodorder.model.Foodorder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface ProfitsRepository extends JpaRepository<Foodorder, Long> {

    @Query(value = "SELECT CAST(f.ordertime AS DATE) AS daty, " +
            "CAST(SUM(f.disheprice - f.dishepurchaseprice) AS DECIMAL) AS daily_profit " +
            "FROM Foodorder f " +
            "WHERE f.ordertime BETWEEN :startDate AND :endDate " +
            "GROUP BY CAST(f.ordertime AS DATE) " +
            "ORDER BY CAST(f.ordertime AS DATE)",
            nativeQuery = true)
    List<DailyProfit> calculateBenefits(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);
//
    @Query(value = "SELECT null as daty,CAST(SUM(f.disheprice - f.dishepurchaseprice) AS DECIMAL) as daily_profit " +
           "FROM FoodOrder f WHERE f.orderTime BETWEEN :startDate AND :endDate",nativeQuery = true)
    DailyProfit calculateTotalBenefits(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);
}
