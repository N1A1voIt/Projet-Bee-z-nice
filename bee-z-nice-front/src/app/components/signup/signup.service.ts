import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {apiUrl} from "../../../environnements/env";
import {FormBuilder, FormGroup} from "@angular/forms";

@Injectable({
  providedIn: 'root'
})
export class SignupService {
    private apiUrl=apiUrl();
    constructor(private httpClient:HttpClient,private fb:FormBuilder) { }
    register(form:any){
        const formValue: FormGroup = this.fb.group({
            firstName: form.value.firstName,
            name: form.value.name,
            mail: form.value.mail,
            password: form.value.password,
            isActive: true,
            uniqId: form.value.uniqId,
            idEstablishement:form.value.idEstablishement,
            isAdmin: false
        });

        return this.httpClient.post<any>(`${this.apiUrl}/register`,form.value);
    }
}
