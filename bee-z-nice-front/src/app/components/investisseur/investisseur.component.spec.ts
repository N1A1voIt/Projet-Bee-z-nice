import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InvestisseurComponent } from './investisseur.component';

describe('InvestisseurComponent', () => {
  let component: InvestisseurComponent;
  let fixture: ComponentFixture<InvestisseurComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [InvestisseurComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(InvestisseurComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
