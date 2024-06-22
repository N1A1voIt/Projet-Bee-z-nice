package itu.project.beezniceback.capitale.repository;

import itu.project.beezniceback.capitale.model.CurrentCapital;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CurrentCapitalRepository extends JpaRepository<CurrentCapital, Long> {
    // Aucune méthode spécifique requise si vous n'avez pas besoin d'opérations CRUD personnalisées
}
