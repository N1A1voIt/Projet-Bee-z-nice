import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { throwError } from 'rxjs';
import { apiUrl } from '../../../../environnements/env';

@Injectable({
  providedIn: 'root'
})
export class CartElementsService {


  constructor(private http:HttpClient) {}
  addToCart(form:any){
      console.log(localStorage.getItem("userToken"))
      let token:string|null = localStorage.getItem("userToken");
      if (token==null){
          console.log("Error");
          return throwError("Session expirée") ;
      }
      const headers = new HttpHeaders({
          'Authorization':token
      });
      console.log(form);
      console.log(headers)
      return this.http.post<any>( apiUrl()+"/cart/addToCart",form,{'headers':headers});
  }
  removeToCart(form:any){
    console.log(localStorage.getItem("userToken"))
    let token:string|null = localStorage.getItem("userToken");
    if (token==null){
        console.log("Error");
        return throwError("Session expirée") ;
    }
    const headers = new HttpHeaders({
        'Authorization':token
    });
    console.log(form);
    console.log(headers)
    return this.http.post<any>( apiUrl()+"/cart/removeToCart",form,{'headers':headers});
}
}
