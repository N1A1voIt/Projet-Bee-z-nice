import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FoodorderComponent } from './foodorder.component';

describe('FoodorderComponent', () => {
  let component: FoodorderComponent;
  let fixture: ComponentFixture<FoodorderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FoodorderComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(FoodorderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
