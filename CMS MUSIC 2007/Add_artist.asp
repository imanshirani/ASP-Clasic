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
'Dim roginal page
Dim strER
'Set query
strER = Request.QueryString("ER")
%>
<table width="100%"  border="0">
  <tr>
    <td class="H1"><%= strTXTAddArtist %></td>
  </tr>
  <tr>
    <td>
	<form action="Code_page/Add_artist_code.asp" method="post" name="add_artist">
	<table width="100%"  border="0" class="border">
    <tr><td colspan="2"><%= Response.Write(strER) %></td></tr>  
	<tr>
        <td><div align="left">
              <input name="name_artist" type="text" id="name_artist">
          *</div></td>
        <td class="text3"><div align="right" class="text3"><%= strTXTNameSinger %></div></td>
      </tr>
      <tr>
        <td>
          <div align="left">
            <select name="style_artist" id="style_artist">
		    <!-- Include Music style include file -->
            <!-- #include file="includes/select_Music_style_list.asp" -->
            </select>
		    </div></td>
        <td class="text3"><div align="right"><%= strTXTStyle %></div></td>
      </tr>
      <tr>
        <td>
          <div align="left">
            <select name="Country_artist" id="Country_artist">
		    <!-- Include countires include file -->
            <!-- #include file="includes/select_countries_list.asp" -->
            </select>
		    </div></td>
        <td class="text3"><div align="right"><%= strTXTCountry %></div></td>
      </tr>
      <tr>
        <td><div align="left">
          <input name="Pic_artist" type="text" id="Pic_artist">
        </div></td>
        <td class="text3"><div align="right"><%= strTXTPicture %></div></td>
      </tr>
      <tr>
        <td><div align="left">
          <textarea name="BiografY" cols="50" rows="5" wrap="VIRTUAL" id="BiografY"></textarea>
        </div></td>
        <td class="text3"><div align="right"><%= strTXTBiyo %></div></td>
      </tr>
      <tr>
        <td colspan="2"><input type="submit" name="Submit" value="<%= strTXTSend %>">
          </td>
      </tr>
    </table>
	</form>
	</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="Footer.asp" -->