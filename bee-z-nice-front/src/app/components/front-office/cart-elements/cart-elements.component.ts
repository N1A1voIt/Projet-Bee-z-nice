import { Component, Input } from '@angular/core';
import { foodsRoute } from '../../../../environnements/env';
import { AddToCartService } from '../../../reusable/add-to-cart-component/add-to-cart.service';
import { AddtocartService } from '../../addtocart/addtocart.service';
import { CartComponent } from '../cart/cart.component';
import { CartService } from '../cart/cart.service';
import { MatIcon } from '@angular/material/icon';

@Component({
    selector: 'app-cart-elements',
    standalone: true,
    imports: [MatIcon],
    templateUrl: './cart-elements.component.html',
    styleUrl: './cart-elements.component.css',
})
export class CartElementsComponent {
    foodsRoute = foodsRoute();
    @Input() item: any;

    constructor(
        private addToCartService: AddtocartService,
        private cart: CartComponent,
        private cartService: AddToCartService
    ) {}

    deleteById() {
        this.addToCartService.delete(this.item.id).subscribe({
            next: (response) => {
                console.log(response);
            },
            error: (error) => {
                console.log(error);
            },
        });
        this.cart.refreshCart();
    }
    increaseQuantity() {
        this.item.quantity += 1;
        this.onSubmit();
    }
    decreaseQuantity() {
        if (this.item.quantity < 1) {
            this.item.quantity = 0;
        } else {
            this.item.quantity -= 1;
        }
        this.onSubmit();
    }
    onSubmit() {
        var formAny = new FormData();
        formAny.append('id', this.item.id);
        formAny.append('quantity', this.item.quantity);
        this.cartService.addToCart(formAny).subscribe({
            next: (response) => {
                console.log(response);
            },
            error: (error) => {
                alert(error);
            },
        });
    }
}
