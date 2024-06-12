import {Component, Input, OnInit} from '@angular/core';
import {CartService} from "./cart.service";
import {CommonModule, NgForOf, NgIf} from "@angular/common";
import {foodsRoute} from "../../../../environnements/env";
import {MatIcon} from "@angular/material/icon";
import {FormsModule} from "@angular/forms";
import { AppComponent } from '../../../app.component';
import { AddToCartService } from '../../../reusable/add-to-cart-component/add-to-cart.service';
import { AddtocartService } from '../../addtocart/addtocart.service';

@Component({
  selector: 'app-cart',
  standalone: true,
    imports: [
        NgForOf,
        MatIcon,
        FormsModule,
        NgIf,CommonModule
    ],
  templateUrl: './cart.component.html',
  styleUrl: './cart.component.css'
})
export class CartComponent implements OnInit{
    cartContent!:any;
    error!:any;
    foodsRoute = foodsRoute();
    @Input() showCart:boolean = false; 
    constructor(private cartService:CartService,private appComponent:AppComponent,private addToCartService:AddtocartService) {
    }
    toggleShowCart(){
        this.appComponent.showCart = !this.appComponent.showCart;
    }
    deleteById(id:number){
        this.addToCartService.delete(id);
        this.refreshCart();
    }
    ngOnInit(): void {
        this.refreshCart();
    }
    private refreshCart() {
        this.cartService.retrieveCart().subscribe({
            next: (response) => {
                this.cartContent = response;
            }, error: (error) => {
                this.error = error;
            }
        });
    }
}
