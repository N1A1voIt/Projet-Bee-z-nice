import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EstablismentemployeeComponent } from './establismentemployee.component';

describe('EstablismentemployeeComponent', () => {
  let component: EstablismentemployeeComponent;
  let fixture: ComponentFixture<EstablismentemployeeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EstablismentemployeeComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(EstablismentemployeeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
