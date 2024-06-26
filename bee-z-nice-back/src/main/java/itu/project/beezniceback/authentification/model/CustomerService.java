package itu.project.beezniceback.authentification.model;

import itu.project.beezniceback.authentification.dto.LoginDTO;
import itu.project.beezniceback.establismentemployee.model.EstablismentemployeeService;
import itu.project.beezniceback.utils.security.PasswordEncryption;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.NoSuchAlgorithmException;
import java.util.Optional;

@Service
public class CustomerService {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private EstablismentemployeeService establismentemployeeService;
    public boolean isAlreadyPresent(String mail,String uniqId){
        return customerRepository.findBymail(mail).isPresent() || customerRepository.findByUniqId(mail).isPresent();
    }
    public boolean isAnEmployee(String id,int idEstablishment){
        return establismentemployeeService.getById(id).isPresent();
    }
    @Transactional
    public LoggedCustomer authenticate(Customer customer) throws CustomerException, NoSuchAlgorithmException {
        if (isAlreadyPresent(customer.getMail(), customer.getUniqId())){
            throw new CustomerException("This mail already exist!");
        }
        else if (!isAnEmployee(customer.getUniqId().toUpperCase(),customer.getIdEstablishement())) {
            throw new CustomerException("This immatriculation doesn't exist!");
        }
        customer.setPassword(PasswordEncryption.encryptToSHA256(customer.getPassword()));
        return new LoggedCustomer(customerRepository.save(customer));
    }
    public LoggedCustomer login(LoginDTO loginDTO) throws CustomerException {
        if (!customerRepository.findBymailAndPassword(loginDTO.getMail(), loginDTO.getPassword()).isPresent()){
            throw new CustomerException("Check for the mail or password!");
        }
        Optional<Customer> customer = customerRepository.findBymail(loginDTO.getMail());
        return new LoggedCustomer(customer.get());
    }

}
