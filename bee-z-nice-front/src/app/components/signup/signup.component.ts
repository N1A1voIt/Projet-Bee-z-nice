import {Component, OnInit} from '@angular/core';
import {NInputComponent} from "../../reusable/n-input/n-input.component";
import {FormsModule} from "@angular/forms";
import {NSelectComponent} from "../../reusable/n-select/n-select.component";
import {SubmitButtonComponent} from "../../reusable/submit-button/submit-button.component";
import {AuthentificationComponent} from "../../reusable/authentification/authentification.component";
import {SignupService} from "./signup.service";
import {EstablishmentService} from "../establishment/establishment.service";
import {Router} from "@angular/router";
import {AppComponent} from "../../app.component";
import {NgFor, NgForOf, NgIf} from "@angular/common";
// import {error} from "@angular/compiler-cli/src/transformers/util";

@Component({
  selector: 'app-login',
  standalone: true,
    imports: [
        NInputComponent,
        FormsModule,
        NSelectComponent,
        SubmitButtonComponent,
        AuthentificationComponent,
        NgFor,
        NgIf
    ],
  templateUrl: './signup.component.html',
  styleUrl: './signup.component.css'
})
export class SignupComponent implements OnInit{
    exception:any = null;
    establishments:any;
    private isLoggedIn:boolean = false;
    private isAdmin:boolean = false;
    constructor(private signupService:SignupService,private establishmentService:EstablishmentService,private router:Router,private appComponent:AppComponent) {
    }
    ngOnInit(): void {
        this.retrieveEstablishment();
    }
    onSubmit(form:any){
        this.exception = null;
        this.signupService.register(form).subscribe({
            next:(response)=>{
                this.isLoggedIn = true;
                this.isAdmin = response.isAdmin;
                this.appComponent.isAdmin=this.isAdmin;
                this.appComponent.isLoggedIn = this.isLoggedIn;
            },
            error:(error)=>{
                this.exception = error;
            }
        })
    }
    redirect(){
        if (this.isAdmin){
            this.router.navigateByUrl('/home')
        }else {
            this.router.navigateByUrl('/client')
        }
    }
    retrieveEstablishment(){
        return this.establishmentService.retrieveAll().subscribe(
            {
                next:(data)=>{
                    this.establishments=data;
                },
                error:(error) => {
                    alert(error)
                    console.error(error)
                }
            }
        )
    }

    // protected readonly NgFor = NgFor;
    // protected readonly error = error;
}
