<!--#include file="DB.asp" -->
<!--#include file="Header_admin.asp" -->
<%

response.Buffer = True
	
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

'Dimation Orginal Page
Dim Rep_numRows
Dim Rep_index
Dim ObjRS_numRows
'SQL Conect to datebase 
strSQL = "SELECT * FROM tbl_News ORDER BY date_add_News DESC"

'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn

'Show Database Blunk
if objRS.Eof or objRS.BOF = null then 
response.Write(strTXTNoRecord) & "<br>"
response.Write(strTXTAddRecord) & "<br>"
response.write("<a href=Add_news.asp>"& strTXTAddNews &"</a>")
else 
'Show All News
ObjRS_numRows = 0
Rep_numRows = -1
Rep_index = 0
objRS_numRows = objRS_numRows + Rep_numRows
%>
<table width="100%"  border="0">
  <tr>
    <td><span class="H1"><%= strTXTManegNews %></span> | <a href="Add_news.asp"><%= strTXTAddNews %></a> </td>
  </tr>
  <tr>
    <td><table width="100%"  border="0" class="border">
      <tr class="text2">
        <td><%= strTXTDelete %></td>
        <td><%= strTXTEdit %></td>
        <td><%= strTXTDateAdd %></td>
        <td><%= strTXTSubjectNews %></td>
      </tr>
<% While ((Rep_numRows <> 0 ) and (not objRS.Eof))%>
      <tr class="text3">
        <td><form action="Code_page/Delete_news_code.asp" method="post" name="Delet_news" id="Delet_news">
          <input name="ID_news" type="hidden" id="ID_news" value="<%= objRS.fields.item("ID_news").value %>">
          <input name="Delete_news" type="submit" id="Delete_news" value="<%= strTXTDelete %>">
        </form></td>
        <td><form action="Edit_news.asp?ID=<%= objRS.fields.item("ID_news").value %>" method="post" name="Edit" id="Edit">
            <input name="Edit_news" type="submit" id="Edit_news" value="<%= strTXTEdit %>">
          </form></td>
        <td><%= objRS.fields.item("date_add_News").value %></td>
        <td><%= objRS.fields.item("Subject_News").value %></td>
      </tr>
<%
	'Count Artist
	Rep_index = Rep_index + 1 
	Rep_numRows = Rep_numrows - 1
	objRS.movenext()
	wend	
	' Close Recordset
	objRS.close
	set objRS = nothing
%>
    </table>
 </td>
  </tr>
</table>
<% end if%>
<!--#include file="Footer.asp" -->