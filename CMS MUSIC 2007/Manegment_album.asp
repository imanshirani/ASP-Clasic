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
Dim int_ID_artist
Dim int_ID
Dim in_ID_artist
Dim strer					'Holds Erorr

'set Request
set int_ID_artist = Request.Form("ID_artist")
Set int_ID = request.QueryString("ID")
Set strer = request.QueryString("ER")
'Last Show View album
Max_Number_show = 2000 

'SQL Conect to datebase 
strSQL = "SELECT * FROM tbl_album ORDER BY ID_album DESC"
	
'Recordset Open and Query the database
SET objRS = server.CreateObject("ADODB.Recordset")
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
    <td><span class="H1"><%= strTXTManegalbum %> </span>| <a href="Manegment_artist.asp"><%= strTXTBack %> <%= strTXTManegartist%></a></td>
  </tr>
  <tr>
    <td><% response.Write(strer) %></td>
  </tr>
  <tr>
    <td>
	<table width="100%"  border="0" class="border">
      <tr class="text2">
        <td><div align="center"><span class="text2"><%= strTXTDelete %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTEdit %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTAddSong %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTViewSong %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTCountSong %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTStyle %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTNameSinger %></span></div></td>
        <td><div align="center"><span class="text2"><%= strTXTNameAlbum %></span></div></td>
      </tr>
<% 
'Show Recorde 
for int_Number_Show = 1 To Max_Number_show
if objRS.EOF then exit For
if (objRS.fields.item("ID_artist").value = (int_ID_artist)) or (objRS.fields.item("ID_artist").value = (int_ID)) then 
%>
      <tr>
        <td><form action="Code_page/Delete_album_code.asp" method="post" name="Delete_Album" id="Delete_Album">
          <div align="center">
            <input name="ID_album" type="hidden" id="ID_album" value="<%= objRS.fields.item("ID_album").value %>">
            <input name="ID_artist" type="hidden" id="ID_artist" value="<% response.write(int_id) %>">
            <input name="Delete_album" type="submit" id="Delete_album" value="<%= strTXTDelete %>">
          </div>
        </form></td>
        <td><form action="Edit_album.asp?ID=<%= objRS.fields.item("ID_album").value %>&artistID=<% Response.Write(int_ID) %>" method="post" name="Edit" id="Edit">
          <div align="center">
            <input name="Edit_album" type="submit" id="Edit_album" value="<%= strTXTEdit %>">
              </div>
        </form></td>
        <td>
<form action="Add_song.asp" method="post" name="add_album" id="add_album">
  <div align="center">
  <input name="ID_album" type="hidden" id="ID_album" value="<%= objRS.fields.item("ID_album").value %>">
  <input name="ID_artist" type="hidden" id="ID_artist" value="<%= objRS.fields.item("ID_artist").value %>">
  <input name="name_album" type="hidden" id="name_album" value="<%= objRS.fields.item("name_album").value %>">
  <input name="Count_song" type="hidden" id="Count_song" value="<%= objRS.fields.item("Count_Song").value %>">
  <input name="name_artist" type="hidden" id="name_artist" value="<%= objRS.fields.item("name_artist").value %>">
  <input name="Add_Soung" type="submit" id="Add_Soung" value="<%= strTXTAddSong %>">
  </div>
</form>		</td>
        <td><form name="View" method="post" action="Manegment_Song.asp?ID=<%= objRS.fields.item("ID_album").value %>&album=<%= objRS.fields.item("ID_album").value %>">
            <div align="center">
  <input name="ID_album" type="hidden" id="ID_album" value="<%= objRS.fields.item("ID_album").value %>">
  <input name="ID_artist" type="hidden" id="ID_artist" value="<%= objRS.fields.item("ID_artist").value %>">
              <input name="View_song" type="submit" id="View_song" value="<%= strTXTViewSong %>">
            </div>
        </form></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("Count_Song").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("style_album").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("name_artist").value %></span></div></td>
        <td><div align="center"><span class="text3"><%= objRS.fields.item("name_album").value %></span></div></td>
      </tr>
<%
 
end if
'Move next record
objRS.movenext()
Next
%>
	</table>
<% end if %>
	</td>
  </tr>
</table>
<!--#include file="Footer.asp" -->