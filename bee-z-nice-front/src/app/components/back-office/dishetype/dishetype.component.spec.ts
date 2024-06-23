import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DishetypeComponent } from './dishetype.component';

describe('DishetypeComponent', () => {
  let component: DishetypeComponent;
  let fixture: ComponentFixture<DishetypeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DishetypeComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DishetypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
