import { Injectable } from '@angular/core';
import {apiUrl} from "../../../../environnements/env";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class MovementtypeService {
 private apiUrl = apiUrl();
constructor(private http:HttpClient){}
saveData(formData:any):Observable<any> {
        return this.http.post(`${this.apiUrl}/movementtype/save`,formData);    }
retrieveAll():Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/movementtype/findAll`);    }
delete(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/movementtype/delete/`+id);    }
getById(id:number):Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/movementtype/findById/`+id);    }

}