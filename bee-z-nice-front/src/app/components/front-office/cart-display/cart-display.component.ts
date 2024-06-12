import { CommonModule } from '@angular/common';
import { ChangeDetectionStrategy, Component } from '@angular/core';
import { AppComponent } from '../../../app.component';
import { CartComponent } from "../cart/cart.component";

@Component({
    selector: 'app-cart-display',
    standalone: true,
    templateUrl: "./cart-display.component.html",
    styleUrl: './cart-display.component.css',
    imports: [
        CommonModule,
        CartComponent
    ]
})
export class CartDisplayComponent {
    constructor(private appComp:AppComponent){}
    isLoggedIn(){
        return this.appComp.isLoggedIn;
    }
    isAdmin(){
        return this.appComp.isAdmin;
    }
}
