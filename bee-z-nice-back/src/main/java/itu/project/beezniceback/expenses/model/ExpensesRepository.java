package itu.project.beezniceback.expenses.model;

import java.sql.Timestamp;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import itu.project.beezniceback.foodorder.model.Foodorder;

public interface ExpensesRepository  extends JpaRepository<Foodorder, Long> 
{
    @Query(value = "SELECT SUM(dishepurchaseprice) AS total_prix_reviens " +
            "FROM foodorder " +
            "WHERE ordertime BETWEEN :startDate AND :endDate" , nativeQuery = true)
    OganizationExpensesDTO findExpensesBetweenDates(@Param("startDate") Timestamp startDate, @Param("endDate") Timestamp endDate);
    @Query(value = "SELECT SUM(f.dishepurchaseprice) AS total_prix_reviens " +
            "FROM foodorder f JOIN customers c ON c.id = f.customerid " +
            "WHERE c.idestablishment = :idEstablishment AND f.orderTime BETWEEN :startDate AND :endDate", nativeQuery = true)
    OganizationExpensesDTO findExpensesBetweenDatesByIdEstablishment(
            @Param("idEstablishment") int idEstablishment,
            @Param("startDate") Timestamp startDate,
            @Param("endDate") Timestamp endDate);

}
