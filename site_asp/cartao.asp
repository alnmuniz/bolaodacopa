 <%

   FusoHorario = 4
   FormatoData = "Americano"
   TituloPagina = "Bol�o da Copa do Mundo 2018"


    'Abrindo Conex�o mySQL - Forma usada em 2010
'         ConnStrMySQL  = "Driver={MySQL ODBC 3.51 Driver};Server=localhost;Database=bolaodacopa2013;uid=bolaodacopa;pwd=Brasil;option=3"


    'Abrindo Conex�o mySQL - Forma usada em 2013
'         ConnStrMySQL  = "Driver={MySQL ODBC 3.51 Driver};Server=mysql.bolaodacopa.unositehospedagem.com.br;Database=bolaodacopa;uid=bolaodacopa;pwd=vasco97;option=3"


    'Abrindo Conex�o mySQL - Forma usada em 2018
         ConnStrMySQL  = "Driver={MySQL ODBC 3.51 Driver};Server=50.62.209.75;Database=bolaodacopa2018;uid=bolaodacopa;pwd=Brasil2018;option=3"


%>


<html>
<head>
<META HTTP-EQUIV="Expires" CONTENT="0">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
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

<td width="15%" aling="lef"><center><a href="/app"><img src="Imagens/app.jpg"></a></center></td>

<%   else %>


<td width="15%" aling="lef"><center>&nbsp;<a href="cadastro/precadastro.asp"><img src="Imagens/preinscricao.gif" width="100" height="45"></a><br></center>
<center>&nbsp;<a href="http://bolaodacopa2018.online/app"><img src="Imagens/app.jpg"></a></center>
</td>


<% end if %>

<td width="15%" aling="lef"><center><img src="Imagens/logo_copa.jpg" width="80" height="80"></center></td>
<td width="40%" aling="center"><center><img src="Imagens/logo.jpg" width="328" height="80"></center></td>
<td width="15%" aling="right"><center>&nbsp;<a href="index.asp"><img src="Imagens/Ranking_Principal_link.jpg"></a><br></center>
<center>&nbsp;<a href="rankingacertos.asp"><img src="Imagens/Ranking_Acertos_link.jpg"></a><br></center>
<center>&nbsp;<a href="rankingGrupos.asp"><img src="Imagens/Ranking_Grupos_link.jpg"></a></center></td>
<td width="15%" aling="right"><center>&nbsp;<a href="cadastro"><img src="Imagens/aposta.gif"></a><br></center>
<center>&nbsp;<a href="regras.asp"><img src="Imagens/regras.jpg"></a><br></center>
<center>&nbsp;<a href="estatistica.asp"><img src="Imagens/estatisticas.jpg"></a></center></td>
</tr>
</table>


<table class="Bolao" width="80%" border="0" cellspacing="2" cellpadding="2" align="center">
  <tr>
    <th colspan="9" height="24">CART&Atilde;O DE APOSTAS - <%= request("nome") %> | <%= day(DateAdd("h", FusoHorario, now)) & "/" & month(DateAdd("h",  FusoHorario, now)) & "/" & year(DateAdd("h",  FusoHorario, now)) & " - " & hour(DateAdd("h",  FusoHorario, now)) & ":" & minute(DateAdd("h",  FusoHorario, now)) & ":" & second(DateAdd("h",  FusoHorario, now)) %></th>
  </tr>
  <tr>
    <th colspan="9" height="24">PRIMEIRA FASE</th>
  </tr>

<%

         Set conx = Server.CreateObject("ADODB.Connection")
         conx.Open ConnStrMySQL 
       
         jogo_ant = 0
	
         sql =	     "   SELECT Apostadores.Nome, Jogos.cod_Jogo, Jogos.Placar_A, Jogos.Placar_B, Jogos.Pontos, Resultados.time1, Resultados.time2, Resultados.data_jogo, Resultados.hora_jogo FROM Apostadores, Apostas, Jogos, Resultados"
	 sql = sql & "	  WHERE Apostadores.cod_Apostador = Apostas.cod_Apostador"
	 sql = sql & "	    AND Apostas.cod_Aposta = Jogos.cod_Aposta"
	 sql = sql & "	    AND Apostas.cod_Aposta = " & request("cod")
	 sql = sql & "	    AND Jogos.cod_Jogo = Resultados.cod_Jogo"
	 sql = sql & " ORDER BY Jogos.cod_Jogo"

	set rs = Server.CreateObject("ADODB.Recordset")
        rs.Open sql, conx 

        i = 1

  while not rs.eof

    jogo_ant = rs("cod_Jogo") %>

  
   
  <% if rs("cod_Jogo") = 49 then%>
  <tr><th colspan="9" height="24">OITAVAS DE FINAL</th>  </tr>
  <%  end if%>

  <% if rs("cod_Jogo") = 57 then%>
  <tr><th colspan="9" height="24">QUARTAS DE FINAL</th>  </tr>
  <%  end if%>

  <% if rs("cod_Jogo") = 61 then%>
  <tr><th colspan="9" height="24">SEMI-FINAL</th>  </tr>
  <%  end if%>

  <% if rs("cod_Jogo") = 63 then%>
  <tr><th colspan="9" height="24">DISPUTA DO TERCEIRO LUGAR</th>  </tr>
  <%  end if%>

  <% if rs("cod_Jogo") = 64 then%>
  <tr><th colspan="9" height="24"> GRANDE FINAL</th>  </tr>
  <%  end if%>


<% if (i MOD 2) <> 0 then %>
    <tr class="LinhaImpar">
<%  else%>
    <tr class="LinhaPar">
<%  end if%>
    
    <td><%=rs("cod_Jogo")%>.</td>
    <td><%=rs("data_jogo")%></td>
    <td><%=left(rs("hora_jogo"),5)%></td>
<%  if rs("time1") = "BRASIL" then
%>    <td widht="60%" class="Brasil">BRASIL</td>
<%  elseif rs("time1") = "A definir" then%>
      <td widht="60%" class="vazio"><%=rs("time1")%></td>
<%  else%>
      <td widht="60%" ><%=rs("time1")%></td>
<%  end if%>
    <td>
<%  if rs("time1") <> "A definir" then
      sql = "SELECT * FROM Pais where Pais = '" & rs("time1") & "'"
      ' set rs2 = conx.execute(sql)
      set rs2 = Server.CreateObject("ADODB.Recordset")
      rs2.Open sql, conx 
      
      if not rs2.eof then %>
	<img src="Imagens/<%=rs2("Arquivo")%>" width="21" height="15"></td>
<%    end if
      rs2.Close
    end if
%>    </td>
<%   

     if FormatoData = "Americano" then
       DatadoJogo = Mid(rs("data_jogo"),4,2) & "/" & left(rs("data_jogo"),2) & "/" & mid(rs("data_jogo"),7,4)
     else
       DatadoJogo = rs("data_jogo")
     end if

    
     if DateAdd("h", FusoHorario, now) < cdate(DatadoJogo) then

%>
      <td>Aposta Realizada</td>
<% else %>
      <td><%=rs("placar_A")%>&nbsp;X&nbsp;<%=rs("placar_B")%> </td>
<% end if %>
    <td>
<%    if rs("time2") <> "A definir" then
      sql = "SELECT * FROM Pais where Pais = '" & rs("time2") & "'"
      ' set rs2 = conx.execute(sql)
      rs2.Open sql, conx 
      if not rs2.eof then %>
	<img src="Imagens/<%=rs2("Arquivo")%>" width="21" height="15"></td>
<%    end if
     rs2.Close
    end if%>
     </td>
<%  if rs("time2") = "BRASIL" then
%>    <td widht="60%" class="Brasil">BRASIL</td>
<%  elseif rs("time2") = "A definir" then%>
      <td widht="60%" class="vazio"><%=rs("time2")%></td>
<%  else%>
      <td widht="60%" ><%=rs("time2")%></td>
<%  end if%>
    <td>&nbsp;<%= rs("Pontos")%></td>
  </tr>
<%  i = i + 1
    rs.MoveNext
  wend 

 ' Fechar os objetos Recordsets 
  rs.Close
  
  ' Eliminar os objetos Recordsets 
  Set rs = Nothing 
  Set rs2 = Nothing

  ' Fechar o objeto da conex�o 
  conx.Close 
 
 ' Eliminar o objeto da conex�o 
  Set conx = Nothing 


%>
</table>
<div align="center"><br>
  <br>
  <a href="index.asp">P&aacute;gina Principal</a> </div>
<p>&nbsp;</p>
</body>
</html>
