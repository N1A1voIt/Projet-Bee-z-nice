package itu.project.beezniceback.dishes.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import itu.project.beezniceback.dishes.model.*;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
public class DishesController{
    @Value("${file.upload-dir}") // Inject the upload directory path
    private String uploadDir;
    @Autowired
    private DishesService dishesService;
    @GetMapping("/api/dishes/findAll")
    public ResponseEntity<?> findAll(){
    return ResponseEntity.ok(dishesService.getAll());
    }
    @GetMapping("/api/dishes/findById/{id}")
    public ResponseEntity<?> findById(@PathVariable int id){
    return ResponseEntity.ok(dishesService.getById(id));
    }
    @GetMapping("/api/dishes/findByIdType/{id}")
    public ResponseEntity<?> findByIdType(@PathVariable int id){return ResponseEntity.ok(dishesService.getByIdType(id));}
    @GetMapping("/api/dishes/delete/{id}")
    public void delete(@PathVariable int id){
    dishesService.delete(id);
    }
//    @PostMapping("/api/dishes/save")
//    public void save(@RequestBody Dishes dishes){
//    dishesService.save(dishes);
//    }
    @PostMapping("/api/dishes/save")
    public void saveDish(@RequestParam("dishesname") String dishesname,
                         @RequestParam("idsupplier") int idsupplier,
                         @RequestParam("sellingprice") BigDecimal sellingprice,
                         @RequestParam("purchaseprice") BigDecimal purchaseprice,
                         @RequestParam("idtype") int idtype,
                         @RequestParam("image") MultipartFile imageFile) {
        try {
            Dishes dishes = new Dishes();
            dishes.setDishesname(dishesname);
            dishes.setIdsupplier(idsupplier);
            dishes.setSellingprice(sellingprice);
            dishes.setPurchaseprice(purchaseprice);
            dishes.setIdtype(idtype);

            if (imageFile != null && !imageFile.isEmpty()) {
                String fileName = imageFile.getOriginalFilename();
                dishes.setImage(fileName);
                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                Path filePath = uploadPath.resolve(fileName);
                Files.copy(imageFile.getInputStream(), filePath);
            }

            dishesService.save(dishes);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @PostMapping("/api/dishes/update")
    public void update(@RequestBody Dishes dishes){
    dishesService.save(dishes);
    }
}