import { Component, OnInit } from '@angular/core';
import { AppService } from '../../../app.service';
import { FormsModule } from '@angular/forms';
import { FundrequestService } from './fundrequest.service';
import { DashboardCardComponent } from '../../../reusable/dashboard-card/dashboard-card.component';
import { NInputComponent } from '../../../reusable/n-input/n-input.component';
import { SubmitButtonComponent } from '../../../reusable/submit-button/submit-button.component';
import { CartService } from '../cart/cart.service';

@Component({
    selector: 'app-fundrequest',
    standalone: true,
    templateUrl: './fundrequest.component.html',
    styleUrl: './fundrequest.component.css',
    imports: [
        FormsModule,
        DashboardCardComponent,
        NInputComponent,
        SubmitButtonComponent,
    ],
})
export class FundrequestComponent implements OnInit {
    constructor(
        private appService: AppService,
        private fundservice: FundrequestService,
        private cartService: CartService
    ) {}
    ngOnInit(): void {
        this.retrieveProfil();
        this.getSolde();
        // throw new Error('Method not implemented.');
    }
    retrieveProfil() {
        let token = localStorage.getItem('userToken');
        if (token == null) {
            alert('You are not logged in');
            throw new Error('You are not logged in');
        }
        this.appService.retrieveMyProfile(token).subscribe({
            next: (resp) => {
                this.idCustomer = resp.uniqId;
            },
        });
    }
    onSubmit() {
        const localDate = new Date(this.dateRequest);
        const offsetInMinutes = localDate.getTimezoneOffset();
        const adjustedDate = new Date(
            localDate.getTime() - offsetInMinutes * 60 * 1000
        );

        const query = {
            idcustomer: this.idCustomer,
            virtualamount: this.money,
            ispending: true,
            daterequest:adjustedDate.toISOString()
        };
        console.log(query);
        this.fundservice.sendRequest(query).subscribe({
            next: (resp) => {
                alert('Success');
            },
            error: (err) => {
                alert('Error');
            },
        });
    }
    getSolde() {
        const localDate = new Date(this.dateRequest);
        const offsetInMinutes = localDate.getTimezoneOffset();
        const adjustedDate = new Date(
            localDate.getTime() - offsetInMinutes * 60 * 1000
        );

        const form = {
            orderDate: adjustedDate.toISOString(), // Convert date to ISO string in UTC
        };
        console.log(form.orderDate);
        this.cartService.getSolde(form).subscribe({
            next: (resp) => {
                console.log('Resp  ' + resp);
                this.solde = resp.virtualamount;
            },
            error: (err) => {
                console.log(err.value);
                alert(err);
            },
        });
    }
    dateRequest:Date = new Date();
    money!: number;
    idCustomer!: string;
    solde!: number;
}
