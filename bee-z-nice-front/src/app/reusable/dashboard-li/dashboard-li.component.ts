import { NgClass } from '@angular/common';
import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-dashboard-li',
  standalone: true,
  imports: [
    NgClass
  ],
  templateUrl: './dashboard-li.component.html',
  styleUrl: './dashboard-li.component.css'
})
export class DashboardLiComponent {
  sidePad:boolean = false;
  @Input() linkLabel!:string;
  @Input() href!:string;
}
