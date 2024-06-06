package itu.project.beezniceback.addtocart.model;
import org.springframework.data.jpa.repository.*;
public interface AddtocartRepository extends JpaRepository<Addtocart,Long>{
    void deleteAddtocartByIddisheAndIduser(int iddishe, long iduser);
}