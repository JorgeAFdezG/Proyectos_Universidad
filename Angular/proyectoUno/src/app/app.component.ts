import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ComponentUnoComponent } from "./component-uno/component-uno.component";

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, ComponentUnoComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'Hola mundo desde angular';
}
