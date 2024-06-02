import {Component, Input} from '@angular/core';

@Component({
  selector: 'app-card-menu',
  standalone: true,
  imports: [],
  templateUrl: './card-menu.component.html',
  styleUrl: './card-menu.component.css'
})
export class CardMenuComponent {
  @Input() imgPath!:string;
  @Input() imgTitle!:string;
  @Input() link!:string;
}
