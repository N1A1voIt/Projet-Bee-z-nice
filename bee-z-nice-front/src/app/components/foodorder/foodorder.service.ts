import { Injectable } from '@angular/core';
import {apiUrl} from "../../../environnements/env";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class FoodorderService {
 private apiUrl = apiUrl();
constructor(private http:HttpClient){}
saveData(formData:any):Observable<any> {
        return this.http.post(`${this.apiUrl}/foodorder/save`,formData);    }
retrieveAll():Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/foodorder/findAll`);    }
delete(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/foodorder/delete/`+id);    }
getById(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/foodorder/findById/`+id);    }
 retrieveAddtocartList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/addtocart/findAll`);
    }
 retrieveDishesList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/dishes/findAll`);
    }
 retrieveCustomersList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/customers/findAll`);
    }
 retrieveModeofpaymentList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/modeofpayment/findAll`);
    }

}