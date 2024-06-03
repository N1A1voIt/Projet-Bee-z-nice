package itu.project.beezniceback.supplier.model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;
import java.util.List;
@Service
public class SupplierService{
@Autowired
private SupplierRepository supplierRepository;
@Autowired
private SupplierViewRepository supplierViewRepository;
public List<SupplierView> getAll(){
   return supplierViewRepository.findAll();
}
public void save(Supplier supplier){
supplierRepository.save(supplier);
}
public void delete(int id){
supplierRepository.deleteById(id);
}
public Optional<Supplier> getById(int id){
   return supplierRepository.findById(id);
}
public void update(Supplier existingSupplier){
   save(existingSupplier);
}
}