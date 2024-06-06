import {Component, Input} from '@angular/core';
import {MatIcon} from "@angular/material/icon";
import {foodsRoute} from "../../../environnements/env";
import {AddToCartComponentComponent} from "../add-to-cart-component/add-to-cart-component.component";

@Component({
  selector: 'app-food-card',
  standalone: true,
    imports: [
        MatIcon,
        AddToCartComponentComponent
    ],
  templateUrl: './food-card.component.html',
  styleUrl: './food-card.component.css'
})
export class FoodCardComponent {
  @Input() name!:string;
  @Input() supplier!:string;
  @Input() type!:string;
  @Input() price!:string;
  @Input() imageName!:string;
  @Input() idFood!:any;
  show!:boolean;
  foodsRoute:string = foodsRoute();
  protected readonly console = console;
}
