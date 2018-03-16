<table width="768" border="0" align="center" class="text">
  <tr>
    <td colspan="2"><!--#include file="Header.asp"--></td>
  </tr>
  <tr>
	<td colspan="2">
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
response.Write("در ديتا بيس هيچ گونه ركوردي موجود نمي باشد ")
else 
If Bol_Show_news = True then 
'Show All Banner
ObjRS_numRows_news = 0
Rep_numRows_news = -1	
Rep_index_news = 0
objRS_numRows_news = objRS_numRows_news + Rep_numRows_news
%>
<table width="100%"  border="0">
<tr>
<td colspan="2"><span class="H1"><%= strTXTnews %></span></td>
</tr>
<% While ((Rep_numRows_news <> 0 ) and (not objRS.Eof))%>  
<tr>
    <td align="justify"><a href="show_news.asp?ID=<%= objRS.fields("ID_News").value %>"><%= objRS.fields("Subject_News").value %></a></td>
  <td align="left"><span class="text3"><%= objRS.fields("date_add_News").value %></span></td>
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
	<td colspan="2"> <a href="AllNews.asp"><%= strTXTAllnews %></a></td>
	</tr>
</table>
<% End If %>
	</td>
  </tr>
  <tr>
    <td colspan="2"><!--#include file="Footer.asp"--></td>
  </tr>
	</td>
  </tr>
</table>