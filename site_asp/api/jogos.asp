<!-- #include file ="jsonObject.class.asp" -->
<!--#include virtual="/comuns/configuracoes.asp"--> 

<%
    Response.LCID = 1046 ' Brazilian LCID (use your locale code here).

    On Error Resume Next

    Set conx = Server.CreateObject("ADODB.Connection")
    conx.Open ConnStrMySQL 

    sql = "select r.*,COALESCE(p1.Arquivo,'a-definir.png') arq_time_1, COALESCE(p2.Arquivo,'a-definir.png') arq_time_2, datediff(STR_TO_DATE(data_jogo, '%d/%m/%Y'),date_add(CURRENT_TIMESTAMP(),INTERVAL 4 hour)) diff from Resultados r left join ( Pais p1, Pais p2 ) on ( r.time1 = p1.Pais and r.time2 = p2.Pais) order by r.cod_Jogo"

    set resultSet = Server.CreateObject("ADODB.Recordset")
    
    resultSet.Open sql, conx

    ' instantiate the class
    set JSONarr = New JSONarray

    JSONarr.LoadRecordset resultSet
    
    set JSON = New JSONobject
    
    JSON.Add "data", JSONarr

    JSON.Write()

    ' Fechar e eliminar os objetos Recordsets 
    resultSet.Close
    Set resultSet = Nothing 
  
    ' Fechar e eliminar o objeto da conexÃ£o 
  
    conx.Close
    Set conx = Nothing   

%>