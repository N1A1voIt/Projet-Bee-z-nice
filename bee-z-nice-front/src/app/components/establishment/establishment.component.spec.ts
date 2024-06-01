import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EstablishmentComponent } from './establishment.component';

describe('EstablishmentComponent', () => {
  let component: EstablishmentComponent;
  let fixture: ComponentFixture<EstablishmentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EstablishmentComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(EstablishmentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
