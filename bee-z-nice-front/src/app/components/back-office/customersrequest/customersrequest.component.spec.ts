import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomersrequestComponent } from './customersrequest.component';

describe('CustomersrequestComponent', () => {
  let component: CustomersrequestComponent;
  let fixture: ComponentFixture<CustomersrequestComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CustomersrequestComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CustomersrequestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
