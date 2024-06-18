import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomersmoneyComponent } from './customersmoney.component';

describe('CustomersmoneyComponent', () => {
  let component: CustomersmoneyComponent;
  let fixture: ComponentFixture<CustomersmoneyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CustomersmoneyComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CustomersmoneyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
