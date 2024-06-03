import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FoodDisplayerComponent } from './food-displayer.component';

describe('FoodDisplayerComponent', () => {
  let component: FoodDisplayerComponent;
  let fixture: ComponentFixture<FoodDisplayerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FoodDisplayerComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(FoodDisplayerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
