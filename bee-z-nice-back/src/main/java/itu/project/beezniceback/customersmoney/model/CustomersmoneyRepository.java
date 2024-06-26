package itu.project.beezniceback.customersmoney.model;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
@Repository
public interface CustomersmoneyRepository extends JpaRepository<Customersmoney,Long>{
    Optional<Customersmoney> findByIdcustomer(String idCustomer);
    @Query(value = "SELECT 0 as id, idcustomer, SUM(virtualamount) as virtualamount,'2000-01-01' as datedeposit FROM customersmoney " +
            "WHERE idcustomer = :id AND datedeposit <= :dateDeposit " +
            "GROUP BY idcustomer", nativeQuery = true)
    List<Customersmoney> findMoney(@Param("id") String id, @Param("dateDeposit") LocalDateTime dateDeposit);

}