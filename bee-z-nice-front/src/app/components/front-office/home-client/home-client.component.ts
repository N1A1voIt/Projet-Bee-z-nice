import { Component, OnInit } from '@angular/core';
import { HomeClientService } from './home-client.service';
import { MarkByDisheComponent } from "../mark-by-dishe/mark-by-dishe.component";
import { CommonModule } from '@angular/common';

@Component({
    selector: 'app-home-client',
    standalone: true,
    templateUrl: './home-client.component.html',
    styleUrl: './home-client.component.css',
    imports: [MarkByDisheComponent,CommonModule ]
})
export class HomeClientComponent implements OnInit {
  top3:any;
  ngOnInit(): void {
    this.getTop3();
  }
  constructor(private homeClientService:HomeClientService){}
  getTop3(){
    this.homeClientService.getTop3().subscribe({
      next:(resp) => {
        this.top3 = resp
      },error:(err)=>{
        alert(err)
      }
    })
  }
}
