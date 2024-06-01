import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NTdComponent } from './n-td.component';

describe('NTdComponent', () => {
  let component: NTdComponent;
  let fixture: ComponentFixture<NTdComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NTdComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(NTdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
