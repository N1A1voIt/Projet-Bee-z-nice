import { Component, Input } from '@angular/core';
import { foodsRoute } from '../../../../environnements/env';
import { MatIcon } from '@angular/material/icon';

@Component({
  selector: 'app-top3-card',
  standalone: true,
  imports: [MatIcon],
  templateUrl: './top3-card.component.html',
  styleUrl: './top3-card.component.css'
})
export class Top3CardComponent {
  @Input() dishe:any;
  foodsRoute = foodsRoute();

}
