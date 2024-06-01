import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NSelectComponent } from './n-select.component';

describe('NSelectComponent', () => {
  let component: NSelectComponent;
  let fixture: ComponentFixture<NSelectComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NSelectComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(NSelectComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
