import {Component, OnInit} from '@angular/core';
import {FormsModule} from "@angular/forms";
import {SupplierPaymentService} from "./supplierPayment.service";
import {NInputComponent} from "../../../reusable/n-input/n-input.component";
import {NSelectComponent} from "../../../reusable/n-select/n-select.component";
import {NTableComponent} from "../../../reusable/n-table/n-table.component";
import { NgxPaginationModule } from 'ngx-pagination';
import {CommonModule, NgFor} from "@angular/common";
import {ModalComponentComponent} from "../../../reusable/modal-component/modal-component.component";
import {SubmitButtonComponent} from "../../../reusable/submit-button/submit-button.component";
// @ts-ignore
import { LocalDate } from '@js-joda/core';

@Component({
    selector: 'app-supplier',standalone:true,imports: [FormsModule, NgFor, CommonModule, NInputComponent, NSelectComponent, NgxPaginationModule, ModalComponentComponent, NTableComponent, SubmitButtonComponent],
    templateUrl: './supplierPayment.component.html',
    styleUrl: './supplierPayment.component.css'
})
export class SupplierPaymentComponent implements OnInit{
    showForm: boolean = false;
    pages: number = 1;
    allUnPayed:any;
    idValue:number|null = null;
    idsupplierUnPayedValue!:number;

    constructor(private supplierPaymentService:SupplierPaymentService){}
    onSubmit(id:any){
        const formData = {
            idunpayedstock: id
        }
        console.log(formData)
        // formData.append('idunpayedstock', this.idsupplierUnPayedValue.toString());
        this.supplierPaymentService.saveData(formData).subscribe({
                next:(data)=>{
                    this.retrieveDropDown();
                },
                error:(error)=>{
                    alert(error)
                }
            }
        )
    }
    retrieveDropDown(){
        return this.supplierPaymentService.retrieveAllUnPayed().subscribe({
                next:(data)=>{
                    this.allUnPayed = data
                },
                error:(error)=>{
                    alert(error)
                }
            }
        );
    }

    ngOnInit(): void {
        this.retrieveDropDown();
    }
}
