import { Component, OnInit } from '@angular/core';
import { NInputComponent } from "../../../reusable/n-input/n-input.component";
import { SubmitButtonComponent } from "../../../reusable/submit-button/submit-button.component";
import { FormsModule } from '@angular/forms';
import { CustomersrequestService } from './customersrequest.service';
import { NTableComponent } from "../../../reusable/n-table/n-table.component";
import { CommonModule } from '@angular/common';
import { NgxPaginationModule } from 'ngx-pagination';

@Component({
    selector: 'app-customersrequest',
    standalone: true,
    templateUrl: './customersrequest.component.html',
    styleUrl: './customersrequest.component.css',
    imports: [NInputComponent, SubmitButtonComponent, FormsModule, NTableComponent,CommonModule,NgxPaginationModule]
})
export class CustomersrequestComponent implements OnInit {
  dateRequest:Date = new Date();
  listPendingRequest:any;
  pages: number = 1;
  constructor(private customerRequestService:CustomersrequestService){}
  ngOnInit(): void {
    this.getPendingRequest();
  }
  getPendingRequest(){
    const localDate = new Date(this.dateRequest);
    const offsetInMinutes = localDate.getTimezoneOffset();
    const adjustedDate = new Date(
        localDate.getTime() - offsetInMinutes * 60 * 1000
    );

    const form = {
      orderDate:adjustedDate
    }
    this.extractPendingRequest(form);
  }
  private extractPendingRequest(form: { orderDate: Date; }) {
    this.customerRequestService.getPendingRequest(form).subscribe({
      next: (resp) => {
        this.listPendingRequest = resp;
      }, error: (err) => {
        alert('Error');
      }
    });
  }

  sendValidation(id:any){
    const localDate = new Date(this.dateRequest);
    const offsetInMinutes = localDate.getTimezoneOffset();
    const adjustedDate = new Date(
        localDate.getTime() - offsetInMinutes * 60 * 1000
    );
    const form = {
      id:id,
      orderDate:adjustedDate
    }
    this.customerRequestService.sendValidation(form).subscribe({
      next: (resp) => {
        alert('Validation successfull')
        this.getPendingRequest();
      }, error: (err) => {
        console.log(err)
        alert(err);
      }
    });
  }
}
