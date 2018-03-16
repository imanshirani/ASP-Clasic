<%
response.Buffer = True

'Dimation Orginal Page
Dim Rep_numRows_news
Dim Rep_index_news
Dim ObjRS_numRows_news
'SQL Conect to datebase 
strSQL = "SELECT * FROM tbl_news ORDER BY ID_News DESC"
'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn
'Show Database Blunk
if objRS.Eof or objRS.BOF = null then 
response.Write(strTXTNoRecord)
else 
If Bol_Show_news = True then 
'Show All Banner
ObjRS_numRows_news = 0
Rep_numRows_news = intShow_news	
Rep_index_news = 0
objRS_numRows_news = objRS_numRows_news + Rep_numRows_news
%>
<table width="100%"  border="0" class="text">
<tr>
<td><span class="H1"><%= strTXTNews %></span></td>
</tr>
<% While ((Rep_numRows_news <> 0 ) and (not objRS.Eof))%>  
<tr>
    <td align="justify"><%= objRS.fields("Subject_News").value %></td>
  </tr>
  <tr>
    <td align="justify"><%= objRS.fields("PM_MSG_News").value %> </td>
  </tr>
  <tr>
    <td><a href="show_news.asp?ID=<%= objRS.fields("ID_News").value %>"><%= strTXTNewsContinue %></a> - <%= objRS.fields("date_add_News").value %> </td>
  </tr>
<%
	'Count Artist
	Rep_index_news = Rep_index_news + 1 
	Rep_numRows_news = Rep_numrows_news - 1
	objRS.movenext()
	wend	

	end if 
	' Close Recordset
	objRS.close
	set objRS = nothing
%>
	<tr>
	<td> <a href="AllNews.asp"><%= strTXTAllnews %></a></td>
	</tr>
</table>
<% End If %>