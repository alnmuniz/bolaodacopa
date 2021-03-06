import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { DadosLoginInterface, DadosApostaInterface, DadosAtualizarApostaInterface, DadosEnviarMensagemInterface, DadosAlterarSenhaInterface, DadosRecuperarSenhaInterface } from './interfaces';



@Injectable()
export class BackendService {

    urlBase = 'http://bolaodacopa2018.online/api/';
    
    regras : Array<{titulo: string, conteudoHtml: string}>;
    
    constructor (private http: HttpClient){}

    public obterRanking() {        

        let rankingPrincipalUrl = this.urlBase + 'rankingPrincipal.asp';
        
        return this.http.get(rankingPrincipalUrl);
    }

    public obterJogos() {

        let jogosUrl = this.urlBase + 'jogos.asp';
        
        return this.http.get(jogosUrl);

    }

    public obterMensagens(pagina : number) {

        let mensagensUrl = this.urlBase + 'mensagens.asp?pagina=' + pagina;
        
        return this.http.get(mensagensUrl);

    }

    public fazerLogin(dadosLogin:DadosLoginInterface){

        let loginUrl = this.urlBase + 'login.asp';

        return this.http.post(loginUrl,dadosLogin);
        
    }

    public obterRegras() : Array<any> {

        this.regras = [];

        //ToDo - buscar do backend as regras
        this.regras.push({titulo:"REGRAS DO BOLAO",conteudoHtml:"<div align=\"left\">\r\n\r\n        <p>O Bol\u00E3o On-line 2018 \u00E9 composto por todos os jogos \r\n\r\n             da Copa do Mundo. <\/p>\r\n\r\n        <p>O objetivo do bol\u00E3o \u00E9 meramente promover uma brincadeira entre amigos, assim a arrecada\u00E7\u00E3o, subtra\u00EDda apenas do custo da hospedagem de R$ 56,00, ser\u00E1 distribu\u00EDda entre os vencedores.<\/p>\r\n\r\n        <p>O valor da participa\u00E7\u00E3o \u00E9 de R$ 20,00.<\/p>\r\n\r\n        <p>O participante receber&aacute; um nome de apostador e sua senha. Com\r\n\r\n          estes dados ele poder&aacute; cadastrar suas apostas por meio\r\n\r\n          do link existente na p&aacute;gina principal do bol&atilde;o.<\/p>\r\n\r\n        <p>Os placares poder&atilde;o ser inclu&iacute;dos e alterados at&eacute; meia noite do dia anterior de cada jogo. Se o apostador n&atilde;o\r\n\r\n          incluir o placar, ele n&atilde;o pontuar\u00E1 nesta partida, mas concorrer\u00E1 normalmente nas demais. <\/p>\r\n\r\n        <p> Apenas no dia do jogo \u00E9 que os placares apostados pelos participantes estar\u00E3o dispon\u00EDveis para consulta. <\/p>\r\n\r\n\t<p>O Bol&atilde;o ter&aacute; no m\u00EDnimo cinco ganhadores no ranking principal. Se houver empate entre apostadores ganhadores, eles dividir\u00E3o o pr\u00EAmio das posi\u00E7\u00F5es ocupadas de forma acumulada. Por exemplo, se duas pessoas empatarem em primeiro lugar, dividir\u00E3o o primeiro e segundo pr\u00EAmios.\r\n\r\n          <br><br>\r\n\r\n\t  Neste bol\u00E3o ter\u00E1 uma novidade (pr\u00EAmio extra): O apostador que tiver a maior quantidade de acertos de placares dos jogos receber\u00E1 5% do arrecadado*<br>\r\n\r\n          &nbsp;&nbsp;&nbsp;&nbsp;Em suma, assim ser\u00E1 a divis\u00E3o da premia\u00E7\u00E3o deste bol\u00E3o:\r\n\r\n          <br><br>\r\n\r\n          - 1\u00BA lugar                               : 50% do arrecadado* <br>\r\n\r\n          - 2\u00BA lugar                               : 25% do arrecadado* <br>\r\n\r\n          - 3\u00BA lugar                               : 10% do arrecadado* <br>\r\n\r\n          - 4\u00BA lugar                               : 06% do arrecadado* <br>\r\n\r\n          - 5\u00BA lugar                               : 04% do arrecadado* <br>\r\n\r\n          - Maior quantidade de acertos de placares: 5% do arrecadado <br><br>\r\n\r\n\t  * Para efeitos de premia\u00E7\u00E3o, a arrecada\u00E7\u00E3o ser\u00E1 subtra\u00EDda do custo de hospedagem, conforme j\u00E1 esclarecido acima.<br>\t\r\n\r\n        <p>  \r\n\r\n      <\/div>"});
        this.regras.push({titulo:"PONTUACAO",conteudoHtml:"<table width=\"98%\" border=\"1\" cellspacing=\"2\" cellpadding=\"2\" align=\"center\">\r\n  <tr>\r\n\r\n    <td colspan=\"2\">\r\n\r\n      <div align=\"left\">        <p>O quadro de pontua&ccedil;&atilde;o de cada jogo &eacute; o seguinte, considerando para tal somente o placar do tempo normal de jogo, sem prorroga\u00E7\u00F5es ou p\u00EAnaltis:<\/p>\r\n\r\n<\/div>\r\n\r\n    <\/td>\r\n\r\n  <\/tr>\r\n\r\n  <tr>\r\n\r\n    <td><div align=\"center\"> 10 <\/div><\/td>\r\n\r\n    <td>\r\n\r\n      <div align=\"left\">Acertou o placar do jogo<\/div>\r\n\r\n    <\/td>\r\n\r\n  <\/tr>\r\n\r\n  <tr>\r\n\r\n    <td><div align=\"center\"> 5 <\/div><\/td>\r\n\r\n    <td>\r\n\r\n      <div align=\"left\">Errou o placar, mas acertou quem venceu o jogo e o escore do vencedor<\/div>\r\n\r\n    <\/td>\r\n\r\n  <\/tr>\r\n\r\n  <tr>\r\n\r\n    <td><div align=\"center\"> 4 <\/div><\/td>\r\n\r\n    <td>\r\n\r\n      <div align=\"left\">Errou o placar, mas acertou quem venceu o jogo e o escore do perdedor<\/div>\r\n\r\n    <\/td>\r\n\r\n  <\/tr>\r\n\r\n  <tr>\r\n\r\n    <td><div align=\"center\"> 4 <\/div><\/td>\r\n\r\n    <td>\r\n\r\n      <div align=\"left\">Acertou o empate, mas errou o placar<\/div>\r\n\r\n    <\/td>\r\n\r\n  <\/tr>\r\n\r\n  <tr>\r\n\r\n    <td><div align=\"center\"> 3 <\/div><\/td>\r\n\r\n    <td>\r\n\r\n      <div align=\"left\">Errou os placares do vencedor e do perdedor, mas acertou quem venceu<\/div>\r\n\r\n    <\/td>\r\n\r\n  <\/tr>\r\n\r\n  <tr>\r\n\r\n    <td><div align=\"center\"> 1 <\/div><\/td>\r\n\r\n    <td>\r\n\r\n      <div align=\"left\">Acertou o placar invertido<\/div>\r\n\r\n    <\/td>\r\n\r\n  <\/tr>\r\n\r\n<\/table>"});
        this.regras.push({titulo:"PONTUACAO PONDERADA",conteudoHtml:"<table width=\"98%\" border=\"0\" cellspacing=\"2\" cellpadding=\"2\" align=\"center\">\r\n  <tr>\r\n\r\n    <td><div align=\"left\"> - Multiplicada por 2 | Jogos 49 a 60 (OITAVAS E QUARTAS DE FINAIS)<\/div>\r\n\r\n    <\/td>\r\n\r\n  <\/tr>\r\n\r\n  <tr>\r\n\r\n    <td><div align=\"left\"> - Multiplicada por 3 | Jogos 61 a 63 (SEMI-FINAIS e DISPUTA DE 3\u00BA LUGAR)<\/div>\r\n\r\n    <\/td>\r\n\r\n  <\/tr>\r\n\r\n  <tr>\r\n\r\n    <td><div align=\"left\"> - Multiplicada por 4 | Jogo 64 (GRANDE FINAL DA COPA DO MUNDO 2018)<\/div>\r\n\r\n    <\/td>\r\n\r\n  <\/tr>\r\n\r\n<\/table>"});
        //
        return (this.regras);

    }    

    public obterApostasUsuario(dados:DadosApostaInterface) {

        let consultaApostasUrl = this.urlBase + 'consultaApostas.asp';

        return this.http.post(consultaApostasUrl,dados);
    }

    public atualizarApostaUsuario(dados:DadosAtualizarApostaInterface){
        let atualizaApostaUrl = this.urlBase+'atualizaAposta.asp';

        return this.http.post(atualizaApostaUrl,dados);
    }

    public enviarMensagem(dados:DadosEnviarMensagemInterface){
        let enviaMensagemUrl = this.urlBase+'enviaMensagem.asp';

        return this.http.post(enviaMensagemUrl,dados);
    }

    public alterarSenha(dados:DadosAlterarSenhaInterface){
        let  alteraSenhaUrl = this.urlBase+"alteraSenha.asp";
        return this.http.post(alteraSenhaUrl,dados);
    }

    public recuperarSenha(dados:DadosRecuperarSenhaInterface){
        let  recuperaSenhaUrl = this.urlBase+"recuperaSenha.asp";
        return this.http.post(recuperaSenhaUrl,dados);
    }

}