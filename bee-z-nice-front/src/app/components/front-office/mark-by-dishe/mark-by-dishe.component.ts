import { Component, Input, OnChanges, OnInit } from '@angular/core';
import { MatIcon } from '@angular/material/icon';
import Chart from 'chart.js/auto';
import { foodsRoute } from '../../../../environnements/env';
import { StarRatingModule } from 'angular-star-rating';
import { CommonModule, NgForOf } from '@angular/common';
import { RatingViewService } from '../rating-view/rating-view.service';
@Component({
  selector: 'app-mark-by-dishe',
  standalone: true,
  imports: [MatIcon,NgForOf,CommonModule],
  templateUrl: './mark-by-dishe.component.html',
  styleUrl: './mark-by-dishe.component.css'
})
export class MarkByDisheComponent implements OnInit {
  @Input() dishe:any;
  foodsRoute = foodsRoute();

  filledStars!: number[]; // Array to store filled star ratings
  emptyStars!: number[]; // Array to store empty star ratings
  hoveredIndex: number | null = null;
  ngOnInit(): void {
    console.log("dishe :::"+this.dishe)
    this.calculateStars();
    console.log(this.filledStars)
    console.log(this.emptyStars)
  }
  constructor(private httpService:RatingViewService){

  }
  private calculateStars() {
    this.filledStars = Array.from({ length: this.dishe.rate });
    this.emptyStars = Array.from({ length: 5 - this.dishe.rate });
  }
  setRating(index: number) {
    let form = {};
    if (this.dishe.id !== null) {
      //@ts-ignore
      form ['id'] = this.dishe.id;
    }
      //@ts-ignore
    form["idDishe"] = this.dishe.iddishe;
    this.dishe.rate = index + 1; // +1 because index is zero-based
    this.calculateStars();
    //@ts-ignore
    form['rate'] = this.dishe.rate;
    console.log(this.dishe.rate)
    console.log(form)
    if (this.dishe.id !== null) {
      this.httpService.update(form).subscribe(
        {
          next:(response) => {
            console.log(response);
          },error:(err) => {
            console.log(err)
          }
        }
      )
    }else{
      this.httpService.save(form).subscribe(
        {
          next:(response) => {
            console.log(response);
          },error:(err) => {
            console.log(err)
          }
        }
      );
    }
  }
  // alberto(){
  //   let chart = new Chart("MyChart", {
  //     type: 'bar', //this denotes tha type of chart

  //     data: {// values on X-Axis
  //       labels: ['2022-05-10', '2022-05-11', '2022-05-12','2022-05-13',
	// 							 '2022-05-14', '2022-05-15', '2022-05-16','2022-05-17', ], 
	//        datasets: [
  //         {
  //           label: "Sales",
  //           data: ['467','576', '572', '79', '92',
	// 							 '574', '573', '576'],
  //           backgroundColor: 'blue'
  //         },
  //         {
  //           label: "Profit",
  //           data: ['542', '542', '536', '327', '17',
	// 								 '0.00', '538', '541'],
  //           backgroundColor: 'limegreen'
  //         }  
  //       ]
  //     },
  //     options: {
  //       aspectRatio:2.5
  //     }
      
  //   });
  // }
}
