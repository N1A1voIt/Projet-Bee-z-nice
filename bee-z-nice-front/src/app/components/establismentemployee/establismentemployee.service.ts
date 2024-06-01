import { Injectable } from '@angular/core';
import {apiUrl} from "../../../environement/env";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class EstablismentemployeeService {
 private apiUrl = apiUrl();
constructor(private http:HttpClient){}
saveData(formData:any):Observable<any> {
    console.log(this.apiUrl)
        return this.http.post(`${this.apiUrl}/establismentemployee/save`,formData);    }
retrieveAll():Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/establismentemployee/findAll`);    }
delete(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/establismentemployee/delete/`+id);    }
getById(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/establismentemployee/findById/`+id);    }
 retrieveEstablishmentList():Observable<any>{
        return this.http.get<any>(`${this.apiUrl}/establishment/findAll`);
    }

}
