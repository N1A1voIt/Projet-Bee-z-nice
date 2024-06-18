package itu.project.beezniceback.customersmoney.model;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface CustomersmoneyRepository extends JpaRepository<Customersmoney,Long>{
    Optional<Customersmoney> findByIdcustomer(String idCustomer);
    @Query(value = "SELECT 0 as id,  idcustomer, sum(virtualamount) as virtualamount FROM customersmoney WHERE idcustomer = :id GROUP BY idcustomer",
            nativeQuery = true)
    List<Customersmoney> findMoney(@Param(value = "id") String id);

}