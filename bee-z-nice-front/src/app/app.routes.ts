import { Routes } from '@angular/router';
import {SignupComponent} from "./components/signup/signup.component";
import {HomeComponent} from "./components/home/home.component";
import {HomeClientComponent} from "./components/home-client/home-client.component";
import {EstablishmentComponent} from "./components/establishment/establishment.component";
import {EstablismentemployeeComponent} from "./components/establismentemployee/establismentemployee.component";

export const routes: Routes = [
    {path:'register',component:SignupComponent},
    {path:'home',component:HomeComponent},
    {path:'client',component:HomeClientComponent},
    {path:'establishment',component:EstablishmentComponent},
    {path:'establishmentemp',component:EstablismentemployeeComponent}
];
