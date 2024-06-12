import {CanActivateFn, Router} from '@angular/router';
import {inject} from "@angular/core";
import {AuthServiceService} from "../authService/auth-service.service";

export const clientGuardGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthServiceService);
  const router = inject(Router);
  if (authService.isLoggedIn()) {
    return true;
  }
  return router.parseUrl('/register');
};
export const adminGuardGuard: CanActivateFn = (route, state) => {
    const authService = inject(AuthServiceService);
    const router = inject(Router);
    if (authService.isAdmin()) {
        console.log("Admin authentification")
        return true;
    }
    return router.parseUrl('/register');
    // return true;
};
