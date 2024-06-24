import { Routes } from '@angular/router';
import {SignupComponent} from "./components/signup/signup.component";
import {HomeComponent} from "./components/back-office/home/home.component";
import {HomeClientComponent} from "./components/front-office/home-client/home-client.component";
import {EstablishmentComponent} from "./components/back-office/establishment/establishment.component";
import {EstablismentemployeeComponent} from "./components/back-office/establismentemployee/establismentemployee.component";
import {FoodDisplayerComponent} from "./components/front-office/food-displayer/food-displayer.component";
import {DishesComponent} from "./components/back-office/dishes/dishes.component";
import {SupplierComponent} from "./components/back-office/supplier/supplier.component";
import {LoginComponent} from "./components/login/login.component";
import {adminGuardGuard, clientGuardGuard, loginGuard} from "./security-components/client-guard.guard";
import {DishetypeComponent} from "./components/back-office/dishetype/dishetype.component";
import { ErrorPageNotAuthorizedComponent } from './components/error-page-not-authorized/error-page-not-authorized.component';
import { CustomersmoneyComponent } from './components/back-office/customersmoney/customersmoney.component';
import { StockbyestablishmentComponent } from './components/back-office/stockbyestablishment/stockbyestablishment.component';
import { MovementtypeComponent } from './components/back-office/movementtype/movementtype.component';
import { MarkByDisheComponent } from './components/front-office/mark-by-dishe/mark-by-dishe.component';
import { RatingViewComponent } from './components/front-office/rating-view/rating-view.component';
import { ProfitsStatisticsComponent } from './components/back-office/profits-statistics/profits-statistics.component';
import { SupplierActivityStatisticsService } from './components/back-office/supplier-activity-statistics/supplier-activity-statistics.service';
import { SupplierActivityStatisticsComponent } from './components/back-office/supplier-activity-statistics/supplier-activity-statistics.component';


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
    {path:'profits-statistics',component:ProfitsStatisticsComponent,canActivate:[adminGuardGuard]},
    {path:'supplier-activity',component:SupplierActivityStatisticsComponent,canActivate:[adminGuardGuard]},
    {path:'foodDisplay/:id',component:FoodDisplayerComponent},
    {path:'errorPageNotAuthorized',component:ErrorPageNotAuthorizedComponent},
    {path:'ratingView',component:RatingViewComponent}
];
