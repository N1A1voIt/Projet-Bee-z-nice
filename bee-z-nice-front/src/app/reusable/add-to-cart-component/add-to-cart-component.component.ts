import { Component } from '@angular/core';
import {NgIf} from "@angular/common";

@Component({
  selector: 'app-add-to-cart-component',
  standalone: true,
    imports: [
        NgIf
    ],
  templateUrl: './add-to-cart-component.component.html',
  styleUrl: './add-to-cart-component.component.css'
})
export class AddToCartComponentComponent {

}
