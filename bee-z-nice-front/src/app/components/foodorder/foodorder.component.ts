import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { FoodorderService } from './foodorder.service';
import { NInputComponent } from '../../reusable/n-input/n-input.component';
import { NSelectComponent } from '../../reusable/n-select/n-select.component';
import { NTableComponent } from '../../reusable/n-table/n-table.component';
import { NgxPaginationModule } from 'ngx-pagination';
import { CommonModule, NgFor } from '@angular/common';
import { ModalComponentComponent } from '../../reusable/modal-component/modal-component.component';
import { SubmitButtonComponent } from '../../reusable/submit-button/submit-button.component';
@Component({
    selector: 'app-foodorder',
    standalone: true,
    imports: [
        FormsModule,
        NgFor,
        CommonModule,
        NInputComponent,
        NSelectComponent,
        NgxPaginationModule,
        ModalComponentComponent,
        NTableComponent,
        SubmitButtonComponent,
    ],
    templateUrl: './foodorder.component.html',
    styleUrl: './foodorder.component.css',
})
export class FoodorderComponent implements OnInit {
    listAddtocart: any;
    listDishes: any;
    listCustomers: any;
    listModeofpayment: any;
    showForm: boolean = false;
    pages: number = 1;
    all: any;
    isUpdate: boolean = false;
    idValue: number | null = null;
    paymenttypeidValue: number | null = null;
    iddishesValue: number | null = null;
    customeridValue: number | null = null;
    ordertimeValue: any;
    dishepriceValue: number | null = null;
    dishepurchasepriceValue: number | null = null;
    idaddtocartValue: number | null = null;
    constructor(private foodorderService: FoodorderService) {}
    onSubmit(form: any) {
        this.foodorderService.saveData(form.value).subscribe({
            next: (data) => {
                this.retrieveAll();
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    retrieveDropDown() {
        return [
            this.foodorderService.retrieveAddtocartList().subscribe({
                next: (data) => {
                    this.listAddtocart = data;
                },
                error: (error) => {
                    alert(error);
                },
            }),
            this.foodorderService.retrieveDishesList().subscribe({
                next: (data) => {
                    this.listDishes = data;
                },
                error: (error) => {
                    alert(error);
                },
            }),
            this.foodorderService.retrieveCustomersList().subscribe({
                next: (data) => {
                    this.listCustomers = data;
                },
                error: (error) => {
                    alert(error);
                },
            }),
            this.foodorderService.retrieveModeofpaymentList().subscribe({
                next: (data) => {
                    this.listModeofpayment = data;
                },
                error: (error) => {
                    alert(error);
                },
            }),
        ];
    }
    retrieveAll() {
        this.foodorderService.retrieveAll().subscribe({
            next: (data) => {
                this.all = data;
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    delete(id: number) {
        this.foodorderService.delete(id).subscribe({
            next: (data) => {
                this.retrieveAll();
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    update(id: number) {
        this.foodorderService.getById(id).subscribe({
            next: (data) => {
                this.idValue = data.id;
                this.paymenttypeidValue = data.paymenttypeid;
                this.iddishesValue = data.iddishes;
                this.customeridValue = data.customerid;
                this.ordertimeValue = data.ordertime;
                this.dishepriceValue = data.disheprice;
                this.dishepurchasepriceValue = data.dishepurchaseprice;
                (this.idaddtocartValue = data.idaddtocart),
                    (this.isUpdate = true);
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    ngOnInit() {
        this.retrieveDropDown();
        this.retrieveAll();
    }
}
