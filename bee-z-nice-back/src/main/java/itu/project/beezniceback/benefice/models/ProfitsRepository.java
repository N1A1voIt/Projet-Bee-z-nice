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

    @Query(value = "SELECT CAST(f.ordertime AS DATE) AS starter, " +
            "CAST(SUM(f.disheprice - f.dishepurchaseprice) AS DECIMAL) AS profit " +
            "FROM Foodorder f " +
            "WHERE f.ordertime BETWEEN :startDate AND :endDate " +
            "GROUP BY CAST(f.ordertime AS DATE) " +
            "ORDER BY CAST(f.ordertime AS DATE)",
            nativeQuery = true)
    List<Profit> calculateBenefits(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query(value = "SELECT CAST(DATE_TRUNC('week', f.ordertime) AS DATE) AS starter, " +
            "CAST(SUM(f.disheprice - f.dishepurchaseprice) AS DECIMAL) AS profit " +
            "FROM Foodorder f " +
            "WHERE f.ordertime BETWEEN :startDate AND :endDate " +
            "GROUP BY DATE_TRUNC('week', f.ordertime) " +
            "ORDER BY DATE_TRUNC('week', f.ordertime)",
            nativeQuery = true)
    List<Profit> calculateWeeklyBenefits(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query(value = "SELECT CAST(DATE_TRUNC('month', f.ordertime) AS DATE) AS starter, " +
            "CAST(SUM(f.disheprice - f.dishepurchaseprice) AS DECIMAL) AS profit " +
            "FROM Foodorder f " +
            "WHERE f.ordertime BETWEEN :startDate AND :endDate " +
            "GROUP BY DATE_TRUNC('month', f.ordertime) " +
            "ORDER BY DATE_TRUNC('month', f.ordertime)",
            nativeQuery = true)
    List<Profit> calculateMonthlyBenefits(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query(value = "SELECT null as daty,CAST(SUM(f.disheprice - f.dishepurchaseprice) AS DECIMAL) as daily_profit " +
           "FROM Foodorder f WHERE f.ordertime BETWEEN :startDate AND :endDate",nativeQuery = true)
    DailyProfit calculateTotalBenefits(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query(value = "SELECT null as daty, " +
            "COALESCE(CAST(SUM(f.disheprice - f.dishepurchaseprice) AS DECIMAL), 0) as daily_profit " +
            "FROM FoodOrder f JOIN customers c ON f.customerid = c.id " +
            "WHERE idestablishment = :idEstablishment " +
            "AND f.ordertime BETWEEN :startDate AND :endDate",
            nativeQuery = true)
    DailyProfit calculateTotalBenefitsByEstablishment(@Param("idEstablishment") int idEstablishment,
                                                      @Param("startDate") LocalDate startDate,
                                                      @Param("endDate") LocalDate endDate);

}
