import { Injectable } from '@angular/core';
import {apiUrl} from "../../../environnements/env";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class DishesService {
 private apiUrl = apiUrl();
constructor(private http:HttpClient){}
saveData(formData:any):Observable<any> {
        return this.http.post(`${this.apiUrl}/dishes/save`,formData);    }
retrieveAll():Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/dishes/findAll`);    }
delete(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/dishes/delete/`+id);    }
getById(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/dishes/findById/`+id);    }
  getByIdType(id:any):Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/dishes/findByIdType/`+id);
  }
 retrieveDishetypeList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/dishetype/findAll`);
    }
 retrieveSupplierList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/supplier/findAll`);
    }

}
