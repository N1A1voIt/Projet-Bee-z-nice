import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardLiComponent } from './dashboard-li.component';

describe('DashboardLiComponent', () => {
  let component: DashboardLiComponent;
  let fixture: ComponentFixture<DashboardLiComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DashboardLiComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DashboardLiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
