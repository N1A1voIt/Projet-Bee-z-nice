import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { apiUrl } from '../../../../environnements/env';

@Injectable({
  providedIn: 'root'
})
export class HomeClientService {
  apiUrl:string = apiUrl();
  constructor(private http:HttpClient) { }
  getTop3(){
    return this.http.get<any>(`${this.apiUrl}/rating/top3`);
  }
}
