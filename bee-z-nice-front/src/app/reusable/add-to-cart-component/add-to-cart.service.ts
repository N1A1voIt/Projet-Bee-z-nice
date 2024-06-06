import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class AddToCartService {

  constructor(private http:HttpClient) {}
    addToCart(form:any){
      console.log(localStorage.getItem("userToken"))
        let token = localStorage.getItem("userToken");
        if (token==null){
            return "There is no User logged in";
        }
        const headers = new HttpHeaders({
            'Authorization':token
        });
      return this.http.post<any>("/api/cart/addToCart",form.value);
    }
}
