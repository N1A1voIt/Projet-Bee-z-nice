package itu.project.beezniceback.addtocart.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActiveCartService {
    @Autowired
    private ActiveCartRepository activeCartRepository;
    public List<ViewActiveCart> getByIdUser(Long idUser){
        return activeCartRepository.findByIduser(idUser);
    }
}
