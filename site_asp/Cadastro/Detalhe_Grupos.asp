<!--#include virtual="/comuns/configuracoes.asp"--> 

<% 



 if Session("usuario") = empty then

    response.write ("Usu�rio n�o autorizado!!!<br>")

    response.write ("<A href=""../index.asp"">Clique aqui para retornar</a>")

  else

         Set conx = Server.CreateObject("ADODB.Connection")

         conx.Open ConnStrMySQL 



	

    sql = "Select * from Apostadores where nome = '" & session("usuario") & "'"



    set rs_usuario = Server.CreateObject("ADODB.Recordset")



    rs_usuario.Open sql, conx 



    sql = "Select * from Grupos where cod_grupo = " & session("grupo") 



    set rs_grupo = Server.CreateObject("ADODB.Recordset")



    rs_grupo.Open sql, conx 



    if request("btnIncluir") <> empty then

 

       todo_check = split(request("check"),",")



       Mensagem = "Grupo atualizado com sucesso!"



    end if



%>



<script language="JavaScript">

<!--

function retornar() {

 window.location="Gerenciar_Grupos.asp"

 }

//-->

</script>

<html>

<head>

<title><%=TituloPagina%> - Atualiza&ccedil;&atilde;o de Grupos</title>

<!--#include virtual="/comuns/menu.asp"--> 

<br>



<div class="mensagem">

  <% response.write Mensagem & "<BR>" %>

</div>

<BR>

<form name="formInclusao" method="post" action="Detalhe_Grupos.asp">

  <table class="Bolao" width="70%" border="0" cellspacing="2" cellpadding="2" align="center">

    <tr>

      <th colspan="7" height="24">ATUALIZA&Ccedil;&Atilde;O DE GRUPOS | <%= day(DateAdd("h", FusoHorario, now)) & "/" & month(DateAdd("h",  FusoHorario, now)) & "/" & year(DateAdd("h",  FusoHorario, now)) & " - " & hour(DateAdd("h",  FusoHorario, now)) & ":" & minute(DateAdd("h",  FusoHorario, now)) & ":" & second(DateAdd("h",  FusoHorario, now)) %>

      </th>

    </tr>

    <tr>

      <th colspan="2" >NOME :

      </th>

      <th colspan="5" align="left"><%=rs_usuario("nome")%>

      </th>

    </tr>

    <tr>

      <th colspan="2" >CONTATO :

      </th>

      <th colspan="5" align="left"> <%=rs_usuario("contato")%>

      </th>

    </tr>



    <tr>

      <th colspan="2" >GRUPO :

      </th>

      <th colspan="5" align="left"> <%=rs_grupo("nome_grupo")%>

      </th>

    </tr>





  </table>



<br>

<br>



<table width="50%" border="0" cellspacing="2" cellpadding="2" align="center" class="Bolao">

  <tr>

    <th colspan="70">APOSTADORES - SELECIONE OS QUE DEVEM FAZER PARTE DO GRUPO</th>

  </tr>

  <tr>

    <td class="Titulo" width="10%">Selecione</td>

    <td class="Titulo" width="20%">Nome</td>

    <td class="Titulo" width="20%">Contato</td>

   </tr>

  <%

     intLinha = 0



     sql =		 "   SELECT * FROM Apostadores"

	 sql = sql & "	  WHERE Apostadores.Ativo"

	 sql = sql & " ORDER BY Apostadores.nome"



'     sql =		 "   SELECT * FROM Apostadores, Apostas, Jogos, Resultados"

'	 sql = sql & "	  WHERE Apostadores.cod_Apostador = Apostas.cod_Apostador"

'	 sql = sql & "	    AND Jogos.cod_Aposta = Apostas.cod_Aposta"

'	 sql = sql & "	    AND Jogos.cod_Jogo = Resultados.cod_Jogo"

'	 sql = sql & " ORDER BY Apostas.Total_Pontos DESC, Apostadores.nome, Apostas.cod_Aposta, Jogos.cod_Jogo "

'	 set rs = conx.execute(sql)





     set rs = Server.CreateObject("ADODB.Recordset")



     set rs1 = Server.CreateObject("ADODB.Recordset")



     rs.Open sql, conx 



     while not rs.eof

		

                intLinha = intLinha + 1  

                

		if intLinha mod 2 = 0 then

%>			<tr class="LinhaPar">

<%	else %>

			<tr class="LinhaImpar">

<%	end if %>



<%





    if request("btnIncluir") <> empty then



       sql = "   SELECT * FROM Det_Grupos"

       sql = sql & "	  WHERE cod_grupo = " & session("grupo") 

       sql = sql & "          AND cod_apostador = " & rs("cod_Apostador")



       rs1.Open sql, conx 



       sim = 0



       for i5=lbound(todo_check) to ubound(todo_check)



          if cint(rs("cod_Apostador")) = cint(todo_check(i5)) then

            sim = 1

            exit for

          end if

       next



       if sim = 1 then 



          If rs1.eof then 



  	      sql =      "INSERT INTO Det_Grupos (cod_grupo, cod_apostador)"

	      sql = sql & " VALUES (" & session("grupo") & ", " & rs("cod_Apostador") & ")"



	      conx.execute(sql)



          end if



       else

          If not rs1.eof then 



  	      sql =      "DELETE FROM Det_Grupos"

              sql = sql & "	  WHERE cod_grupo = " & session("grupo") 

              sql = sql & "          AND cod_apostador = " & rs("cod_Apostador")

	      conx.execute(sql)



          end if



       end if



     rs1.close



     end if





     sql = "   SELECT * FROM Det_Grupos"

     sql = sql & "	  WHERE cod_grupo = " & session("grupo") 

     sql = sql & "          AND cod_apostador = " & rs("cod_Apostador")



     rs1.Open sql, conx 



%>

		<td width="10%"> <input type="checkbox" name="check" value="<%=rs("cod_Apostador")%>" 



<%     If not rs1.eof then %>

checked

<%     end if

       rs1.Close



  %>



value=""/>

</td>



    <td  width="20%"><%= rs("nome") %></td>

    <td  width="20%"><%= rs("Contato") %></td>

<%

    rs.MoveNext

  wend

%>

</table>





<%

  

  ' Fechar os objetos Recordsets 

  rs.Close

  rs_grupo.Close

  rs_usuario.Close

   

  ' Eliminar os objetos Recordsets 

  Set rs = Nothing 

  Set rs1 = Nothing 

  Set rs_grupo = Nothing 

  Set rs_usuario = Nothing 

  ' Fechar o objeto da conexão 

  conx.Close 

 

 ' Eliminar o objeto da conexão 

  Set conx = Nothing 



%>



<br>

  <div align="center">

    <input type="submit" name="btnIncluir" value="Atualizar" class="botao">&nbsp;&nbsp;&nbsp;&nbsp;

    <input type="submit" name="btnVoltar" value="Retornar" class="botao" onClick="retornar();return false;">

  </div>

<p>&nbsp;</p>





</form>



</body>

</html>

<%

	

end if



%>

