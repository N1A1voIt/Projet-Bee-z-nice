import { Component, Input } from '@angular/core';

@Component({
    selector: 'app-n-li',
    standalone: true,
    imports: [],
    templateUrl: './n-li.component.html',
    styleUrl: './n-li.component.css',
})
export class NLiComponent {
    @Input() link: string = '';
    @Input() label: string = '';
}
