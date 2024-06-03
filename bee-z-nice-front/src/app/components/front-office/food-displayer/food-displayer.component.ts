import {Component, OnInit} from '@angular/core';
import {DishesService} from "../../dishes/dishes.service";
import {ActivatedRoute} from "@angular/router";
import {DecimalPipe, NgFor} from "@angular/common";
import {FoodCardComponent} from "../../../reusable/food-card/food-card.component";
@Component({
  selector: 'app-food-displayer',
  standalone: true,
  imports: [
    NgFor,
    FoodCardComponent,
    DecimalPipe
  ],
  templateUrl: './food-displayer.component.html',
  styleUrl: './food-displayer.component.css'
})
export class FoodDisplayerComponent implements OnInit{
  disheId:string | null = null;
  content:any;
  constructor(private foodService:DishesService,private route:ActivatedRoute) {
  }
  ngOnInit(): void {
    this.disheId = this.route.snapshot.paramMap.get('id');
    this.retrieveDishesList();
    console.log(this.disheId)
    console.log(this.content)
  }
  onSubmit(){
    this.retrieveDishesList()
  }
  retrieveDishesList(){
    this.foodService.getByIdType(Number(this.disheId)).subscribe(
      {
        next:(response) => {
          this.content=response
        },
        error:(error)=>{
          console.log(error)
        }
      }
    )
  }

  protected readonly Number = Number;
}
