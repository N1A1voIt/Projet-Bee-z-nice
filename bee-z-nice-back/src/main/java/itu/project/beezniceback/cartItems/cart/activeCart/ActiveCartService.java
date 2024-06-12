package itu.project.beezniceback.cartItems.cart.activeCart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActiveCartService {
    @Autowired
    private ActiveCartRepository activeCartRepository;
    @Autowired
    private ActiveCartLabeledRepository activeCartLabeledRepository;
    public List<ViewActiveCart> getByIdUser(Long idUser){
        return activeCartRepository.findByIduser(idUser);
    }
    public List<ActiveCartLabeled> getLabeledListByIdUser(Long idUser){return activeCartLabeledRepository.findByIduser(idUser);}
}

