package itu.project.beezniceback.dishes.rating.model;

import itu.project.beezniceback.authentification.model.LoggedCustomer;
import itu.project.beezniceback.dishes.model.Dishes;
import itu.project.beezniceback.dishes.model.DishesRepository;
import itu.project.beezniceback.dishes.rating.dto.RatingSaveDTO;
import itu.project.beezniceback.dishes.rating.dto.RatingUpdateDTO;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class RatingService {
    @Autowired
    private RatingRepository ratingRepository;
    @Autowired
    private DishesRepository dishesRepository;
    @Autowired
    private EntityManager entityManager;
    @Autowired
    private Top3RatingRepository top3RatingRepository;
    public Rating save(RatingSaveDTO ratingSaveDTO, LoggedCustomer loggedCustomer){
        Rating rating = new Rating();
        rating.setIdCustomer(loggedCustomer.getId());
        rating.setIdDishe(ratingSaveDTO.getIdDishe());
        rating.setRating(ratingSaveDTO.getRate());
        System.out.println(loggedCustomer.getId());
        return this.save(rating);
    }
    public Rating update(RatingUpdateDTO ratingUpdateDto, LoggedCustomer loggedCustomer){
        Rating rating = new Rating();
        rating.setId(ratingUpdateDto.getId());
        rating.setIdCustomer(loggedCustomer.getId());
        rating.setIdDishe(ratingUpdateDto.getIdDishe());
        rating.setRating(ratingUpdateDto.getRate());
        return this.save(rating);
    }
    public Rating save(Rating rating){
        return ratingRepository.save(rating);
    }
    public Rating updateRating(Rating rating){
        return ratingRepository.save(rating);
    }
    public List<RatingDisheView> findDisheRating(Long idCustomer){
        Query query = entityManager.createNativeQuery("SELECT dr.id,d.id as iddishe, d.dishesname as dishesname, d.idsupplier as idsupplier, d.sellingprice as sellingprice,d.purchaseprice as purchaseprice, d.idtype as idtype, d.image as image, dr.mark as rate " +
                "FROM dishes d JOIN dishesrating dr ON d.id = dr.iddishe WHERE idcustomer = :idcustomer",RatingDisheView.class);
        query.setParameter("idcustomer",idCustomer);
        return query.getResultList();
    }
    public List<Top3Rating> getTop3(){
        return top3RatingRepository.findAll();
    }

    public List<RatingDisheView> retrieveRatingDisheById(LoggedCustomer loggedCustomer) {
        Long idCustomer = loggedCustomer.getId();
        List<RatingDisheView> ratingDisheViews = findDisheRating(idCustomer); // Get ratings for the logged-in customer
        List<Dishes> dishes = dishesRepository.findAll(); // Get all dishes

        // Create a map to store dish ID to RatingDisheView mappings
        Map<Integer, RatingDisheView> dishRatingMap = new HashMap<>();

        // Populate the map with rated dishes
        for (RatingDisheView ratingDisheView : ratingDisheViews) {
            dishRatingMap.put(ratingDisheView.getIddishe(), ratingDisheView);
        }

        // Iterate through all dishes and construct the result list
        List<RatingDisheView> result = new ArrayList<>();
        for (Dishes dish : dishes) {
            if (dishRatingMap.containsKey(dish.getId())) {
                // Dish is rated, add with its existing rating
                result.add(dishRatingMap.get(dish.getId()));
            } else {
                // Dish is not rated, add with default rating of 0
                result.add(new RatingDisheView(dish, 0));
            }
        }

        return result;
    }

//    public List<RatingDisheView> retrieveRatingDisheById(LoggedCustomer loggedCustomer) {
//        Long idCustomer = loggedCustomer.getId();
//        List<RatingDisheView> ratingDisheViews = findDisheRating(idCustomer);
//        List<Dishes> dishes = dishesRepository.findAll();
//        List<RatingDisheView> rate2 = new ArrayList<>();
//        int i = 0;
//        // If ratingDishesView is inside dishes I'll have to skip this dishe
//        for (int j = 0; j < dishes.size() ; j++) {
//            if (ratingDisheViews.isEmpty()){
//                RatingDisheView ratingDisheView = new RatingDisheView(dishes.get(j),0);
//                rate2.add(ratingDisheView);
//                continue;
//            }
//            if (!contains(dishes.get(j),ratingDisheViews)) {
//                RatingDisheView ratingDisheView = new RatingDisheView(dishes.get(j),0);
//                rate2.add(ratingDisheView);
////                dishes.remove(j);
//                if (i!=ratingDisheViews.size()-1){
//                    i++;
//                }
//            }
//        }
//        ratingDisheViews.addAll(rate2);
//        return ratingDisheViews;
//    }
//public List<RatingDisheView> retrieveRatingDisheById(LoggedCustomer loggedCustomer) {
//    Long idCustomer = loggedCustomer.getId();
//    List<RatingDisheView> ratingDisheViews = findDisheRating(idCustomer);
//    List<Dishes> dishes = dishesRepository.findAll();
//
//    // Create a map of dishes that have ratings
//    Set<Long> ratedDishIds = ratingDisheViews.stream()
//            .map(view -> view.getId())
//            .collect(Collectors.toSet());
//
//    // Prepare the result list
//    List<RatingDisheView> result = new ArrayList<>();
//
//    // Add existing ratings to the result
//    result.addAll(ratingDisheViews);
//
//    // Add dishes with no ratings (rating = 0)
//    dishes.stream()
//            .filter(dish -> !ratedDishIds.contains(dish.getId()))
//            .map(dish -> new RatingDisheView(dish, 0))
//            .forEach(result::add);
//
//    return result;
//}

    public boolean contains(Dishes dishes,List<RatingDisheView> ratingDisheViews){
        boolean val = false;
        for (int j = 0; j < ratingDisheViews.size(); j++) {
            if (ratingDisheViews.get(j).getId() == dishes.getId()){
                val = true;
            }
        }
        return val;
    }
}
