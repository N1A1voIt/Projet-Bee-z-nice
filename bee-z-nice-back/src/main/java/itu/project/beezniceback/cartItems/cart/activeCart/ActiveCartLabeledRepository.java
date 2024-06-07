package itu.project.beezniceback.cartItems.cart.activeCart;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActiveCartLabeledRepository extends JpaRepository<ActiveCartLabeled,Long> {
    List<ActiveCartLabeled> findByIduser(Long iduser) ;
}
