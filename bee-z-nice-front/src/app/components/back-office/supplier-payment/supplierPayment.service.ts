import { Injectable } from '@angular/core';
import {apiUrl} from "../../../../environnements/env";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
@Injectable({
    providedIn: 'root'
})
export class SupplierPaymentService {
    private apiUrl = apiUrl();
    constructor(private http:HttpClient){}
    saveData(number:any):Observable<any> {
        return this.http.post(`${this.apiUrl}/supplierPayment/save`,number);    }
    retrieveAllUnPayed():Observable<any> {
        return this.http.get<any>(`${this.apiUrl}/supplierPayment/findAll`);    }

}
