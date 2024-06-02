import { Routes } from '@angular/router';
import {SignupComponent} from "./components/signup/signup.component";
import {HomeComponent} from "./components/home/home.component";
import {HomeClientComponent} from "./components/home-client/home-client.component";
import {EstablishmentComponent} from "./components/establishment/establishment.component";
import {EstablismentemployeeComponent} from "./components/establismentemployee/establismentemployee.component";
import {DishetypeService} from "./components/dishetype/dishetype.service";
import {FormBuilder} from "@angular/forms";
import {FoodDisplayerComponent} from "./components/front-office/food-displayer/food-displayer.component";
import {DishesComponent} from "./components/dishes/dishes.component";
import {SupplierComponent} from "./components/supplier/supplier.component";
import {LoginComponent} from "./components/login/login.component";

export const routes: Routes = [
  {path:'register',component:SignupComponent},
  {path:'login',component:LoginComponent},
    {path:'home',component:HomeComponent},
    {path:'client',component:HomeClientComponent},
    {path:'establishment',component:EstablishmentComponent},
    {path:'establishmentemp',component:EstablismentemployeeComponent},
    {path:'disheType',component:DishetypeService},
    {path:'dishes',component:DishesComponent},
    {path:'supplier',component:SupplierComponent},
    {path:'foodDisplay/:id',component:FoodDisplayerComponent}
];
