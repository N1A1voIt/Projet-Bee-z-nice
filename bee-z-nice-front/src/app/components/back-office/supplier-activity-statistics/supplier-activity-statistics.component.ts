import { CommonModule } from '@angular/common';
import { ChangeDetectionStrategy, Component, OnInit } from '@angular/core';
import { NInputComponent } from "../../../reusable/n-input/n-input.component";
import { SubmitButtonComponent } from "../../../reusable/submit-button/submit-button.component";
import { Chart, ChartModule } from 'angular-highcharts';
import { SupplierActivityStatisticsService } from './supplier-activity-statistics.service';
import { FormsModule } from '@angular/forms';

@Component({
    selector: 'app-spplier-activity-statistics',
    standalone: true,
    templateUrl: './supplier-activity-statistics.component.html',
    styleUrl: './supplier-activity-statistics.component.css',
    imports: [
        CommonModule,
        NInputComponent,
        SubmitButtonComponent,
        ChartModule,
        FormsModule
    ]
})
export class SupplierActivityStatisticsComponent implements OnInit {
    activity:any;
    constructor(private supplierService:SupplierActivityStatisticsService){}
    ngOnInit(): void {
        const form = {
            startDate:null,
            endDate:null
        }
        this.supplierService.activity(form).subscribe({
            next:(response)=>{
                this.activity = response
                this.updateChartData();

            },
            error:(error) => {
                console.error(error)
            }
        });
    } 
    pieChart:any;
    getGraph(form:any){
        this.supplierService.activity(form.value).subscribe({
            next:(response)=>{
                this.activity = response
                console.log("response"+response)
                this.updateChartData();
            },
            error:(error) => {
                console.error(error)
            }
        });
    }
    private updateChartData(): void {
        if (this.activity) {
            this.pieChart=new Chart({
                chart: {
                  type: 'pie',
                  plotShadow: false,
                },
              
                credits: {
                  enabled: false,
                },
              
                plotOptions: {
                  pie: {
                    innerSize: '99%',
                    borderWidth: 10,
                    borderColor: '',
                    slicedOffset: 10,
                    dataLabels: {
                      connectorWidth: 0,
                    },
                  },
                },
              
                title: {
                  verticalAlign: 'middle',
                  floating: true,
                  text: 'Activité',
                },
              
                legend: {
                  enabled: false,
                },
              
                series: [
                  {
                    type: 'pie',
                    data: this.activity.map((item: { nameSupplier: any; dishesSold: any; }) => ({
                        name: item.nameSupplier,
                        y: item.dishesSold
                    }))
                  },
                ],
              })
              console.log(this.pieChart)
        }
      }
}
