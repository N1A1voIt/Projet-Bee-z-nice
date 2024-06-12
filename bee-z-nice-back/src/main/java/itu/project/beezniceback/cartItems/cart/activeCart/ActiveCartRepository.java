package itu.project.beezniceback.cartItems.cart.activeCart;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActiveCartRepository extends JpaRepository<ViewActiveCart,Long> {
    List<ViewActiveCart> findByIduser(Long iduser) ;
}
