import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NLiComponent } from './n-li.component';

describe('NLiComponent', () => {
  let component: NLiComponent;
  let fixture: ComponentFixture<NLiComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NLiComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(NLiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
