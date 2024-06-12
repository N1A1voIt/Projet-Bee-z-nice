import { Injectable } from '@angular/core';
import {apiUrl} from "../../../environnements/env";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class AddtocartService {
 private apiUrl = apiUrl();
constructor(private http:HttpClient){}
saveData(formData:any):Observable<any> {
        return this.http.post(`${this.apiUrl}/addtocart/save`,formData);    }
retrieveAll():Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/addtocart/findAll`);    }
delete(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/addtocart/delete/`+id);    
}
getById(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/addtocart/findById/`+id);    }
 retrieveDishesList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/dishes/findAll`);
    }
 retrieveCustomersList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/customers/findAll`);
    }

}