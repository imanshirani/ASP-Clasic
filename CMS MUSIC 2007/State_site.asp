<%
'Dim orginal Page
Dim strSQLArtist 
Dim objRSArtist 
Dim strSQLalbum 
Dim objRSalbum
Dim strSQLsong 
Dim objRSsong


'SQL Conect to datebase
strSQLArtist  = "SELECT ID_artist FROM tbl_artist"
strSQLalbum   = "SELECT ID_album FROM tbl_album"
strSQLsong    = "SELECT ID_song FROM tbl_song"
'Recordset Open and Query the database tbl_ARtist
SET objRSArtist = server.CreateObject("ADODB.Recordset")
objRSArtist.cursortype = 1
objRSArtist.open strSQLArtist ,objconn
'Recordset Open and Query the database tbl_Album
SET objRSalbum = server.CreateObject("ADODB.Recordset")
objRSalbum.cursortype = 1
objRSalbum.open strSQLalbum ,objconn
'Recordset Open and Query the database tbl_Song
Set objRSsong = server.CreateObject("ADODB.Recordset")
objRSsong.cursortype = 1
objRSsong.open strSQLsong ,objconn
%>
<table width="100%"  border="0">
  <tr>
    <td colspan="2"><span class="H1"><%= strTXTTotalRecord %></span></td>
  </tr>
  <tr>
    <td><div align="center"><span class="text3"><%= objRSArtist.RecordCount%></span></div></td>
    <td><div align="right"><span class="text2"><%= strTXTArtistRecord %></span></div></td>
  </tr>
  <tr>
    <td><div align="center"><span class="text3"><%= objRSalbum.RecordCount%></span></div></td>
    <td><div align="right"><span class="text2"><%= strTXTAlbumRecord %></span></div></td>
  </tr>
  <tr>
    <td><div align="center"><span class="text3"><%= objRSsong.RecordCount%></span></div></td>
    <td><div align="right"><span class="text2"><%= strTXTSongRecord %></span></div></td>
  </tr>
  <tr>
    <td colspan="2"><span class="H1"><%= strTXTVisit %></span></td>
  </tr>
  <tr>
    <td><div align="center"><span class="text3"><%=counter_day%></span></div></td>
    <td><div align="right"><span class="text2"><%= strTXTDay %></span></div></td>
  </tr>
  <tr>
    <td><div align="center"><span class="text3"><%=counter_Week%></span></div></td>
    <td><div align="right"><span class="text2"><%= strTXTWeek %></span></div></td>
  </tr>
  <tr>
    <td><div align="center"><span class="text3"><%=counter_mon%></span></div></td>
    <td><div align="right"><span class="text2"><%= strTXTMonth %></span></div></td>
  </tr>
  <tr>
    <td><div align="center"><span class="text3"><%=counter_total%></div></td>
    <td><div align="right"><span class="text2"><%= strTXTTotalVisit %></div></td>
  </tr>
</table>


