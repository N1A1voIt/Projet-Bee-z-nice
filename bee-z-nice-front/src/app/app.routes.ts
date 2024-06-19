import { Routes } from '@angular/router';
import {SignupComponent} from "./components/signup/signup.component";
import {HomeComponent} from "./components/home/home.component";
import {HomeClientComponent} from "./components/home-client/home-client.component";
import {EstablishmentComponent} from "./components/establishment/establishment.component";
import {EstablismentemployeeComponent} from "./components/establismentemployee/establismentemployee.component";
import {FoodDisplayerComponent} from "./components/front-office/food-displayer/food-displayer.component";
import {DishesComponent} from "./components/dishes/dishes.component";
import {SupplierComponent} from "./components/supplier/supplier.component";
import {LoginComponent} from "./components/login/login.component";
import {adminGuardGuard, clientGuardGuard, loginGuard} from "./security-components/client-guard.guard";
import {DishetypeComponent} from "./components/dishetype/dishetype.component";
import { ErrorPageNotAuthorizedComponent } from './components/error-page-not-authorized/error-page-not-authorized.component';
import { CustomersmoneyComponent } from './components/customersmoney/customersmoney.component';
import { StockbyestablishmentComponent } from './components/stockbyestablishment/stockbyestablishment.component';
import { MovementtypeComponent } from './components/movementtype/movementtype.component';
import { MarkByDisheComponent } from './components/front-office/mark-by-dishe/mark-by-dishe.component';
import { RatingViewComponent } from './components/front-office/rating-view/rating-view.component';

export const routes: Routes = [
    {path:'register',component:SignupComponent,canActivate:[loginGuard]},
    {path:'login',component:LoginComponent,canActivate:[loginGuard]},
    {path:'home',component:HomeComponent,canActivate:[adminGuardGuard]},
    {path:'client',component:HomeClientComponent,canActivate:[clientGuardGuard]},
    {path:'establishment',component:EstablishmentComponent,canActivate:[adminGuardGuard]},
    {path:'establishmentemp',component:EstablismentemployeeComponent,canActivate:[adminGuardGuard]},
    {path:'stock',component:StockbyestablishmentComponent,canActivate:[adminGuardGuard]},
    {path:'move',component:MovementtypeComponent,canActivate:[adminGuardGuard]},
    {path:'disheType',component:DishetypeComponent,canActivate:[adminGuardGuard]},
    {path:'dishes',component:DishesComponent,canActivate:[adminGuardGuard]},
    {path:'customersMoney',component:CustomersmoneyComponent,canActivate:[adminGuardGuard]},
    {path:'supplier',component:SupplierComponent,canActivate:[adminGuardGuard]},
    {path:'foodDisplay/:id',component:FoodDisplayerComponent},
    {path:'errorPageNotAuthorized',component:ErrorPageNotAuthorizedComponent},
    {path:'ratingView',component:RatingViewComponent}
    // {path:'markByDishe',component:MarkByDisheComponent}
];
