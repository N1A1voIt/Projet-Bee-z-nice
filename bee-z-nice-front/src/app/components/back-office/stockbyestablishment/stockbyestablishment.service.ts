import { Injectable } from '@angular/core';
import {apiUrl} from "../../../../environnements/env";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class StockbyestablishmentService {
 private apiUrl = apiUrl();
constructor(private http:HttpClient){}
saveData(formData:any):Observable<any> {
        return this.http.post(`${this.apiUrl}/stockbyestablishment/save`,formData);    }
retrieveAll():Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/stockbyestablishment/findAll`);    }
delete(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/stockbyestablishment/delete/`+id);    }
getById(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/stockbyestablishment/findById/`+id);    }
 retrieveMovementtypeList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/movementtype/findAll`);
    }
 retrieveDishesList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/dishes/findAll`);
    }
 retrieveEstablishmentList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/establishment/findAll`);
    }

}