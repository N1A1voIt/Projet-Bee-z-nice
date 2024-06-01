import { Injectable } from '@angular/core';
import {apiUrl} from "../../../environement/env";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class EstablishmentService {
 private apiUrl = apiUrl();
constructor(private http:HttpClient){}
saveData(formData:any):Observable<any> {
    console.log(this.apiUrl)
        return this.http.post(`${this.apiUrl}/establishment/save`,formData);
}
retrieveAll():Observable<any> {
        return this.http.get<any>(`http://localhost:8080/api/establishment/findAll`);    }
delete(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/establishment/delete/`+id);    }
getById(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/establishment/findById/`+id);    }

}
