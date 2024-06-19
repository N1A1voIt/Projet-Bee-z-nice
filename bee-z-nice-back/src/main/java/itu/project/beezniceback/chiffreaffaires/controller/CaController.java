package itu.project.beezniceback.chiffreaffaires.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import itu.project.beezniceback.chiffreaffaires.service.FoodOrderService;

@RestController
public class CaController {
    @Autowired
    private FoodOrderService foodOrderService;

    @PostMapping("/api/chiffresafaire")
    public Repo

}
