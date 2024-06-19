package itu.project.beezniceback.dishes.rating.model;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface RatingRepository extends JpaRepository< Rating,Long > {
//    Optional<Rating> findByIddisheAndIdcustomer(int idDishe, Long idCustomer);
//    @Query(value = "SELECT d.*,mark as rate FROM dishes d JOIN dishesrating dr ON d.id = dr.iddishe WHERE idcustomer = :idcustomer",nativeQuery = true)
//    List<RatingDisheView> findDisheRating(@Param("idcustomer") Long idcustomer);
    @Query(value = "SELECT d.id as id, d.dishesname as dishesname, d.idsupplier as idsupplier, d.sellingprice as sellingprice, " +
        "d.purchaseprice as purchaseprice, d.idtype as idtype, d.image as image, dr.mark as rate " +
        "FROM dishes d JOIN dishesrating dr ON d.id = dr.iddishe WHERE idcustomer = :idcustomer", nativeQuery = true)
    List<RatingDisheView> findDisheRating(@Param("idcustomer") Long idcustomer);
}
