import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {apiUrl} from "../../../../environnements/env";

@Injectable({
  providedIn: 'root'
})
export class CartService {

  constructor(private http:HttpClient) { }
    retrieveCart(){
      let token = localStorage.getItem("userToken");
      let headers;
      if (token != null){
          headers = new HttpHeaders({
              'Authorization' : token
          });
      }
      return this.http.get<any>(`${apiUrl()}/cart/pendingRequest`,{'headers':headers});
    }
    saveCart(form:any){
      let token = localStorage.getItem("userToken");
      let headers;
      if (token != null){
          headers = new HttpHeaders({
              'Authorization' : token
          });
      }
      return this.http.post<any>(`${apiUrl()}/saveCart`,form,{'headers':headers});
    }
    getSolde(form:any){
      let token = localStorage.getItem("userToken");
      let headers;
      if (token != null){
          headers = new HttpHeaders({
              'Authorization' : token
          });
      }
      return this.http.post<any>(`${apiUrl()}/customersmoney/getpay`,form,{'headers':headers});
    }
}
