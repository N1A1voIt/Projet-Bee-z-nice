import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AuthServiceService {

  constructor() { }
  isLoggedIn():boolean{
    return localStorage.getItem("userToken")!=null;
  }
}
