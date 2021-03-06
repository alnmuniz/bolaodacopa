import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { BackendService } from '../../service/backend-service';

@Component({
  selector: 'page-regras',
  templateUrl: 'regras.html'
})
export class RegrasPage {

    regras : Array<{titulo: string, conteudoHtml: string}>;

  constructor(public navCtrl: NavController, backend: BackendService) {

    this.regras = backend.obterRegras();

    
  }

}
