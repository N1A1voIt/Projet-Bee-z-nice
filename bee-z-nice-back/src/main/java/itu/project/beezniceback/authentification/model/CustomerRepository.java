package itu.project.beezniceback.authentification.model;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CustomerRepository extends JpaRepository<Customer,Long> {
    public Optional<Customer> findBymail(String mail);
    public Optional<Customer> findByUniqId(String uniqId);
    public Optional<Customer> findBymailAndPassword(String mail,String password);

}
