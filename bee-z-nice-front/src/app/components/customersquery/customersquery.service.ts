import { Injectable } from '@angular/core';
import {apiUrl} from "../../../environnements/env";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class CustomersqueryService {
 private apiUrl = apiUrl();
constructor(private http:HttpClient){}
saveData(formData:any):Observable<any> {
        return this.http.post(`${this.apiUrl}/customersquery/save`,formData);    }
retrieveAll():Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/customersquery/findAll`);    }
delete(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/customersquery/delete/`+id);    }
getById(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/customersquery/findById/`+id);    }
 retrieveEstablismentemployeeList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/establismentemployee/findAll`);
    }

}