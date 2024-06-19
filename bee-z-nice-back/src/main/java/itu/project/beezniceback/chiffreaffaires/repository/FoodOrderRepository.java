package itu.project.beezniceback.chiffreaffaires.repository;

import itu.project.beezniceback.chiffreaffaires.model.FoodOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Timestamp;
import java.util.List;

public interface FoodOrderRepository extends JpaRepository<FoodOrder, Long> {

    @Query("SELECT fo FROM FoodOrder fo WHERE fo.orderTime BETWEEN :startDate AND :endDate")
    List<FoodOrder> findOrdersBetweenDates(@Param("startDate") Timestamp startDate, @Param("endDate") Timestamp endDate);

    @Query("SELECT SUM(fo.dishePrice) FROM FoodOrder fo WHERE fo.orderTime BETWEEN :startDate AND :endDate")
    Double findTotalRevenueBetweenDates(@Param("startDate") Timestamp startDate, @Param("endDate") Timestamp endDate);

    @Query("SELECT DATE(fo.orderTime) as orderDate, SUM(fo.dishePrice) as totalRevenue " +
            "FROM FoodOrder fo " +
            "WHERE fo.orderTime BETWEEN :startDate AND :endDate " +
            "GROUP BY DATE(fo.orderTime)")
    List<Object[]> findDailyRevenueBetweenDates(@Param("startDate") Timestamp startDate, @Param("endDate") Timestamp endDate);
}
