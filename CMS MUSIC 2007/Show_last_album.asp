<%
response.Buffer = True
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

'Dim orginal page
Dim Max_Number_show			'Holds number Show View
Dim int_Number_Show  		'Holds Number For
'Last Show View Album
Max_Number_show = intShow_album
'SQL Conect to datebase
	strSQL = "SELECT * FROM tbl_album ORDER BY ID_album DESC"

'Recordset Open and Query the database
	SET objRS = server.CreateObject("ADODB.Recordset")
	objRS.open strSQL,objconn
'Show Database Blunk
if objRS.Eof or objRS.BOF = null then 
response.Write(strTXTNoRecord) 
else
if Bol_Show_album = true then
%>
<table width="100%"  border="0">
  <tr>
    <td>
<table width="100%"  border="0">
  <tr>
    <td width="15%"><div align="center"><span class="text2"><%= strTXTCountSong %></span></div></td>
    <td width="15%"><div align="center"><span class="text2"><%= strTXTDate %></span></div></td>
    <td width="15%"><div align="center"><span class="text2"><%= strTXTStyle %></span></div></td>
    <td width="20%"><div align="center"><span class="text2"><%= strTXTNameSinger %></span></div></td>
    <td width="20%"><div align="center"><span class="text2"><%= strTXTNameAlbum %></span></div></td>
    <td width="15%"><div align="center"><span class="text2"><%= strTXTPicture %></span></div></td>
  </tr>
<%
'Show Recorde 
for int_Number_Show = 1 To Max_Number_show
if objRS.EOF then exit For
%>
  <tr>
    <td width="15%"><div align="center"><span class="text3"><%= objRS.Fields.item("Count_Song").value %></span></div></td>
    <td width="15%"><div align="center"><span class="text3"><%= objRS.Fields.item("date_album").value %></span></div></td>
    <td width="15%"><div align="center"><span class="text3"><%= objRS.Fields.item("style_album").value %></span></div></td>
    <td width="20%"><div align="center"><span class="text3"><a href="javascript:void(0)"onclick="window.open('Show_artist.asp?ID=<%= objRS.Fields.item("name_artist").value %>','miniwin','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=468,height=500')"><%= objRS.Fields.item("name_artist").value %></a></span></div></td>
    <td width="20%"><div align="center"><span class="text3"><a href="javascript:void(0)"onclick="window.open('Show_album.asp?album=<%= objRS.Fields.item("name_album").value %>&ID=<%= objRS.Fields.item("name_artist").value %>','miniwin','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=1,width=468,height=500')"><%= objRS.Fields.item("name_album").value %></a></span></div></td>
    <td width="15%"><div align="center"><a href="<%= objRS.Fields.item("cover_front_album").value %>" target="_blank"><img src="<%= objRS.Fields.item("cover_front_album").value %>" alt="<%= objRS.Fields.item("name_album").value %>" width="50" height="50" border="0" ></a></div></td>
  </tr>
<%
'Move next record
objRS.movenext()
Next
%>
</table>
	</td>
  </tr>
</table>
<% end if %>
<% end if %>

