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
strSQL = "SELECT * FROM tbl_gallery ORDER BY name_artist ASC"

'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn

'Show Database Blunk
if objRS.Eof or objRS.BOF = null then 
response.Write("در ديتا بيس هيچ گونه ركوردي موجود نمي باشد ") & "<br>"
response.Write("لطفا براي ادامه روي لينك زير كليك كنيد ") & "<br>"
response.write("<a href=Add_gallery.asp>Add Gallery </a>")
else
'Show All Gallery
ObjRS_numRows = 0
Rep_numRows = -1
Rep_index = 0
objRS_numRows = objRS_numRows + Rep_numRows 
%>
<table width="100%"  border="0">
  <tr>
    <td><span class="H1">Mangemant Gallery </span> | <a href="Add_gallery.asp">Add gallery</a> </td>
  </tr>
  <tr>
    <td>
      <table width="100%"  border="0" class="border">
        <tr>
          <td>delete</td>
          <td>Pic</td>
          <td>Dateadd</td>
          <td>NAme</td>
        </tr>
<% While ((Rep_numRows <> 0 ) and (not objRS.Eof))%>
        <tr>
          <td><form action="Code_page/Delete_gallery_code.asp" method="post" name="Delete" id="Delete">
            <input name="ID_gallery" type="hidden" id="ID_gallery" value="<%= objRS.fields.item("ID_gallery").value %>">
            <input name="Delete_Gallery" type="submit" id="Delete_Gallery" value="Delete">          
              </form></td>
          <td><a href="<%= objRS.fields.item("link_gallery").value  %>" target="_blank"><img src="<%= objRS.fields.item("link_gallery").value %>" width="40" height="40" border="0"></a></td>
          <td><%= objRS.fields.item("date_add_gallery").value %></td>
          <td><%= objRS.fields.item("name_artist").value %></td>
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
      </table></td>
  </tr>
</table>
<% end if%>
<!--#include file="Footer.asp" -->