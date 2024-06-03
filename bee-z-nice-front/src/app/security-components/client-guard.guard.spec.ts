import { TestBed } from '@angular/core/testing';
import { CanActivateFn } from '@angular/router';

import { clientGuardGuard } from './client-guard.guard';

describe('clientGuardGuard', () => {
  const executeGuard: CanActivateFn = (...guardParameters) => 
      TestBed.runInInjectionContext(() => clientGuardGuard(...guardParameters));

  beforeEach(() => {
    TestBed.configureTestingModule({});
  });

  it('should be created', () => {
    expect(executeGuard).toBeTruthy();
  });
});
