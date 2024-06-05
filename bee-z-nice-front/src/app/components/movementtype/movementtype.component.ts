import {Component, OnInit} from '@angular/core';
import {FormsModule} from "@angular/forms";
import {MovementtypeService} from "./movementtype.service";
import {NInputComponent} from "../../reusable/n-input/n-input.component";
import {NSelectComponent} from "../../reusable/n-select/n-select.component";
import {NTableComponent} from "../../reusable/n-table/n-table.component";
import { NgxPaginationModule } from 'ngx-pagination';
import {CommonModule, NgFor} from "@angular/common";
import {ModalComponentComponent} from "../../reusable/modal-component/modal-component.component";
import {SubmitButtonComponent} from "../../reusable/submit-button/submit-button.component";
@Component({
selector: 'app-movementtype',standalone:true,imports: [FormsModule, NgFor, CommonModule, NInputComponent, NSelectComponent, NgxPaginationModule, ModalComponentComponent, NTableComponent, SubmitButtonComponent],
templateUrl: './movementtype.component.html',
styleUrl: './movementtype.component.css'})
export class MovementtypeComponent implements OnInit{
showForm: boolean = false;
pages: number = 1;
all:any;
isUpdate:boolean = false;
idValue:number|null = null;
typeValue:string|null = null;
constructor(private movementtypeService:MovementtypeService){}
    onSubmit(form:any){
        this.movementtypeService.saveData(form.value).subscribe({
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
]
}    retrieveAll(){
        this.movementtypeService.retrieveAll().subscribe({
            next: (data) => {
                this.all = data;
            },
            error: (error) => {
                alert(error);
            }
        });
    }
delete(id:number){
    this.movementtypeService.delete(id).subscribe({
        next: (data) => {
            this.retrieveAll();
        },
        error: (error) => {
            alert(error);
        }
    });
}
    update(id:number){
        this.movementtypeService.getById(id).subscribe({
            next: (data) => {
                
this.idValue = data.id
this.typeValue = data.type,
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
