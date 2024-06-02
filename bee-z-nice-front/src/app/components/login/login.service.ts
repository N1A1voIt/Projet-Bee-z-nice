import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {apiUrl} from "../../../environnements/env";

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  apiUrl:string = apiUrl();
  constructor(private http:HttpClient) { }
  login(formData:any):Observable<any>{
    return this.http.post(`${this.apiUrl}/login`,formData);
  }
}
