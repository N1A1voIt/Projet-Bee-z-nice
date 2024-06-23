import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { apiUrl } from '../../../../environnements/env';

@Injectable({
  providedIn: 'root'
})
export class SupplierActivityStatisticsService {
  apiUrl:string = apiUrl();
  constructor(private http:HttpClient) { }
  activity(form:any):Observable<any>{
    return this.http.post<any>(`${this.apiUrl}/supplierdishsales/activityByDate`,form);
  }
}
