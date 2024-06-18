import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MarkByDisheComponent } from './mark-by-dishe.component';

describe('MarkByDisheComponent', () => {
  let component: MarkByDisheComponent;
  let fixture: ComponentFixture<MarkByDisheComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MarkByDisheComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(MarkByDisheComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
