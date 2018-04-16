<%

   FusoHorario = 4
   FormatoData = "Americano"
   TituloPagina = "Bol�o da Copa do Mundo 2018"
   DataInicioCopa = "14/06/2018"


   if FormatoData = "Americano" then
     DataInicioCopaFormatado = Mid(DataInicioCopa,4,2) & "/" & left(DataInicioCopa,2) & "/" & mid(DataInicioCopa,7,4)
   else
     DataInicioCopaFormatado = DataInicioCopa
   end if



    'Abrindo Conex�o mySQL - Forma usada em 2010
'         ConnStrMySQL  = "Driver={MySQL ODBC 3.51 Driver};Server=localhost;Database=bolaodacopa2013;uid=bolaodacopa;pwd=Brasil;option=3"


    'Abrindo Conex�o mySQL - Forma usada em 2013
'         ConnStrMySQL  = "Driver={MySQL ODBC 3.51 Driver};Server=mysql.bolaodacopa.unositehospedagem.com.br;Database=bolaodacopa;uid=bolaodacopa;pwd=vasco97;option=3"


    'Abrindo Conex�o mySQL - Forma usada em 2018
         ConnStrMySQL  = "Driver={MySQL ODBC 3.51 Driver};Server=50.62.209.75;Database=bolaodacopa2018;uid=bolaodacopa;pwd=Brasil2018;option=3"


%>




<html>
<head>
<title><%=TituloPagina%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Comuns/styles.css" type="text/css">
</head>

<body bgcolor="#FFFFFF" text="#000000">


<table width="80%" align="center">
<tr> 
<%
     if DateAdd("h", FusoHorario, now) >= DateAdd("d",-1,DataInicioCopaFormatado) then

%>

<td width="30%" aling="lef"><center><img src="Imagens/logo_copa.jpg" width="80" height="80"></center></td>

<%   else %>


<td width="15%" aling="lef"><center><a href="cadastro/precadastro.asp"><img src="Imagens/preinscricao.gif" width="80" height="50"></a></center></td>
<td width="15%" aling="lef"><center><img src="Imagens/logo_copa.jpg" width="80" height="80"></center></td>

<% end if %>


<td width="40%" aling="center"><center><img src="Imagens/logo.jpg" width="328" height="80"></center></td>
<td width="15%" aling="right"><center>&nbsp;<a href="index.asp"><img src="Imagens/Ranking_Principal_link.jpg"></a><br></center>
<center>&nbsp;<a href="rankingacertos.asp"><img src="Imagens/Ranking_Acertos_link.jpg"></a><br></center>
<center>&nbsp;<a href="rankingGrupos.asp"><img src="Imagens/Ranking_Grupos_link.jpg"></a></center></td>
<td width="15%" aling="right"><center>&nbsp;<a href="cadastro"><img src="Imagens/aposta.gif"></a><br></center>
<center>&nbsp;<a href="regras.asp"><img src="Imagens/regras.jpg"></a><br></center>
<center>&nbsp;<a href="estatistica.asp"><img src="Imagens/estatisticas.jpg"></a></center></td>
</tr>
</table>


<table class="Bolao" width="70%" border="0" cellspacing="2" cellpadding="2" align="center">
  <tr>
    <th colspan="7" height="24">REGRAS DO BOL&Atilde;O | <%= day(DateAdd("h", FusoHorario, now)) & "/" & month(DateAdd("h",  FusoHorario, now)) & "/" & year(DateAdd("h",  FusoHorario, now)) & " - " & hour(DateAdd("h",  FusoHorario, now)) & ":" & minute(DateAdd("h",  FusoHorario, now)) & ":" & second(DateAdd("h",  FusoHorario, now)) %></th>
  </tr>
  <TR>
    <td align="left">
      <div align="left">
        <p>O Bol�o On-line 2018 � composto por todos os jogos 
             da Copa do Mundo. </p>
        <p>O objetivo do bol�o � meramente promover uma brincadeira entre amigos, assim a arrecada��o, subtra�da apenas do custo da hospedagem de R$ 56,00, ser� distribu�da entre os vencedores.</p>
        <p>O valor da participa��o � de R$ 20,00.</p>
        <p>O participante receber&aacute; um nome de apostador e sua senha. Com
          estes dados ele poder&aacute; cadastrar suas apostas por meio
          do link existente na p&aacute;gina principal do bol&atilde;o.</p>
        <p>Os placares poder&atilde;o ser inclu&iacute;dos e alterados at&eacute; meia noite do dia anterior de cada jogo. Se o apostador n&atilde;o
          incluir o placar, ele n&atilde;o pontuar� nesta partida, mas concorrer� normalmente nas demais. </p>
        <p> Apenas no dia do jogo � que os placares apostados pelos participantes estar�o dispon�veis para consulta. </p>
	<p>O Bol&atilde;o ter&aacute; no m�nimo cinco ganhadores no ranking principal. Se houver empate entre apostadores ganhadores, eles dividir�o o pr�mio das posi��es ocupadas de forma acumulada. Por exemplo, se duas pessoas empatarem em primeiro lugar, dividir�o o primeiro e segundo pr�mios.
          <br><br>
	  Neste bol�o ter� uma novidade (pr�mio extra): O apostador que tiver a maior quantidade de acertos de placares dos jogos receber� 5% do arrecadado*<br>
          &nbsp;&nbsp;&nbsp;&nbsp;Em suma, assim ser� a divis�o da premia��o deste bol�o:
          <br><br>
          - 1� lugar                               : 50% do arrecadado* <br>
          - 2� lugar                               : 25% do arrecadado* <br>
          - 3� lugar                               : 10% do arrecadado* <br>
          - 4� lugar                               : 06% do arrecadado* <br>
          - 5� lugar                               : 04% do arrecadado* <br>
          - Maior quantidade de acertos de placares: 5% do arrecadado <br><br>
	  * Para efeitos de premia��o, a arrecada��o ser� subtra�da do custo de hospedagem, conforme j� esclarecido acima.<br>	
        <p>  
      </div>
    </td>
  </tr>
    
</table>
<br>
<table width="70%" border="0" cellspacing="2" cellpadding="2" class="Bolao" align="center">
  <tr>
    <th colspan="2">PONTUA��O</th>
  </tr>
  <tr>
    <td colspan="2">
      <div align="left">        <p>O quadro de pontua&ccedil;&atilde;o de cada jogo &eacute; o seguinte, considerando para tal somente o placar do tempo normal de jogo, sem prorroga��es ou p�naltis:</p>
</div>
    </td>
  </tr>
  <tr>
    <td>10 - </td>
    <td>
      <div align="left">Acertou o placar do jogo</div>
    </td>
  </tr>
  <tr>
    <td>5 - </td>
    <td>
      <div align="left">Errou o placar, mas acertou quem venceu o jogo e o escore do vencedor</div>
    </td>
  </tr>
  <tr>
    <td>4 - </td>
    <td>
      <div align="left">Errou o placar, mas acertou quem venceu o jogo e o escore do perdedor</div>
    </td>
  </tr>
  <tr>
    <td>4 - </td>
    <td>
      <div align="left">Acertou o empate, mas errou o placar</div>
    </td>
  </tr>
  <tr>
    <td>3 - </td>
    <td>
      <div align="left">Errou os placares do vencedor e do perdedor, mas acertou quem venceu</div>
    </td>
  </tr>
  <tr>
    <td> 1 - </td>
    <td>
      <div align="left">Acertou o placar invertido</div>
    </td>
  </tr>
</table>
<br>
<table width="70%" border="0" cellspacing="2" cellpadding="2" class="Bolao" align="center">
  <tr>
    <th colspan="2">ATEN��O: PONTUA��O PONDERADA PARA A SEGUNDA FASE EM DIANTE</th>
  </tr>
  <tr>
    <td><div align="left"> Multiplicada por 2 | Jogos 49 a 60 (OITAVAS E QUARTAS DE FINAIS)</div>
    </td>
  </tr>
  <tr>
    <td><div align="left"> Multiplicada por 3 | Jogos 61 a 63 (SEMI-FINAIS e DISPUTA DE 3� LUGAR)</div>
    </td>
  </tr>
  <tr>
    <td><div align="left"> Multiplicada por 4 | Jogo 64 (GRANDE FINAL DA COPA DO MUNDO 2014)</div>
    </td>
  </tr>
</table>

<script language="JavaScript">
<!--
function retornar() {
 window.location="index.asp"
 }
//-->
</script>
<br>
<FORM>
<div align="center">
  <input type="submit" name="btnVoltar" value="Retornar" class="botao" onclick="retornar();return false;">
</div>
</FORM>

<br>
<p>&nbsp;</p>
</body>
</html>
