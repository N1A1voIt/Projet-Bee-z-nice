import {Component, OnInit} from '@angular/core';
import {FormsModule} from "@angular/forms";
import {DishetypeService} from "./dishetype.service";
import {NInputComponent} from "../../reusable/n-input/n-input.component";
import {NSelectComponent} from "../../reusable/n-select/n-select.component";
import {NTableComponent} from "../../reusable/n-table/n-table.component";
import { NgxPaginationModule } from 'ngx-pagination';
import {CommonModule, NgFor} from "@angular/common";
import {ModalComponentComponent} from "../../reusable/modal-component/modal-component.component";
import {SubmitButtonComponent} from "../../reusable/submit-button/submit-button.component";
@Component({
selector: 'app-dishetype',
  standalone:true,imports: [FormsModule, NgFor, CommonModule, NInputComponent, NSelectComponent, NgxPaginationModule, ModalComponentComponent, NTableComponent, SubmitButtonComponent],
templateUrl: './dishetype.component.html',
styleUrl: './dishetype.component.css'})
export class DishetypeComponent implements OnInit{
showForm: boolean = false;
pages: number = 1;
all:any;
isUpdate:boolean = false;
idValue:number|null = null;
libelleValue:string|null = null;
image_nameValue:string|null = null;
constructor(private dishetypeService:DishetypeService){}
    onSubmit(form:any){
        this.dishetypeService.saveData(form.value).subscribe({
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
        this.dishetypeService.retrieveAll().subscribe({
            next: (data) => {
                this.all = data;
            },
            error: (error) => {
                alert(error);
            }
        });
    }
delete(id:number){
    this.dishetypeService.delete(id).subscribe({
        next: (data) => {
            this.retrieveAll();
        },
        error: (error) => {
            alert(error);
        }
    });
}
    update(id:number){
        this.dishetypeService.getById(id).subscribe({
            next: (data) => {

this.idValue = data.id
this.libelleValue = data.libelle
this.image_nameValue = data.image_name,
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
