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
Dim strer					'Holds Erorr

'Set Query
Set strer = request.QueryString("ER")

'SQL Conect to datebase 
strSQL = "SELECT * FROM tbl_artist ORDER BY name_artist ASC"

'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn

'Show Database Blunk
if objRS.Eof or objRS.BOF = null then 
response.Write(strTXTNoRecord) & "<br>"
response.Write(strTXTAddRecord) & "<br>"
response.write("<a href=Add_artist.asp>"& strTXTAddArtist &"</a>")
else 
'Show All artist
ObjRS_numRows = 0
Rep_numRows = -1
Rep_index = 0
objRS_numRows = objRS_numRows + Rep_numRows
%>
<table width="100%"  border="0">
  <tr>
    <td><span class="H1"><%= strTXTManegartist %> </span><a href="Add_artist.asp"><%= strTXTAddArtist %></a></td>
  </tr>
  <tr>
    <td><% response.Write(strer) %></td>
  </tr>
  <tr>
    <td>
	<table width="100%"  border="0" class="border">
      <tr>
        <td><div align="center"><span class="text2"><%= strTXTDelete %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTEdit %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTAddAlbum %></span></div></td>
		<td><div align="center"><span class="text2"><%= strTXTViewAlbum %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTCountSong %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTCountalbum %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTStyle %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTCountry %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTNameSinger %></span></div></td>
      </tr>
<% While ((Rep_numRows <> 0 ) and (not objRS.Eof))%>
      <tr>
        <td><form action="Code_page\Delete_artist_code.asp?ID=<%= objRS.fields.item("ID_artist").value %>" method="post" name="delete_artist" id="delete_artist">
          <div align="center">
  <input name="ID_artist" type="hidden" id="ID_artist" value="<%= objRS.fields.item("ID_artist").value %>">
  <input name="Delete_artist" type="submit" id="Delete_artist" value="<%= strTXTDelete %>">
          </div>
        </form></td>
        <td><form action="Edit_artist.asp?ID=<%= objRS.fields.item("ID_artist").value %>" method="post" name="Edit_artist" id="Edit_artist">
          <div align="center">
            <input name="Edit_artist" type="submit" id="Edit_artist" value="<%= strTXTEdit %>">
          </div>
        </form></td>
        <td>
<form action="Add_album.asp" method="post" name="add_album" id="add_album">
  <div align="center">
  <input name="ID_artist" type="hidden" id="ID_artist" value="<%= objRS.fields.item("ID_artist").value %>">
  <input name="name_artist" type="hidden" id="name_artist" value="<%= objRS.fields.item("name_artist").value %>">
  <input name="Count_album" type="hidden" id="Count_album" value="<%= objRS.fields.item("Count_album").value %>">
  <input name="Add_album" type="submit" id="Add_album" value="<%= strTXTAddAlbum %>">
  </div>
</form>		</td>
		<td><form action="Manegment_album.asp?ID=<%= objRS.fields.item("ID_artist").value %>" method="post" name="View_album" id="View_album">
	        <div align="center">
	          <input name="ID_artist" type="hidden" id="ID_artist" value="<%= objRS.fields.item("ID_artist").value %>">
	          <input type="submit" name="Submit" value="<%= strTXTViewAlbum %>">
		      </div>
		</form></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("Count_Song").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("Count_album").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("style_artist").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("Country_artist").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("name_artist").value %></span></div></td>
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