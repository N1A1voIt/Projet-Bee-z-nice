import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddToCartComponentComponent } from './add-to-cart-component.component';

describe('AddToCartComponentComponent', () => {
  let component: AddToCartComponentComponent;
  let fixture: ComponentFixture<AddToCartComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AddToCartComponentComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(AddToCartComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
