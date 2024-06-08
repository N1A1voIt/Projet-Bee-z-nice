import { Injectable } from '@angular/core';
import {AppService} from "../app.service";
import {async} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class AuthServiceService {

  constructor(private appService:AppService) { }
  isLoggedIn():boolean{
    return localStorage.getItem("userToken")!=null;
  }
  // @ts-ignore
    async isAdmin(){
      let isAdmin = false
      if (this.isLoggedIn()){
          // @ts-ignore
          const response = await this.appService.retrieveMyProfile(localStorage.getItem("userToken")).toPromise();
          console.log("AZOOVUGEUEUGJ")
          isAdmin = response.isAdmin;
      }
      return isAdmin;
  }
}
