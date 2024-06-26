import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Top3CardComponent } from './top3-card.component';

describe('Top3CardComponent', () => {
  let component: Top3CardComponent;
  let fixture: ComponentFixture<Top3CardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Top3CardComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(Top3CardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
