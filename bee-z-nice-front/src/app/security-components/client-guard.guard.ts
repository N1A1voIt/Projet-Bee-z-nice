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
export const adminGuardGuard: CanActivateFn = async (route, state) => {
    const authService = inject(AuthServiceService);
    const router = inject(Router);
    let isAdmin = await authService.isAdmin()
    console.log("ADMIN BE:" + isAdmin)
    if (isAdmin) {
        console.log("Admin authentification")
        return true;
    }
    return router.parseUrl('/register');
};
