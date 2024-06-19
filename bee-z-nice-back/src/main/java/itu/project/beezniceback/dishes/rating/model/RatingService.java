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

import java.util.ArrayList;
import java.util.List;

@Service
public class RatingService {
    @Autowired
    private RatingRepository ratingRepository;
    @Autowired
    private DishesRepository dishesRepository;
    @Autowired
    private EntityManager entityManager;
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
        Query query = entityManager.createNativeQuery("SELECT dr.id,d.id as iddishe, d.dishesname as dishesname, d.idsupplier as idsupplier, d.sellingprice as sellingprice,d.purchaseprice as purchaseprice, d.idtype as idtype, d.image as image, dr.mark as rate FROM dishes d JOIN dishesrating dr ON d.id = dr.iddishe WHERE idcustomer = :idcustomer",RatingDisheView.class);
        query.setParameter("idcustomer",idCustomer);
        return query.getResultList();
    }
    public List<RatingDisheView> retrieveRatingDisheById(LoggedCustomer loggedCustomer) {
        Long idCustomer = loggedCustomer.getId();
        List<RatingDisheView> ratingDisheViews = findDisheRating(idCustomer);
        List<Dishes> dishes = dishesRepository.findAll();
        List<RatingDisheView> rate2 = new ArrayList<>();
//        for (int i = 0; i < ratingDisheViews.size(); i++) {
        int i = 0;
        for (int j = 0; j < dishes.size() ; j++) {
            if (ratingDisheViews.isEmpty()){
                RatingDisheView ratingDisheView = new RatingDisheView(dishes.get(j),0);
                rate2.add(ratingDisheView);
                continue;
            }
            if (dishes.get(j).getId() != ratingDisheViews.get(i).getId()){
                RatingDisheView ratingDisheView = new RatingDisheView(dishes.get(j),0);
                rate2.add(ratingDisheView);
                if (i!=ratingDisheViews.size()-1){
                    i++;
                }
            }
        }
        System.out.println("Rate size:"+rate2.size());
        ratingDisheViews.addAll(rate2);
        return ratingDisheViews;
    }
}
