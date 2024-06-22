import { Directive, Input } from '@angular/core';

@Directive({
  selector: '[baseChart]',
  standalone: true,
})
export class BaseChartDirective { 

  @Input('data') data: any;
  @Input('labels') labels!: string[];
  @Input('chartType') chartType!: string;

  constructor() {}
}


