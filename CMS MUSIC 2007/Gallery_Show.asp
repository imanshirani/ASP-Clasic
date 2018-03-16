<table width="768" border="0" align="center">
  <tr>
    <td colspan="2"><!--#include file="Header.asp"--></td>
  </tr>
  <tr>
	<td colspan="2">
<%

response.Buffer = True
	
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"


'SQL Conect to datebase 
strSQL = "SELECT * FROM tbl_gallery"

'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn

'Show Database Blunk
if objRS.Eof or objRS.BOF = null then 
response.Write("در ديتا بيس هيچ گونه ركوردي موجود نمي باشد ") & "<br>"
response.Write("لطفا براي ادامه روي لينك زير كليك كنيد ") & "<br>"
response.write("<a href=Add_gallery.asp>Add Gallery </a>")
else
'Show repet Record
While Not objRS.EOF
%>
 <table border="0" width="100%">
		<tr>
             <td width="25%">
<table width="100%"  border="0">
  <tr>
    <td><img src="<%= objRS.fields.item("link_gallery").value%>" width="100" height="100" border="0"></td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("name_artist").value%>name:</td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("date_add_gallery").value%> Date _add </td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("size_gallery").value%>Size Count:<%= objRS.fields.item("Count").value%></td>
  </tr>
  <tr>
	<td><form action="Code_page/Count_Gallery_code.asp" method="post" name="Post_count" target="_blank" id="Post_count">
	  <input name="Count_old" type="hidden" id="Count_old" value="<%= objRS.fields.item("Count").value%>"> 
	  <input name="ID_gallery" type="hidden" id="ID_gallery" value="<%= objRS.fields.item("ID_gallery").value%>">
      <input name="Link_gallery" type="hidden" id="Link_gallery" value="<%= objRS.fields.item("link_gallery").value%>">      
      <input name="Download" type="submit" id="Download" value="Download">
    </form></td>
  </tr>
</table>	</td>
<%  objRS.MoveNext
  If Not objRS.EOF Then
  %>
              <td width="25%">
<table width="100%"  border="0">
  <tr>
    <td><img src="<%= objRS.fields.item("link_gallery").value%>" width="100" height="100" border="0"></td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("name_artist").value%> name:</td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("date_add_gallery").value%> Date _add</td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("size_gallery").value%>Size Count:<%= objRS.fields.item("Count").value%></td>
  </tr>
  <tr>
	<td><form action="Code_page/Count_Gallery_code.asp" method="post" name="Post_count" target="_blank" id="Post_count">
      <input name="Count_old" type="hidden" id="Count_old" value="<%= objRS.fields.item("Count").value%>">
      <input name="ID_gallery" type="hidden" id="ID_gallery" value="<%= objRS.fields.item("ID_gallery").value%>">
      <input name="Link_gallery" type="hidden" id="Link_gallery" value="<%= objRS.fields.item("link_gallery").value%>">
      <input name="Download" type="submit" id="Download" value="Download">
    </form></td>
  </tr>
</table><%End If %></td>
<%  objRS.MoveNext
  If Not objRS.EOF Then
  %>
              <td width="25%">
<table width="100%"  border="0">
  <tr>
    <td><img src="<%= objRS.fields.item("link_gallery").value%>" width="100" height="100" border="0"></td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("name_artist").value%> name:</td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("date_add_gallery").value%> Date _add</td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("size_gallery").value%>Size Count:<%= objRS.fields.item("Count").value%></td>
  </tr>
  <tr>
	<td><form action="Code_page/Count_Gallery_code.asp" method="post" name="Post_count" target="_blank" id="Post_count">
      <input name="Count_old" type="hidden" id="Count_old" value="<%= objRS.fields.item("Count").value%>">
      <input name="ID_gallery" type="hidden" id="ID_gallery" value="<%= objRS.fields.item("ID_gallery").value%>">
      <input name="Link_gallery" type="hidden" id="Link_gallery" value="<%= objRS.fields.item("link_gallery").value%>">
      <input name="Download" type="submit" id="Download" value="Download">
    </form></td>
  </tr>
</table><%End If %></td>
<%  objRS.MoveNext
  If Not objRS.EOF Then
  %>
              <td width="25%">
<table width="100%"  border="0">
  <tr>
    <td><img src="<%= objRS.fields.item("link_gallery").value%>" width="100" height="100" border="0"></td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("name_artist").value%> name:</td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("date_add_gallery").value%> Date _add</td>
  </tr>
  <tr>
	<td><%= objRS.fields.item("size_gallery").value%>Size Count:<%= objRS.fields.item("Count").value%></td>
  </tr>
  <tr>
	<td><form action="Code_page/Count_Gallery_code.asp" method="post" name="Post_count" target="_blank" id="Post_count">
      <input name="Count_old" type="hidden" id="Count_old" value="<%= objRS.fields.item("Count").value%>">
      <input name="ID_gallery" type="hidden" id="ID_gallery" value="<%= objRS.fields.item("ID_gallery").value%>">
      <input name="Link_gallery" type="hidden" id="Link_gallery" value="<%= objRS.fields.item("link_gallery").value%>">
      <input name="Download" type="submit" id="Download" value="Download">
    </form></td>
  </tr>
</table><%End If %></td>
   </tr>
 </table>    
<%
	'Show Repet Record
	If Not objRS.EOF Then
	objRS.MoveNext
	End If
	Wend
	objRS.close
	set objRS = nothing
	End if
%>	</td>
  </tr>
  <tr>
    <td colspan="2"><!--#include file="Footer.asp"--></td>
  </tr>
	</td>
  </tr>
</table>