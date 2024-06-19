package itu.project.beezniceback.capitale.service;

import itu.project.beezniceback.capitale.model.CurrentCapital;
import itu.project.beezniceback.capitale.repository.CurrentCapitalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

@Service
public class CurrentCapitalService {

    @Autowired
    private EntityManager entityManager;

    // Méthode pour récupérer la valeur numérique de la capitale depuis la vue
    public Long getCapitale() {
        String sql = "SELECT * FROM public.current_capital";
        Query query = entityManager.createNativeQuery(sql);

        List<Long> results = query.getResultList();
        if (!results.isEmpty()) {
            return results.get(0); // Supposant que la vue ne retourne qu'une seule ligne avec un seul résultat
        }

        return null; // Ou une valeur par défaut, selon votre logique d'application
    }
}
