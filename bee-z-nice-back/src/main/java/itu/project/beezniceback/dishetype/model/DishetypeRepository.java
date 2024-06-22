package itu.project.beezniceback.dishetype.model;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.*;

import java.time.LocalDate;
import java.util.List;

public interface DishetypeRepository extends JpaRepository<Dishetype,Integer>{
    @Query(value = "SELECT sum(f.disheprice - f.dishepurchaseprice) as benefits, d.idtype, dt.libelle " +
            "FROM foodorder f " +
            "JOIN customers c ON c.id = f.customerid " +
            "JOIN dishes d ON d.id = f.iddishes " +
            "JOIN dishetype dt ON dt.id = d.idtype " +
            "WHERE c.idestablishment = :idEstablishment AND f.ordertime BETWEEN :startDate AND :endDate " +
            "GROUP BY d.idtype, dt.libelle", nativeQuery = true)
    List<MostSoldTypes> findMostSoldTypesByIdEstablishment(@Param("idEstablishment") int idEstablishment,
                                                           @Param("startDate") LocalDate startDate,
                                                           @Param("endDate") LocalDate endDate);

    @Query(value = "SELECT sum(f.disheprice - f.dishepurchaseprice) as benefits, d.idtype, dt.libelle " +
            "FROM foodorder f " +
            "JOIN customers c ON c.id = f.customerid " +
            "JOIN dishes d ON d.id = f.iddishes " +
            "JOIN dishetype dt ON dt.id = d.idtype " +
            "WHERE f.ordertime BETWEEN :startDate AND :endDate " +
            "GROUP BY d.idtype, dt.libelle", nativeQuery = true)
    List<MostSoldTypes> findMostSoldTypes(@Param("startDate") LocalDate startDate,
                                          @Param("endDate") LocalDate endDate);

}