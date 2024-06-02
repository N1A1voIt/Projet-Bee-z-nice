import { Component } from '@angular/core';
import {AuthentificationComponent} from "../../reusable/authentification/authentification.component";
import {NgIf} from "@angular/common";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {NInputComponent} from "../../reusable/n-input/n-input.component";
import {SubmitButtonComponent} from "../../reusable/submit-button/submit-button.component";
import {LoginService} from "./login.service";
import {AppComponent} from "../../app.component";
import {Router} from "@angular/router";

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [
    AuthentificationComponent,
    NgIf,
    FormsModule,
    NInputComponent,
    ReactiveFormsModule,
    SubmitButtonComponent
  ],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  exception:any = null;
  constructor(private loginService:LoginService,private appComponent:AppComponent,private router:Router) {
  }
  onSubmit(form:any){
    this.loginService.login(form.value).subscribe({
      next:(response)=>{
        this.appComponent.isAdmin=response.isAdmin;
        this.appComponent.isLoggedIn = true;
        this.redirect();
      },error:(error)=>{
        this.exception = error
      }
    })
  }
  redirect(){
    if (this.appComponent.isAdmin){
      this.router.navigateByUrl('/home')
    }else {
      this.router.navigateByUrl('/client')
    }
  }
}
