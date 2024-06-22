import {Component, OnInit} from '@angular/core';
import {Router, RouterOutlet} from '@angular/router';
import {CommonModule, NgClass, NgForOf, NgIf} from "@angular/common";
import {MatIconModule} from "@angular/material/icon";
import {CardMenuComponent} from "./reusable/card-menu/card-menu.component";
import {DishetypeService} from "./components/back-office/dishetype/dishetype.service";
import {DishetypeComponent} from "./components/back-office/dishetype/dishetype.component";
import {imagesRoute} from "../environnements/env";
import {AppService} from "./app.service";
import {CartComponent} from "./components/front-office/cart/cart.component";
import { DashboardLiComponent } from "./reusable/dashboard-li/dashboard-li.component";
import { WfullDirective } from './directives/wfull.directive';
@Component({
    selector: 'app-root',
    standalone: true,
    templateUrl: './app.component.html',
    styleUrl: './app.component.css',
    imports: [RouterOutlet, NgIf, MatIconModule, CardMenuComponent, NgClass, NgForOf, DishetypeComponent, DashboardLiComponent, CartComponent,WfullDirective]
})
export class AppComponent implements OnInit{
  title = 'bee-z-nice-front';
  isAdmin:boolean=false;
  isLoggedIn:boolean=false;
  showdiv:boolean=false;
  showcrud:boolean=false;
  showstate:boolean=false;
  menuType:any;
  showCart:boolean = false;
  imageRoute:any = imagesRoute();
  isCrudPage:boolean = false;
  constructor(private disheTypeService:DishetypeService,private appService:AppService,private router:Router) {
  }
  ngOnInit(): void {
    this.checkToken();
    if (this.isLoggedIn && !this.isAdmin){
      this.retrieveMenuType()
    }
  }
  checkToken(){
    if(localStorage.getItem("userToken")!=null){
      this.isLoggedIn = true;
      // @ts-ignore
      return this.appService.retrieveMyProfile(localStorage.getItem("userToken")).subscribe({
        next:(response)=>{
          if (response!=null){
              console.log(response);
              this.isLoggedIn = true;
              this.isAdmin = !!response.isAdmin;
              console.log(this.isAdmin)
          }else{
            this.isLoggedIn = false;
            this.isAdmin = false;
          }
        }
      })
    }
    return null
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
  resetPageNavigation(){
    this.isCrudPage = false;
  }
  logout(){
    localStorage.removeItem("userToken");
    this.router.navigateByUrl('/login');
  }
}
