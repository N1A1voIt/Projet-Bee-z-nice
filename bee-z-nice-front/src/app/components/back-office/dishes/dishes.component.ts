import {Component, OnInit} from '@angular/core';
import {FormsModule} from "@angular/forms";
import {DishesService} from "./dishes.service";
import {NInputComponent} from "../../../reusable/n-input/n-input.component";
import {NSelectComponent} from "../../../reusable/n-select/n-select.component";
import {NTableComponent} from "../../../reusable/n-table/n-table.component";
import { NgxPaginationModule } from 'ngx-pagination';
import {CommonModule, NgFor} from "@angular/common";
import {ModalComponentComponent} from "../../../reusable/modal-component/modal-component.component";
import {SubmitButtonComponent} from "../../../reusable/submit-button/submit-button.component";
@Component({
selector: 'app-dishes',standalone:true,imports: [FormsModule, NgFor, CommonModule, NInputComponent, NSelectComponent, NgxPaginationModule, ModalComponentComponent, NTableComponent, SubmitButtonComponent],
templateUrl: './dishes.component.html',
styleUrl: './dishes.component.css'})
export class DishesComponent implements OnInit{
listDishetype:any;
listSupplier:any;
showForm: boolean = false;
pages: number = 1;
all:any;
isUpdate:boolean = false;
idValue:number|null = null;
dishesnameValue:string|null = null;
idsupplierValue:number|null = null;
sellingpriceValue:number|null = null;
purchasepriceValue:number|null = null;
idtypeValue:number|null = null;
imageValue:string|null = null;
constructor(private dishesService:DishesService){}
    onSubmit(form:any){
        this.dishesService.saveData(form.value).subscribe({
                next:(data)=>{
                    this.retrieveAll();
                },
                error:(error)=>{
                    alert(error)
                }
            }
        )
    }
retrieveDropDown(){
        return [
this.dishesService.retrieveDishetypeList().subscribe({
                next:(data)=>{
                    this.listDishetype = data
                },
                error:(error)=>{
                    alert(error)
                }
            }
            ),
this.dishesService.retrieveSupplierList().subscribe({
                next:(data)=>{
                    this.listSupplier = data
                },
                error:(error)=>{
                    alert(error)
                }
            }
            ),
]
}    retrieveAll(){
        this.dishesService.retrieveAll().subscribe({
            next: (data) => {
                this.all = data;
            },
            error: (error) => {
                alert(error);
            }
        });
    }
delete(id:number){
    this.dishesService.delete(id).subscribe({
        next: (data) => {
            this.retrieveAll();
        },
        error: (error) => {
            alert(error);
        }
    });
}
    update(id:number){
        this.dishesService.getById(id).subscribe({
            next: (data) => {
                
this.idValue = data.id
this.dishesnameValue = data.dishesname
this.idsupplierValue = data.idsupplier
this.sellingpriceValue = data.sellingprice
this.purchasepriceValue = data.purchaseprice
this.idtypeValue = data.idtype
this.imageValue = data.image,
                this.isUpdate = true
            },
            error: (error) => {
                alert(error);
            }
        });
    }
     ngOnInit() {
         this.retrieveDropDown();
         this.retrieveAll();
     }
}
