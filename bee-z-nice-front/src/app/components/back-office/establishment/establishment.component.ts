import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { EstablishmentService } from './establishment.service';
import { NInputComponent } from '../../../reusable/n-input/n-input.component';
import { NSelectComponent } from '../../../reusable/n-select/n-select.component';
import { NTableComponent } from '../../../reusable/n-table/n-table.component';
import { NgxPaginationModule } from 'ngx-pagination';
import { CommonModule, NgFor } from '@angular/common';
import { ModalComponentComponent } from '../../../reusable/modal-component/modal-component.component';
import { SubmitButtonComponent } from '../../../reusable/submit-button/submit-button.component';
@Component({
    selector: 'app-establishment',
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
    templateUrl: './establishment.component.html',
    styleUrl: './establishment.component.css',
})
export class EstablishmentComponent implements OnInit {
    showForm: boolean = false;
    pages: number = 1;
    all: any;
    isUpdate: boolean = false;
    idValue: number | null = null;
    nameValue: string | null = null;
    locationValue: string | null = null;
    constructor(private establishmentService: EstablishmentService) {}
    onSubmit(form: any) {
        this.establishmentService.saveData(form.value).subscribe({
            next: (data) => {
                this.retrieveAll();
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    retrieveDropDown() {
        return [];
    }
    retrieveAll() {
        this.establishmentService.retrieveAll().subscribe({
            next: (data) => {
                this.all = data;
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    delete(id: number) {
        this.establishmentService.delete(id).subscribe({
            next: (data) => {
                this.retrieveAll();
            },
            error: (error) => {
                alert(error);
            },
        });
    }
    update(id: number) {
        this.establishmentService.getById(id).subscribe({
            next: (data) => {
                this.idValue = data.id;
                this.nameValue = data.name;
                (this.locationValue = data.location), (this.isUpdate = true);
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
