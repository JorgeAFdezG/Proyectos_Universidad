import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComponentUnoComponent } from './component-uno.component';

describe('ComponentUnoComponent', () => {
  let component: ComponentUnoComponent;
  let fixture: ComponentFixture<ComponentUnoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ComponentUnoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ComponentUnoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
