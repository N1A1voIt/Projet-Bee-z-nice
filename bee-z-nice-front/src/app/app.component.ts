import {Component, OnInit} from '@angular/core';
import {Router, RouterOutlet} from '@angular/router';
import {CommonModule, NgClass, NgForOf, NgIf} from "@angular/common";
import {MatIconModule} from "@angular/material/icon";
import {CardMenuComponent} from "./reusable/card-menu/card-menu.component";
import {DishetypeService} from "./components/dishetype/dishetype.service";
import {DishetypeComponent} from "./components/dishetype/dishetype.component";
import {imagesRoute} from "../environnements/env";
import {AppService} from "./app.service";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, NgIf, MatIconModule, CardMenuComponent, NgClass, NgForOf, DishetypeComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit{
  title = 'bee-z-nice-front';
  isAdmin:boolean=false;
  isLoggedIn:boolean=false;
  showdiv:boolean=false;
  menuType:any;
  imageRoute:any = imagesRoute();
  constructor(private disheTypeService:DishetypeService,private appService:AppService,private router:Router) {
  }
  ngOnInit(): void {
    this.checkSession();
    if (!this.isLoggedIn && this.router.url !== '/login' && this.router.url !== '/register'){
      this.router.navigate(['/login']);
    }
    if (this.isLoggedIn && !this.isAdmin){
      this.retrieveMenuType()
    }
  }
  checkSession(){
    return this.appService.checkSession().subscribe({
      next:(response)=>{
        if (response!=null){
            this.isLoggedIn = true;
            this.isAdmin = response.isadmin;
        }else{
          this.isLoggedIn = false;
          this.isAdmin = false;
        }
      }
    })
  }
  retrieveMenuType(){
    this.disheTypeService.retrieveAll().subscribe({
      next: (data) => {
        this.menuType = data;
      },
      error: (error) => {
        alert(error);
      }
    })
  }

}
