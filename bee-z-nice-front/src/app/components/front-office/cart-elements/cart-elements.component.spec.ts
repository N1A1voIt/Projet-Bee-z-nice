import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CartElementsComponent } from './cart-elements.component';

describe('CartElementsComponent', () => {
  let component: CartElementsComponent;
  let fixture: ComponentFixture<CartElementsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CartElementsComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CartElementsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
