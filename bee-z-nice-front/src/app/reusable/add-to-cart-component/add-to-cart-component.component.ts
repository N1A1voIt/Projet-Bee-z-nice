import {Component, Input, OnInit, Output} from '@angular/core';
import {NgIf} from "@angular/common";
import {MatIcon} from "@angular/material/icon";
import {FormsModule} from "@angular/forms";
import {AddToCartService} from "./add-to-cart.service";

@Component({
  selector: 'app-add-to-cart-component',
  standalone: true,
    imports: [
        NgIf,
        MatIcon,
        FormsModule
    ],
  templateUrl: './add-to-cart-component.component.html',
  styleUrl: './add-to-cart-component.component.css'
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
    ngOnInit() {
        console.log("id food"+this.idFood)
        this.id = this.idFood;
    }

    onSubmit(form:any){
        this.cartService.addToCart(form.value).subscribe({
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
