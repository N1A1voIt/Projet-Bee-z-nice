import { CommonModule, NgForOf } from '@angular/common';
import { ChangeDetectionStrategy, Component, OnInit } from '@angular/core';
import { MarkByDisheComponent } from '../mark-by-dishe/mark-by-dishe.component';
import { RatingViewService } from './rating-view.service';

@Component({
    selector: 'app-rating-view',
    standalone: true,
    imports: [
        NgForOf,
        CommonModule,
        MarkByDisheComponent
    ],
    templateUrl: './rating-view.component.html',
    styleUrl: './rating-view.component.css',
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class RatingViewComponent implements OnInit {
    dishes:any;
    constructor(private ratingViewService:RatingViewService){}
    ngOnInit(): void {
        this.loadDishes();
    }
    loadDishes(){
        console.log("Loading dishes ...");
        this.ratingViewService.findAll().subscribe({
                next:(response)=>{
                    this.dishes = response;
                    console.log(response);
                },error:(error)=>{
                    console.error(error);
                }
            }
        )
    }
}
