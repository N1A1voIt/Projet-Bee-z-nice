package itu.project.beezniceback.supplierpayment.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupplierpaymentService {
    @Autowired
    private SupplierpaymentRepository supplierpaymentRepository;

    @Autowired
    private VUnpayedStockRepository vUnpayedStockRepository;

    public List<VUnpayedStock> getAll(){return vUnpayedStockRepository.findAll();}

    public void save(Supplierpayment supplierpayment){


        supplierpaymentRepository.save(supplierpayment);
    }
}
