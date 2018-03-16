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
Dim Max_Number_show				'Holds number Show View
Dim int_Number_Show  			'Holds Number For
Dim int_ID_album
Dim int_ID_artist
Dim str_ID_album
Dim str_ID_artist
'set Request
set int_ID_album = Request.Form("ID_album")
set int_ID_artist = Request.Form("ID_artist")
str_ID_artist =Request.QueryString("ID")
str_ID_album = Request.QueryString("album")
'Last Show View Topic
Max_Number_show = 30 

'SQL Conect to datebase 
strSQL = "SELECT * FROM tbl_song ORDER BY name_song ASC"

'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn

'Show Database Blunk
if objRS.Eof or objRS.BOF = null then 
response.Write(strTXTNoRecord) & "<br>"
response.Write(strTXTAddRecord) & "<br>"
response.write("<a href=Add_artist.asp>"& strTXTAddArtist &"</a>")
else 
%>
<table width="100%"  border="0">
  <tr>
    <td class="H1"><%= strTXTManegsong %></td>
  </tr>
  <tr>
    <td>
	<table width="100%"  border="0" class="border">
      <tr>
        <td><div align="center"><span class="text2"><%= strTXTDelete %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTEdit %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTCount %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTNameSinger %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTNameAlbum %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTTime %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTSize %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTNameSong %></span></div></td>
      </tr>
<% 
'Show Recorde 
for int_Number_Show = 1 To Max_Number_show
if objRS.EOF then exit For
if ((objRS.fields.item("ID_album").value = (int_ID_album)) AND (objRS.fields.item("ID_artist").value = (int_ID_artist))) or ((objRS.fields.item("ID_album").value = (str_ID_album)) AND (objRS.fields.item("ID_artist").value = (str_ID_artist))) then 
%>
      <tr>
        <td><form action="Code_page/Delete_song_code.asp" method="post" name="Delete" id="Delete">
          <div align="center">
  <input name="ID_artist" type="hidden" id="ID_artist2" value="<%= objRS.fields.item("ID_artist").value %>">          
  <input name="ID_album" type="hidden"  id="ID_album" value="<%= objRS.fields.item("ID_album").value %>">
  <input name="ID_song" type="hidden"  id="ID_song" value="<%= objRS.fields.item("ID_song").value %>">
            <input name="Delete_song" type="submit" id="Delete_song" value="<%= strTXTDelete %>">
          </div>
        </form></td>
        <td><form action="Edit_song.asp?ID=<%= objRS.fields.item("ID_song").value %>" method="post" name="Edit_song" id="Edit_song">
            <div align="center">
              <input name="Edit_song" type="submit" id="Edit_song" value="<%= strTXTEdit %>">
            </div>
        </form></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("Count").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("name_artist").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("name_album").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("time_Song").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("size_Song").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("name_Song").value %></span></div></td>
      </tr>
<%
 
end if
'Move next record
objRS.movenext()
Next
%>
	</table>
	</td>
  </tr>
</table>
<% end if%>
<!--#include file="Footer.asp" -->