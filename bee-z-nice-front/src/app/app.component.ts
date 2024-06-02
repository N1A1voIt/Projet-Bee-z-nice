import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {CommonModule, NgClass, NgIf} from "@angular/common";
import {MatIconModule} from "@angular/material/icon";
import {CardMenuComponent} from "./reusable/card-menu/card-menu.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, NgIf, MatIconModule, CardMenuComponent, NgClass],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'bee-z-nice-front';
  isAdmin:boolean=false;
  isLoggedIn:boolean=false;
  showdiv:boolean=false;
}
