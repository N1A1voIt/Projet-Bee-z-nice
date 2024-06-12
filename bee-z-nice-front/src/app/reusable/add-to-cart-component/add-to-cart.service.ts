import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {Observable, throwError} from "rxjs";
import {apiUrl} from "../../../environnements/env";

@Injectable({
  providedIn: 'root'
})
export class AddToCartService {

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
        console.log(form.value.id);
        console.log(headers)
      return this.http.post<any>( apiUrl()+"/cart/addToCart",form.value,{'headers':headers});
    }
}
