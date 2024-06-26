import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { apiUrl } from '../../../../environnements/env';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class FundrequestService {
  apiUrl:string = apiUrl()
  constructor(private http:HttpClient) { }
  sendRequest(form:any):Observable<any>{
    return this.http.post<any>(`${this.apiUrl}/customersquery/save`,form);
  }
}
