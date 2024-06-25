import { Component, OnInit } from '@angular/core';
import { DashboardCardComponent } from "../../../reusable/dashboard-card/dashboard-card.component";
import { NInputComponent } from "../../../reusable/n-input/n-input.component";
import { NSelectComponent } from "../../../reusable/n-select/n-select.component";
import { SubmitButtonComponent } from "../../../reusable/submit-button/submit-button.component";
import { NTableComponent } from "../../../reusable/n-table/n-table.component";
import { EstablishmentService } from '../establishment/establishment.service';
import { CommonModule } from '@angular/common';
import { HomeService } from './home.service';
// import { Chart, ChartData, ChartOptions, ChartType } from 'chart.js';
import { BaseChartDirective } from '../../../directives/BaseChart.directive';   
import { Chart, ChartModule } from 'angular-highcharts';
import { FormsModule, NgForm } from '@angular/forms';

@Component({
    selector: 'app-home',
    standalone: true,
    templateUrl: './home.component.html',
    styleUrl: './home.component.css',
    imports: [DashboardCardComponent, NInputComponent, NSelectComponent, SubmitButtonComponent, NTableComponent,CommonModule,BaseChartDirective,ChartModule,FormsModule]
})
export class HomeComponent implements OnInit{
    establishments:any;
    dashboard:any;

    constructor(private establishmentService:EstablishmentService,private service:HomeService){}
    ngOnInit(): void {
        this.establishmentService.retrieveAll().subscribe(
            {
                next:(data)=>{
                    this.establishments=data;
                },
                error:(error) => {
                    alert(error)
                    console.error(error)
                }
            }
        )
        const formData = {
            "startDate":null,	
            "endDate":null,
            "idEstablishment":0
        }
        this.service.getDashboardXML(formData).subscribe({
            next:(response)=>{
                this.dashboard = response;
                console.log(response)
                this.updateChartData();
            },error:(error)=>{
                alert(error)
            }
        });
    }
    pieChart:any;
    private updateChartData(): void {
        if (this.dashboard && this.dashboard.mostSoldTypes) {
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
                  text: 'Types de plats',
                },
              
                legend: {
                  enabled: false,
                },
              
                series: [
                  {
                    type: 'pie',
                    data: this.dashboard.mostSoldTypes.map((item: { libelle: any; benefits: any; }) => ({
                        name: item.libelle,
                        y: item.benefits
                    }))
                  },
                ],
              })
        }
      }
    getDashboard(form:any){
        this.service.getDashboardXML(form.value).subscribe({
            next:(response)=>{
                this.dashboard = response;
                console.log(response)
                this.updateChartData();
            },error:(error)=>{
                alert(error)
            }
        });
    }

}
