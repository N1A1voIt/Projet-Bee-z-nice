package itu.project.beezniceback.dishes.rating.model;

import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.dishes.model.Dishes;
import itu.project.beezniceback.dishes.model.DishesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RatingService {
    @Autowired
    private RatingRepository ratingRepository;
    @Autowired
    private DishesRepository dishesRepository;
    public Rating save(Rating rating){
        return ratingRepository.save(rating);
    }
    public Rating updateRating(Rating rating){
        return ratingRepository.save(rating);
    }
    public List<RatingDisheView> retrieveRatingDisheById(LoggedCustomer loggedCustomer) {
        Long idCustomer = loggedCustomer.getId();
        List<RatingDisheView> ratingDisheViews = ratingRepository.findDisheRating(idCustomer);
        List<Dishes> dishes = dishesRepository.findAll();
        for (int i = 0; i < ratingDisheViews.size(); i++) {
            for (int j = 0; j < dishes.size() ; j++) {
                if (dishes.get(j).getId() != ratingDisheViews.get(i).getId()){
                    RatingDisheView ratingDisheView = new RatingDisheView(dishes.get(j),0);
                    ratingDisheViews.add(ratingDisheView);
                }
            }
        }
        return ratingDisheViews;
    }
}
