import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { apiUrl } from '../../../../environnements/env';

@Injectable({
  providedIn: 'root'
})
export class RatingViewService {
    private apiUrl:string = apiUrl()
    constructor(private httpClient:HttpClient) { }
    findAll():Observable<any>{
      let token = localStorage.getItem("userToken");
      let headers;
      if (token != null){
          headers = new HttpHeaders({
              'Authorization' : token
          });
      }
      return this.httpClient.get<any>(`${this.apiUrl}/rating/findall`,{'headers':headers});
    }
    save(form:any):Observable<any>{
      let token = localStorage.getItem("userToken");
      let headers;
      if (token != null){
          headers = new HttpHeaders({
              'Authorization' : token,
              'Content-Type': 'application/json'
          });
      }
      console.log(form)
      return this.httpClient.post<any>(`${this.apiUrl}/rating/save`,form,{'headers':headers})
    }
    update(form:any):Observable<any>{
      let token = localStorage.getItem("userToken");
      let headers;
      if (token != null){
          headers = new HttpHeaders({
              'Authorization' : token,
              'Content-Type': 'application/json'
          });
      }
      return this.httpClient.post<any>(`${this.apiUrl}/rating/update`,form,{'headers':headers})
    }
    // saveUpdate() {}
}
