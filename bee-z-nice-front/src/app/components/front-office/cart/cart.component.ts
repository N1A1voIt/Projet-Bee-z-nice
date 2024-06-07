import {Component, OnInit} from '@angular/core';
import {CartService} from "./cart.service";
import {NgForOf} from "@angular/common";
import {foodsRoute} from "../../../../environnements/env";
import {MatIcon} from "@angular/material/icon";

@Component({
  selector: 'app-cart',
  standalone: true,
    imports: [
        NgForOf,
        MatIcon
    ],
  templateUrl: './cart.component.html',
  styleUrl: './cart.component.css'
})
export class CartComponent implements OnInit{
    cartContent!:any;
    error!:any;
    foodsRoute = foodsRoute();
    constructor(private cartService:CartService) {
    }
    ngOnInit(): void {
        this.cartService.retrieveCart().subscribe({
            next:(response)=>{
                this.cartContent = response;
            },error:(error)=>{
               this.error = error;
            }
        });
    }

}
