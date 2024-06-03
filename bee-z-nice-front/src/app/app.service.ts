import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {apiUrl} from "../environnements/env";

@Injectable({
  providedIn: 'root'
})
export class AppService {
  apiUrl:string = apiUrl();
  constructor(private http:HttpClient) { }
  checkSession():Observable<any>{
    return this.http.get<any>(`${this.apiUrl}/checkSession`);
  }
}
