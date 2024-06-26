import {Component, OnInit} from '@angular/core';
import {FormsModule} from "@angular/forms";
import {SupplierService} from "./supplier.service";
import {NInputComponent} from "../../../reusable/n-input/n-input.component";
import {NSelectComponent} from "../../../reusable/n-select/n-select.component";
import {NTableComponent} from "../../../reusable/n-table/n-table.component";
import { NgxPaginationModule } from 'ngx-pagination';
import {CommonModule, NgFor} from "@angular/common";
import {ModalComponentComponent} from "../../../reusable/modal-component/modal-component.component";
import {SubmitButtonComponent} from "../../../reusable/submit-button/submit-button.component";
import { MatIcon } from '@angular/material/icon';
@Component({
selector: 'app-supplier',standalone:true,imports: [FormsModule, NgFor,MatIcon ,CommonModule, NInputComponent, NSelectComponent, NgxPaginationModule, ModalComponentComponent, NTableComponent, SubmitButtonComponent],
templateUrl: './supplier.component.html',
styleUrl: './supplier.component.css'})
export class SupplierComponent implements OnInit{
showForm: boolean = false;
pages: number = 1;
all:any;
isUpdate:boolean = false;
idValue:number|null = null;
namesupplierValue:string|null = null;
constructor(private supplierService:SupplierService){}
    onSubmit(form:any){
        this.supplierService.saveData(form.value).subscribe({
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
        this.supplierService.retrieveAll().subscribe({
            next: (data) => {
                this.all = data;
            },
            error: (error) => {
                alert(error);
            }
        });
    }
delete(id:number){
    this.supplierService.delete(id).subscribe({
        next: (data) => {
            this.retrieveAll();
        },
        error: (error) => {
            alert(error);
        }
    });
}
    update(id:number){
        this.supplierService.getById(id).subscribe({
            next: (data) => {
                
this.idValue = data.id
this.namesupplierValue = data.namesupplier,
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
