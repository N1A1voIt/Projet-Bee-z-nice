package itu.project.beezniceback.foodorder.model;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.*;

import java.math.BigDecimal;

public interface FoodorderRepository extends JpaRepository<Foodorder,Long>{
    @Query(value = "SELECT SUM(dishePrice) as expenses FROM foodorder WHERE customerid = :idCustomer", nativeQuery = true)
    Object getExpensesByUserId(@Param("idCustomer") int idCustomer);

}