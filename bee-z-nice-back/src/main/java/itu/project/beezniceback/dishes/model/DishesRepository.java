package itu.project.beezniceback.dishes.model;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DishesRepository extends JpaRepository<Dishes,Integer>{
    @Query(value = "SELECT * FROM dishes WHERE idtype = :idType",nativeQuery = true)
    List<Dishes> findDishesByIdtype(@Param("idType") int idType);
    List<Dishes> findByIdtype(int idType);
}