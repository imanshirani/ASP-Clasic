<!--#include file="DB.asp" -->
<!--#include file="Header_admin.asp" -->
<title> Add New Album</title>
<%

response.Buffer = True
	
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

%>
<table width="100%"  border="0">
  <tr>
    <td class="H1"><%= strTXTAddAlbum %></td>
  </tr>
  <tr>
    <td>
	<form action="Code_page/Add_album_code.asp" method="post" name="add_album">
	<table width="100%"  border="0" class="border">
  <tr>
    <td colspan="2"><input name="ID_artist" type="hidden"  id="ID_artist" value="<%= Request.Form("ID_artist")%>">
<input name="name_artist" type="hidden"  id="name_artist" value="<%= Request.Form("name_artist")%>">
      <input name="count_album" type="hidden"  id="count_album" value="<%= Request.Form("count_album")%>"></td>
    </tr>
  <tr>
    <td><div align="left">
      <input name="name_album" type="text" id="name_album">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTNameAlbum %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="date_album" type="text" id="date_album" value="<%= Date() %>">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTDate %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="Style_album" type="text" id="Style_album">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTStyle %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="Cover_front_album" type="text" id="Cover_front_album">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTCover1 %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="Cover_back_album" type="text" id="Cover_back_album">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTCover2 %></div></td>
  </tr>
  <tr>
    <td colspan="2"><input type="submit" name="Submit" value="<%= strTXTSend %>">
      </td>
  </tr>
</table>

	</form>
	</td>
  </tr>
</table>
<!--#include file="Footer.asp" -->