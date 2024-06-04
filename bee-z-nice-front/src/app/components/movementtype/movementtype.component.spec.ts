import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MovementtypeComponent } from './movementtype.component';

describe('MovementtypeComponent', () => {
  let component: MovementtypeComponent;
  let fixture: ComponentFixture<MovementtypeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MovementtypeComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(MovementtypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
