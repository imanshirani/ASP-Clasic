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
strSQL = "SELECT * FROM tbl_banner ORDER BY date_exp_banner DESC"

'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn

'Show Database Blunk
if objRS.Eof or objRS.BOF = null then 
response.Write(strTXTNoRecord) & "<br>"
response.Write(strTXTAddRecord) & "<br>"
response.write("<a href=Add_banner.asp>"& strTXTAddBanner &"</a>")
else 
'Show All artist
ObjRS_numRows = 0
Rep_numRows = -1
Rep_index = 0
objRS_numRows = objRS_numRows + Rep_numRows
%>
<table width="100%"  border="0">
  <tr>
    <td><span class="H1"><%= strTXTManegBanner %> </span>| <a href=Add_banner.asp> <%= strTXTAddBanner %> </a></td>
  </tr>
  <tr>
    <td>
<table width="100%"  border="0" class="border">
  <tr class="text2">
    <td><div align="center"><%= strTXTDelete %></div></td>
    <td><div align="center"><%= strTXTEdit %></div></td>
    <td><div align="center"><%= strTXTCount %></div></td>
    <td><div align="center"><%= strTXTEXP %></div></td>
    <td><div align="center"><%= strTXTDateAdd %></div></td>
    <td><div align="center"><%= strTXTNameBanner %></div></td>
  </tr>
<% While ((Rep_numRows <> 0 ) and (not objRS.Eof))%>
  <tr class="text3">
    <td><form action="Code_page/Delete_banner_code.asp" method="post" name="Delete_banner" id="Delete_banner">
      <div align="center">
        <input name="ID_banner" type="hidden" id="ID_banner" value="<%= objRS.fields("ID_banner").value %>">
        <input name="Delete_banner" type="submit" id="Delete_banner" value="<%= strTXTDelete %>">
      </div>
    </form></td>
    <td><form action="Edit_banner.asp?ID=<%= objRS.fields("ID_banner").value %>" method="post" name="Edit_banner" id="Edit_banner">
      <div align="center">
        <input name="Edit_banner" type="submit" id="Edit_banner" value="<%= strTXTEdit %>">
      </div>
    </form></td>
    <td><div align="center"><%= objRS.fields("Count").value %></div></td>
    <td><div align="center"><%= objRS.fields("date_exp_banner").value %>
	      <% if objRS.fields("date_exp_banner") < date() then %> 
	      <span class="H1" style="color: #FF0000"><%= strTXTDateEXP %></span>
	      <% end if %>
	  </div></td>
    <td><div align="center"><%= objRS.fields("date_add_banner").value %></div></td>
    <td>      <div align="center"><a href="<%= objRS.fields("link_site_banner").value %>" target="_blank"><img src="<%= objRS.fields("link_banner").value %>" alt="<%= objRS.fields("name_banner").value %>" width="468" height="60" border="0"></a></div></td>
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

<% end if %><!--#include file="Footer.asp" -->