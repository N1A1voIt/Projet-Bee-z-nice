import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AddtocartService } from './addtocart.service';
import { NInputComponent } from '../../../reusable/n-input/n-input.component';
import { NSelectComponent } from '../../../reusable/n-select/n-select.component';
import { NTableComponent } from '../../../reusable/n-table/n-table.component';
import { NgxPaginationModule } from 'ngx-pagination';
import { CommonModule, NgFor } from '@angular/common';
import { ModalComponentComponent } from '../../../reusable/modal-component/modal-component.component';
import { SubmitButtonComponent } from '../../../reusable/submit-button/submit-button.component';
@Component({
    selector: 'app-addtocart',
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
    templateUrl: './addtocart.component.html',
    styleUrl: './addtocart.component.css',
})
export class AddtocartComponent implements OnInit {
    listDishes: any;
    listCustomers: any;
    showForm: boolean = false;
    pages: number = 1;
    all: any;
    isUpdate: boolean = false;
    idValue: number | null = null;
    iddisheValue: number | null = null;
    iduserValue: number | null = null;
    quantityValue: number | null = null;
    constructor(private addtocartService: AddtocartService) {}
    onSubmit(form: any) {
        this.addtocartService.saveData(form.value).subscribe({
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
            this.addtocartService.retrieveDishesList().subscribe({
                next: (data) => {
                    this.listDishes = data;
                },
                error: (error) => {
                    alert(error);
                },
            }),
            this.addtocartService.retrieveCustomersList().subscribe({
                next: (data) => {
                    this.listCustomers = data;
                },
                error: (error) => {
                    alert(error);
                },
            }),
        ];
    }
    retrieveAll() {
        this.addtocartService.retrieveAll().subscribe({
            next: (data) => {
                this.all = data;
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    delete(id: number) {
        this.addtocartService.delete(id).subscribe({
            next: (data) => {
                this.retrieveAll();
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    update(id: number) {
        this.addtocartService.getById(id).subscribe({
            next: (data) => {
                this.idValue = data.id;
                this.iddisheValue = data.iddishe;
                this.iduserValue = data.iduser;
                (this.quantityValue = data.quantity), (this.isUpdate = true);
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
