import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { StockbyestablishmentService } from './stockbyestablishment.service';
import { NInputComponent } from '../../../reusable/n-input/n-input.component';
import { NSelectComponent } from '../../../reusable/n-select/n-select.component';
import { NTableComponent } from '../../../reusable/n-table/n-table.component';
import { NgxPaginationModule } from 'ngx-pagination';
import { CommonModule, NgFor } from '@angular/common';
import { ModalComponentComponent } from '../../../reusable/modal-component/modal-component.component';
import { SubmitButtonComponent } from '../../../reusable/submit-button/submit-button.component';
@Component({
    selector: 'app-stockbyestablishment',
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
    templateUrl: './stockbyestablishment.component.html',
    styleUrl: './stockbyestablishment.component.css',
})
export class StockbyestablishmentComponent implements OnInit {
    listMovementtype: any;
    listDishes: any;
    listEstablishment: any;
    showForm: boolean = false;
    pages: number = 1;
    all: any;
    isUpdate: boolean = false;
    idValue: number | null = null;
    iddishesValue: number | null = null;
    idestablishmentValue: number | null = null;
    remainingstockValue: number | null = null;
    idmovementtypeValue: number | null = null;
    movedateValue: Date | null = null;
    datePicker:Date = new Date();
    filterName: string = '';
    filterDate:string = '';
    get filteredList() {
        return this.all.filter((item: { name: string; movedate: string | number | Date; }) => {
          const matchesName = item.name.toLowerCase().includes(this.filterName.toLowerCase());
          const matchesDate = !this.filterDate || new Date(item.movedate) <= new Date(this.filterDate);
          return matchesName && matchesDate;
        });
      }
    constructor(
        private stockbyestablishmentService: StockbyestablishmentService
    ) {}
    onSubmit(form: any) {
        // let date = new Date(form.movedate); // Assuming form.movedate is in ISO format from your datetime-local input
        // let utcDate = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds()));
        
        // form.movedate = utcDate.toISOString();
        this.stockbyestablishmentService.saveData(form.value).subscribe({
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
            this.stockbyestablishmentService
                .retrieveMovementtypeList()
                .subscribe({
                    next: (data) => {
                        this.listMovementtype = data;
                    },
                    error: (error) => {
                        alert(error);
                    },
                }),
            this.stockbyestablishmentService.retrieveDishesList().subscribe({
                next: (data) => {
                    this.listDishes = data;
                },
                error: (error) => {
                    alert(error);
                },
            }),
            this.stockbyestablishmentService
                .retrieveEstablishmentList()
                .subscribe({
                    next: (data) => {
                        this.listEstablishment = data;
                    },
                    error: (error) => {
                        alert(error);
                    },
                }),
        ];
    }
    retrieveAll() {
        this.stockbyestablishmentService.retrieveAll().subscribe({
            next: (data) => {
                console.log(data);
                this.all = data;
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    delete(id: number) {
        this.stockbyestablishmentService.delete(id).subscribe({
            next: (data) => {
                this.retrieveAll();
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    update(id: number) {
        this.stockbyestablishmentService.getById(id).subscribe({
            next: (data) => {
                this.idValue = data.id;
                this.iddishesValue = data.iddishes;
                this.idestablishmentValue = data.idestablishment;
                this.remainingstockValue = data.remainingstock;
                (this.idmovementtypeValue = data.idmovementtype),
                    (this.movedateValue = data.movedate),
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
