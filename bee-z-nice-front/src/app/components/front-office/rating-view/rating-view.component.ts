import { CommonModule } from '@angular/common';
import { ChangeDetectionStrategy, Component } from '@angular/core';
import { MarkByDisheComponent } from '../mark-by-dishe/mark-by-dishe.component';

@Component({
    selector: 'app-rating-view',
    standalone: true,
    imports: [
        CommonModule,
        MarkByDisheComponent
    ],
    template: `<p>rating-view works!</p>`,
    styleUrl: './rating-view.component.css',
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class RatingViewComponent { }
