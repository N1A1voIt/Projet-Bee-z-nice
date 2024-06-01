import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NTableComponent } from './n-table.component';

describe('NTableComponent', () => {
  let component: NTableComponent;
  let fixture: ComponentFixture<NTableComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NTableComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(NTableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
