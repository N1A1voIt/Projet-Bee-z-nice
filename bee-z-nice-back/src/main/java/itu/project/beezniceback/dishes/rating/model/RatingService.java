package itu.project.beezniceback.dishes.rating.model;

import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.dishes.model.Dishes;
import itu.project.beezniceback.dishes.model.DishesRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RatingService {
    @Autowired
    private RatingRepository ratingRepository;
    @Autowired
    private DishesRepository dishesRepository;
    @Autowired
    private EntityManager entityManager;
    public Rating save(Rating rating){
        return ratingRepository.save(rating);
    }
    public Rating updateRating(Rating rating){
        return ratingRepository.save(rating);
    }
    public List<RatingDisheView> findDisheRating(Long idCustomer){
        Query query = entityManager.createNativeQuery("SELECT d.*,mark as rate FROM dishes d JOIN dishesrating dr ON d.id = dr.iddishe WHERE idcustomer = :idcustomer",RatingDisheView.class);
        query.setParameter("idcustomer",idCustomer);
        return query.getResultList();
    }
    public List<RatingDisheView> retrieveRatingDisheById(LoggedCustomer loggedCustomer) {
        Long idCustomer = loggedCustomer.getId();
        List<RatingDisheView> ratingDisheViews = findDisheRating(idCustomer);
        List<Dishes> dishes = dishesRepository.findAll();
//        for (int i = 0; i < ratingDisheViews.size(); i++) {
//            for (int j = 0; j < dishes.size() ; j++) {
//                if (dishes.get(j).getId() != ratingDisheViews.get(i).getId()){
//                    RatingDisheView ratingDisheView = new RatingDisheView(dishes.get(j),0);
//                    ratingDisheViews.add(ratingDisheView);
//                }
//            }
//        }
        return ratingDisheViews;
    }
}
