import { CommonModule } from '@angular/common';
import { ChangeDetectionStrategy, Component, OnInit } from '@angular/core';
import { ProfitsStatisticsService } from './profits-statistics.service';
import { error } from 'highcharts';
import { Chart,ChartModule } from 'angular-highcharts';
import { NInputComponent } from "../../../reusable/n-input/n-input.component";
import { SubmitButtonComponent } from "../../../reusable/submit-button/submit-button.component";
import { FormsModule } from '@angular/forms';
import Highcharts from 'highcharts';
import HC_exporting from 'highcharts/modules/exporting';
// import HC_locale_fr from 'highcharts/modules/locales/fr';
@Component({
    selector: 'app-profits-statistics',
    standalone: true,
    templateUrl: './profits-statistics.component.html',
    styleUrl: './profits-statistics.component.css',
    imports: [
        CommonModule, ChartModule,
        NInputComponent,
        SubmitButtonComponent,
        FormsModule
    ]
})
export class ProfitsStatisticsComponent implements OnInit{
    profitsData:any;
    linecharts:any;
    Highcharts: typeof Highcharts = Highcharts;
   

    constructor(private profitsServices:ProfitsStatisticsService){
        Highcharts.setOptions({
            lang: {
              months: [
                'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
                'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
              ],
              shortMonths: [
                'Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin',
                'Juil', 'Août', 'Sept', 'Oct', 'Nov', 'Déc'
              ],
              weekdays: [
                'Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'
              ],
              shortWeekdays: [
                'Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'
              ],
              decimalPoint: ',',
              thousandsSep: ' '
            }
          });
    }
    ngOnInit(): void {
        const form = {
            startDate:null,
            endDate:null,
            type:1,
        }
        this.profitsServices.profits(form).subscribe({
            next:(response)=>{
                this.profitsData = response
                console.log("response"+response)
                this.updateChart();
            },
            error:(error) => {
                console.error(error)
            }
        });
    }
    getGraph(form:any){
        this.profitsServices.profits(form.value).subscribe({
            next:(response)=>{
                this.profitsData = response
                console.log("response"+response)
                this.updateChart();
            },
            error:(error) => {
                console.error(error)
            }
        });
    }
    
    updateChart(){
        const seriesData = this.profitsData.map((item: { starter: string | number | Date; profit: any; }) => ({
            x: new Date(item.starter).getTime(), // Convert starter to timestamp
            y: item.profit
          }));
          
          this.linecharts=new Chart({
            chart: {
              type: 'spline'
            },
            title: {
                text: 'Profits'
              },
              xAxis: {
                type: 'datetime',
                title: {
                  text: 'Date'
                },dateTimeLabelFormats: { // Format labels according to French locale
                    day: '%e %b',
                    month: '%b \'%y',
                    year: '%Y'
                  }
              },
              yAxis: {
                title: {
                  text: 'Profit ($)'
                }
              },
              series: [{
                type: 'line',
                name: 'Profit',
                data: seriesData
              }]
          })
    }
    

    dropdown:any = [
        {
            id:1,
            label:'Daily'
        },
        {
            id:2,
            label:'Weekly'
        },
        {
            id:3,
            label:'Monthly'
        }
    ]

}
