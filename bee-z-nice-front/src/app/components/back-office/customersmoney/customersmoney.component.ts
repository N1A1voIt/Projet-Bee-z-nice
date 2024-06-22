import {Component, OnInit} from '@angular/core';
import {FormsModule} from "@angular/forms";
import {CustomersmoneyService} from "./customersmoney.service";
import {NInputComponent} from "../../../reusable/n-input/n-input.component";
import {NSelectComponent} from "../../../reusable/n-select/n-select.component";
import {NTableComponent} from "../../../reusable/n-table/n-table.component";
import { NgxPaginationModule } from 'ngx-pagination';
import {CommonModule, NgFor} from "@angular/common";
import {ModalComponentComponent} from "../../../reusable/modal-component/modal-component.component";
import {SubmitButtonComponent} from "../../../reusable/submit-button/submit-button.component";
@Component({
selector: 'app-customersmoney',standalone:true,imports: [FormsModule, NgFor, CommonModule, NInputComponent, NSelectComponent, NgxPaginationModule, ModalComponentComponent, NTableComponent, SubmitButtonComponent],
templateUrl: './customersmoney.component.html',
styleUrl: './customersmoney.component.css'})
export class CustomersmoneyComponent implements OnInit{
listEstablismentemployee:any;
showForm: boolean = false;
pages: number = 1;
all:any;
isUpdate:boolean = false;
idValue:number|null = null;
idcustomerValue:string|null = null;
virtualamountValue:number|null = null;
constructor(private customersmoneyService:CustomersmoneyService){}
    onSubmit(form:any){
        this.customersmoneyService.saveData(form.value).subscribe({
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
this.customersmoneyService.retrieveEstablismentemployeeList().subscribe({
                next:(data)=>{
                    this.listEstablismentemployee = data
                },
                error:(error)=>{
                    alert(error)
                }
            }
            ),
]
}    retrieveAll(){
        this.customersmoneyService.retrieveAll().subscribe({
            next: (data) => {
                this.all = data;
            },
            error: (error) => {
                alert(error);
            }
        });
    }
delete(id:number){
    this.customersmoneyService.delete(id).subscribe({
        next: (data) => {
            this.retrieveAll();
        },
        error: (error) => {
            alert(error);
        }
    });
}
    update(id:number){
        this.customersmoneyService.getById(id).subscribe({
            next: (data) => {
                
this.idValue = data.id
this.idcustomerValue = data.idcustomer
this.virtualamountValue = data.virtualamount,
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
