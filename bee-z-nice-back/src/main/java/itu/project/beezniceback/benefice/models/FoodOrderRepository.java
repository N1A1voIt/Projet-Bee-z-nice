package itu.project.beezniceback.benefice.models;

import itu.project.beezniceback.benefice.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface FoodOrderRepository extends JpaRepository<FoodOrder, Long> {

    @Query("SELECT new itu.project.beezniceback.benefice.models.DailyProfit(f.orderTime.toLocalDate(), SUM(f.dishePrice - f.dishePurchasePrice)) " +
           "FROM FoodOrder f WHERE f.orderTime BETWEEN :startDate AND :endDate " +
           "GROUP BY f.orderTime.toLocalDate() ORDER BY f.orderTime.toLocalDate()")
    List<DailyProfit> calculateBenefits(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query("SELECT SUM(f.dishePrice - f.dishePurchasePrice) " +
           "FROM FoodOrder f WHERE f.orderTime BETWEEN :startDate AND :endDate")
    BigDecimal calculateTotalBenefits(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);
}
