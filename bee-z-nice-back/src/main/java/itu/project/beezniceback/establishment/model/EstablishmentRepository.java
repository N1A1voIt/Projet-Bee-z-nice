package itu.project.beezniceback.establishment.model;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.*;

import java.time.LocalDate;
import java.util.List;

public interface EstablishmentRepository extends JpaRepository<Establishment,Integer>{
    @Query(value = "SELECT sum(f.disheprice - f.dishepurchaseprice) as benefits, c.idestablishment, e.name " +
            "FROM foodorder f " +
            "JOIN customers c ON c.id = f.customerid " +
            "JOIN establishment e ON e.id = c.idestablishment " +
            "WHERE f.ordertime BETWEEN :startDate AND :endDate " +
            "GROUP BY c.idestablishment, e.name", nativeQuery = true)
    List<EstablishmentsProfits> retrieveProfits(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);


}