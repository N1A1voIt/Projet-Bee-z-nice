import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { apiUrl } from '../../../../environnements/env';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProfitsStatisticsService {
  apiUrl:string = apiUrl();
  constructor(private http:HttpClient) { }
  profits(form:any):Observable<any>{
    return this.http.post<any>(`${this.apiUrl}/profits/benefits`,form);
  }
}
