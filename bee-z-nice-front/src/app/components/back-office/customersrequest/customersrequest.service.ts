import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { apiUrl } from '../../../../environnements/env';

@Injectable({
  providedIn: 'root'
})
export class CustomersrequestService {
  apiUrl:string = apiUrl();
  constructor(private http:HttpClient) { }
  getPendingRequest(form:any){
    return this.http.post<any>(`${this.apiUrl}/customersquery/findPendingRequest`,form);
  }
  sendValidation(form:any){
    return this.http.post<any>(`${this.apiUrl}/customersquery/validate`,form)
  }
}
