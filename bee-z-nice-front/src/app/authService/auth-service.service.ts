import { Injectable } from '@angular/core';
import {AppService} from "../app.service";

@Injectable({
  providedIn: 'root'
})
export class AuthServiceService {

  constructor(private appService:AppService) { }
  isLoggedIn():boolean{
    return localStorage.getItem("userToken")!=null;
  }
  // @ts-ignore
    isAdmin():boolean{
      if (this.isLoggedIn()){
        // @ts-ignore
          this.appService.retrieveMyProfile(localStorage.getItem("userToken")).subscribe({
            next:(response)=>{
                console.log('isAdmin:'+response.isAdmin)
                return response.isAdmin;
            },error:(error)=>{
                alert(error)
            }
        })
      }
      else{
          return false;
      }
  }
}
