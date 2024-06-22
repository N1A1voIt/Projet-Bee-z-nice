import { Component, inject } from '@angular/core';
import {AuthentificationComponent} from "../../reusable/authentification/authentification.component";
import {NgIf} from "@angular/common";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {NInputComponent} from "../../reusable/n-input/n-input.component";
import {SubmitButtonComponent} from "../../reusable/submit-button/submit-button.component";
import {LoginService} from "./login.service";
import {AppComponent} from "../../app.component";
import {Router} from "@angular/router";
import { AuthServiceService } from '../../authService/auth-service.service';

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
  constructor(private loginService:LoginService,private appComponent:AppComponent,private authService: AuthServiceService,private router:Router) {
  }
  onSubmit(form:any){
    this.loginService.login(form.value).subscribe({
      next:(response)=>{
        localStorage.setItem("userToken",response.headers.get("Authorization"));
        this.redirect();
      },error:(error)=>{
        this.exception = error
      }
    })
  }
  async redirect(){
    this.appComponent.checkToken();
    let isAdmin = await this.authService.isAdmin()
    if (isAdmin){
        this.router.navigateByUrl('/home');
    }if (!isAdmin){
        this.router.navigateByUrl('/client');
    }
  }
}
