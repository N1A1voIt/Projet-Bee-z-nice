import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {CommonModule,NgIf} from "@angular/common";

@Component({
  selector: 'app-root',
  standalone: true,
    imports: [RouterOutlet, NgIf],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'bee-z-nice-front';
  isAdmin:boolean=false;
  isLoggedIn:boolean=false;
}
