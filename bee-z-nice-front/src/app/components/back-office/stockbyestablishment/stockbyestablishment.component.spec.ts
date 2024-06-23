import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StockbyestablishmentComponent } from './stockbyestablishment.component';

describe('StockbyestablishmentComponent', () => {
  let component: StockbyestablishmentComponent;
  let fixture: ComponentFixture<StockbyestablishmentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [StockbyestablishmentComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(StockbyestablishmentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
