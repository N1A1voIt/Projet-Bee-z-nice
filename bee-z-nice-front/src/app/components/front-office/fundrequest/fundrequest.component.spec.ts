import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FundrequestComponent } from './fundrequest.component';

describe('FundrequestComponent', () => {
  let component: FundrequestComponent;
  let fixture: ComponentFixture<FundrequestComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FundrequestComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(FundrequestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
