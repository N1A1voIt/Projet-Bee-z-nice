import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-benefice',
  templateUrl: './benefice.component.html',
  styleUrls: ['./benefice.component.css']
})
export class BeneficeComponent {
  startDate: string = '';
  endDate: string = '';
  benefits: any[] = [];

  constructor() { }

  onSubmit(form: NgForm) {
    this.benefits = this.mockSearchBenefits(form.value.startDate, form.value.endDate);
  }

  mockSearchBenefits(startDate: string, endDate: string): any[] {
    // Replace this with your actual logic to fetch benefits
    return [
      { date: '2023-05-01', benefit: 0 },
      { date: '2023-05-02', benefit: 0 },
      { date: '2023-05-03', benefit: 150 },
      { date: '2023-05-04', benefit: 100 },
      { date: '2023-05-05', benefit: 200 }
    ];
  }

  generatePoints(benefits: any[]): string {
    if (!benefits || benefits.length === 0) {
      return '';
    }

    const maxBenefit = Math.max(...benefits.map(b => b.benefit));
    const points = benefits.map((benefit, index) => {
      const x = index * 40; // Adjust spacing as needed
      const y = 270 - (benefit.benefit / maxBenefit * 62); // Adjust to fit your SVG
      return `${x},${y}`;
    });

    return points.join(' ');
  }

}
