import { Directive, ElementRef, Renderer2 } from '@angular/core';

@Directive({
  selector: '[appWfull]',
  standalone: true,
})
export class WfullDirective {
  constructor(private el: ElementRef, private renderer: Renderer2) { }

  ngAfterViewInit(): void {
    this.renderer.addClass(this.el.nativeElement, 'w-full');
  }
}
