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

%>
<table width="100%"  border="0">
  <tr>
    <td class="H1"><%= strTXTAddSong %></td>
  </tr>
  <tr>
    <td>
	<form action="Code_page/Add_song_code.asp" method="post" name="add_album">
	<table width="100%"  border="0" class="border">
  <tr>
    <td colspan="2"><input name="ID_album" type="hidden" id="ID_album" value="<%= Request.Form("ID_album")%>">
<input name="ID_artist" type="hidden"value="<%= Request.Form("ID_artist")%>">
<input name="name_album" type="hidden" value="<%= Request.Form("name_album")%>">
      <input name="Count_song" type="hidden" value="<%= Request.Form("Count_song")%>">
      <input name="name_artist" type="hidden" value="<%= Request.Form("name_artist")%>">      </td>
    </tr>
  <tr>
    <td><div align="left">
      <input name="name_song" type="text" id="name_song">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTNameSong %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="size_song" type="text" id="size_song" value="1.5"> 
      <%= strTXTonlySize %></div></td>
    <td class="text3"><div align="right"><%= strTXTSize %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="time_song" type="text" id="time_song" value="2:00:00">
      <%= strTXTonlytime %></div></td>
    <td class="text3"><div align="right"><%= strTXTTime %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="link_128_song" type="text" id="link_128_song">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTLink_128 %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="link_64_song" type="text" id="link_64_song">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTLink_64 %></div></td>
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