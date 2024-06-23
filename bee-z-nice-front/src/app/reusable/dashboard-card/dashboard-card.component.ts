import { CommonModule } from '@angular/common';
import { ChangeDetectionStrategy, Component, Input } from '@angular/core';
import { MatIcon } from '@angular/material/icon';

@Component({
    selector: 'app-dashboard-card',
    standalone: true,
    imports: [
        CommonModule,
        MatIcon
    ],
    templateUrl: './dashboard-card.component.html',
    styleUrl: './dashboard-card.component.css',
})
export class DashboardCardComponent { 
    @Input() icone!:string;
    @Input() money!:number;
    @Input() label!:string;
}
