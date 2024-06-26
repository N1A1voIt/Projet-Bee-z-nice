package itu.project.beezniceback.stockbyestablishment.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.stockbyestablishment.model.*;
@RestController
public class StockbyestablishmentController{
       @Autowired
      private StockbyestablishmentService stockbyestablishmentService;
       @GetMapping("/api/stockbyestablishment/findAll")
public ResponseEntity<?> findAll(){
return ResponseEntity.ok(stockbyestablishmentService.getAll());
}
       @GetMapping("/api/stockbyestablishment/findById/{id}")
public ResponseEntity<?> findById(@PathVariable long id){
return ResponseEntity.ok(stockbyestablishmentService.getById(id));
}
       @GetMapping("/api/stockbyestablishment/delete/{id}")
        public void delete(@PathVariable long id){
stockbyestablishmentService.delete(id);
}
       @PostMapping("/api/stockbyestablishment/save")
        public ResponseEntity<?> save(@RequestBody Stockbyestablishment stockbyestablishment){
                   try{
                       stockbyestablishmentService.save(stockbyestablishment);
                       return ResponseEntity.ok(stockbyestablishment);
                   }catch (Exception e){
                       e.printStackTrace();
                       return ResponseEntity.badRequest().body(e.getMessage());
                   }
        }
       @PostMapping("/api/stockbyestablishment/update")
        public ResponseEntity<?> update(@RequestBody Stockbyestablishment stockbyestablishment){
           try{
               stockbyestablishmentService.save(stockbyestablishment);
               return ResponseEntity.ok(stockbyestablishment);
           }catch (Exception e){
               e.printStackTrace();
               return ResponseEntity.badRequest().body(e.getMessage());
           }
        }
}