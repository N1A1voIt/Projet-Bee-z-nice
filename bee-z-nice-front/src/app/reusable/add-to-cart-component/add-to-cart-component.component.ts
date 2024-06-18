import {Component, Input, OnInit, Output} from '@angular/core';
import {NgIf} from "@angular/common";
import {MatIcon} from "@angular/material/icon";
import {FormsModule} from "@angular/forms";
import {AddToCartService} from "./add-to-cart.service";
import { RatingComponent } from "../rating/rating.component";

@Component({
    selector: 'app-add-to-cart-component',
    standalone: true,
    templateUrl: './add-to-cart-component.component.html',
    styleUrl: './add-to-cart-component.component.css',
    imports: [
        NgIf,
        MatIcon,
        FormsModule,
        RatingComponent
    ]
})
export class AddToCartComponentComponent implements OnInit{
    @Input() link!:string;
    @Input() price!:string;
    @Input() name!:string;
    @Input() show!:boolean;
    @Input() idFood!:any;
    id!:number;
    quantity=0;
    constructor(private cartService:AddToCartService) {
    }
    
    ngOnInit() {
        console.log("id food"+this.idFood)
        this.id = Number(this.idFood);
    }
    increaseQuantity(){
        this.quantity+=1;
    }
    decreaseQuantity(){
        if (this.quantity<1){
            this.quantity = 0;
        }else{
            this.quantity-=1;
        }
    }
    onSubmit(form:any){
        console.log(form.value)
        this.cartService.addToCart(form).subscribe({
            next:(response)=>{
                console.log(response)
            },error:(error)=>{
                alert(error)
            }
        })
    }
    protected readonly console = console;
    protected readonly Number = Number;
}
