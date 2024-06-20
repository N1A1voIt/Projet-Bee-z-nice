package itu.project.beezniceback.expenses.model;

import java.sql.Timestamp;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import itu.project.beezniceback.foodorder.model.Foodorder;

public interface ExpensesRepository  extends JpaRepository<Foodorder, Long> 
{
    
    @Query("SELECT SUM(dishepurchaseprice) AS total_prix_reviens " +
        "FROM foodorder " +
        "WHERE ordertime BETWEEN :startDate AND :endDate")
    Double findExpensesBetweenDates(@Param("startDate") Timestamp startDate, @Param("endDate") Timestamp endDate );
     
}
