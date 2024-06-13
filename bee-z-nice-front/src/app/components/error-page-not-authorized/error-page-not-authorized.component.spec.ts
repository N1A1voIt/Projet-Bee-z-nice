import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ErrorPageNotAuthorizedComponent } from './error-page-not-authorized.component';

describe('ErrorPageNotAuthorizedComponent', () => {
  let component: ErrorPageNotAuthorizedComponent;
  let fixture: ComponentFixture<ErrorPageNotAuthorizedComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ErrorPageNotAuthorizedComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ErrorPageNotAuthorizedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
