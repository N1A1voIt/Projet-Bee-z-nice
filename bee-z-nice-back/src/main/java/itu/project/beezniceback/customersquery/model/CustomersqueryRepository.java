package itu.project.beezniceback.customersquery.model;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.*;

import java.time.LocalDateTime;
import java.util.List;

public interface CustomersqueryRepository extends JpaRepository<Customersquery,Long>{
    @Query(value = " SELECT * FROM customersQuery WHERE ispending = true AND daterequest <= :dateRequest",nativeQuery = true)
    List<Customersquery> findByPendingAndDate(@Param("dateRequest") LocalDateTime dateRequest);
}