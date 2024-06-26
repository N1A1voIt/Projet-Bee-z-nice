import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomersqueryComponent } from './customersquery.component';

describe('CustomersqueryComponent', () => {
  let component: CustomersqueryComponent;
  let fixture: ComponentFixture<CustomersqueryComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CustomersqueryComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CustomersqueryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
