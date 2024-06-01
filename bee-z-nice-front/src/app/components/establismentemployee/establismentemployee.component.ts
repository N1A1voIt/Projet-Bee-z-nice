import {Component, OnInit} from '@angular/core';
import {FormsModule} from "@angular/forms";
import {EstablismentemployeeService} from "./establismentemployee.service";
import {NInputComponent} from "../../reusable/n-input/n-input.component";
import {NSelectComponent} from "../../reusable/n-select/n-select.component";
import {NTableComponent} from "../../reusable/n-table/n-table.component";
import { NgxPaginationModule } from 'ngx-pagination';
import {CommonModule, NgFor} from "@angular/common";
import {ModalComponentComponent} from "../../reusable/modal-component/modal-component.component";
@Component({
selector: 'app-establismentemployee',standalone:true,
    imports: [FormsModule, NgFor, CommonModule, NInputComponent, NSelectComponent, NgxPaginationModule, ModalComponentComponent, NTableComponent],
templateUrl: './establismentemployee.component.html',
styleUrl: './establismentemployee.component.css'})
export class EstablismentemployeeComponent implements OnInit{
listEstablishment:any;
showForm: boolean = false;
pages: number = 1;
all:any;
isUpdate:boolean = false;
idValue:string|null = null;
idestablishmentValue:number|null = null;
nameemployeeValue:string|null = null;
constructor(private establismentemployeeService:EstablismentemployeeService){}
    onSubmit(form:any){
        this.establismentemployeeService.saveData(form.value).subscribe({
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
this.establismentemployeeService.retrieveEstablishmentList().subscribe({
                next:(data)=>{
                    this.listEstablishment = data
                },
                error:(error)=>{
                    alert(error)
                }
            }
            ),
]
}    retrieveAll(){
        this.establismentemployeeService.retrieveAll().subscribe({
            next: (data) => {
                this.all = data;
            },
            error: (error) => {
                alert(error);
            }
        });
    }
delete(id:number){
    this.establismentemployeeService.delete(id).subscribe({
        next: (data) => {
            this.retrieveAll();
        },
        error: (error) => {
            alert(error);
        }
    });
}
    update(id:number){
        this.establismentemployeeService.getById(id).subscribe({
            next: (data) => {

this.idValue = data.idemp
this.idestablishmentValue = data.idestablishment
this.nameemployeeValue = data.nameemployee,
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
