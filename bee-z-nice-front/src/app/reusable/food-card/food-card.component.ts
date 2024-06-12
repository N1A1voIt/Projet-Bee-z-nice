import {Component, Input} from '@angular/core';
import {MatIcon} from "@angular/material/icon";
import {foodsRoute} from "../../../environnements/env";

@Component({
  selector: 'app-food-card',
  standalone: true,
  imports: [
    MatIcon
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
  foodsRoute:string = foodsRoute();
}
