import { NgForm } from '@angular/forms';
import { Component } from '@angular/core';

@Component({
  selector: 'app-investisseur',
  templateUrl: './investisseur.component.html',
  styleUrls: ['./investisseur.component.css']
})
export class InvestisseurComponent {
  name: string = '';
  date: string = '';
  amount: string = '';
  acount: { date: string, paid: number }[] = [];

  constructor() { }

  onSubmit(form: NgForm) {
    this.acount = this.mockSearchBenefits(form.value.name, form.value.date, form.value.amount);
  }

  mockSearchBenefits(name: string, date: string, amount: string): { date: string, paid: number }[] {
    // Replace this with your actual logic to fetch benefits
    return [
      { date: '2023-05-01', paid: 0 },
      { date: '2023-05-02', paid: 0 },
      { date: '2023-05-03', paid: 150 },
      { date: '2023-05-04', paid: 100 },
      { date: '2023-05-05', paid: 200 }
    ];
  }
}
