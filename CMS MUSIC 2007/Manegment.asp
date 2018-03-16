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

'SQL Conect to datebase 
strSQL = "SELECT * FROM tbl_configortion"

'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn
%>
<table width="100%"  border="0" class="border">
  <tr>
    <td>
	<form action="code_page/.asp" method="get" name="Edit_site" id="Edit_site">
	<table width="100%"  border="0">
      <tr>
        <td width="28%" class="text3" style="font-size: 10"><div align="left">Name Site </div></td>
        <td width="72%"><div align="left">
<input name="ID_site" type="hidden" id="ID_site" value="<%= objRS("ID_site") %>">              
<input name="name_site" type="text" id="name_site" value="<%= objRS("name_site") %>">
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Link site</div></td>
        <td><div align="left">
          <input name="link_site" type="text" id="link_site" value="<%= objRS("link_site") %>">
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Email</div></td>
        <td><div align="left">
          <input name="email" type="text" id="email" value="<%= objRS("email_site") %>">
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">username</div></td>
        <td><div align="left">
          <input name="username" type="text" id="username" value="<%= objRS("Username")%>"
>
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Password</div></td>
        <td><div align="left">
          <input name="Password" type="password" id="Password" value="<%= objRS("Password")%>">
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Are Show Album </div></td>
        <td><div align="left">
          <select name="select_album" id="select7">
<option value="<%= objrs.fields.item("Show_album").value %>" selected>
		    <% If objrs.fields.item("Show_album").value = False then
				Response.Write("False")
				Else
				Response.Write("True")
			 end IF %>
            <option value="true">True</option>
            <option value="false">False</option>
                </select>
</div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Number</div></td>
        <td><div align="left">
          <input name="number_album" type="text" id="number_album" value="<%= objRS("Show_album_number") %>">
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Are Show News </div></td>
        <td><div align="left">
          <select name="select_news" id="select_news">
<option value="<%= objrs.fields.item("Show_news").value %>" selected>
		    <% If objrs.fields.item("Show_news").value = False then
				Response.Write("False")
				Else
				Response.Write("True")
			 end IF %>
            <option value="true">True</option>
            <option value="false">False</option>
                </select>
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Number</div></td>
        <td><div align="left">
          <input name="Number_news" type="text" id="Number_news" value="<%= objRS("Show_news_number") %>
">
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Are Show Banner </div></td>
        <td><div align="left">
          <select name="select_banner" id="select_banner">
<option value="<%= objrs.fields.item("Show_banner").value %>" selected>
		    <% If objrs.fields.item("Show_banner").value = False then
				Response.Write("False")
				Else
				Response.Write("True")
			 end IF %>
            <option value="true">True</option>
            <option value="false">False</option>
                </select>
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Number</div></td>
        <td><div align="left">
          <input name="Numbetr_banner" type="text" id="Numbetr_banner" value="<%= objRS("Show_banner_number") %>
">        
          </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Show_Artist_meno</div></td>
        <td><div align="left">
          <select name="select_artist" id="select_artist">
<option value="<%= objrs.fields.item("Show_Artist_meno").value %>" selected>
		    <% If objrs.fields.item("Show_Artist_meno").value = False then
				Response.Write("False")
				Else
				Response.Write("True")
			 end IF %>
            <option value="true">True</option>
            <option value="false">False</option>
                </select>
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Show_Album_meno</div></td>
        <td><div align="left">
          <select name="select_album" id="select_album">
<option value="<%= objrs.fields.item("Show_Album_meno").value %>" selected>
		    <% If objrs.fields.item("Show_Album_meno").value = False then
				Response.Write("False")
				Else
				Response.Write("True")
			 end IF %>
            <option value="true">True</option>
            <option value="false">False</option>
                </select>
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Show_Song_meno</div></td>
        <td><div align="left">
          <select name="select_song" id="select_song">
<option value="<%= objrs.fields.item("Show_Song_meno").value %>" selected>
		    <% If objrs.fields.item("Show_Song_meno").value = False then
				Response.Write("False")
				Else
				Response.Write("True")
			 end IF %>
            <option value="true">True</option>
            <option value="false">False</option>
                </select>
        </div></td>
      </tr>
      <tr>
        <td class="text3" style="font-size: 10"><div align="left">Show_Country_meno</div></td>
        <td><div align="left">
          <select name="select_country" id="select_country">
<option value="<%= objrs.fields.item("Show_Country_meno").value %>" selected>
		    <% If objrs.fields.item("Show_Country_meno").value = False then
				Response.Write("False")
				Else
				Response.Write("True")
			 end IF %>
            <option value="true">True</option>
            <option value="false">False</option>
            </select>
        </div></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
            <input type="submit" name="Submit" value="Submit">
            <input name="Rest" type="reset" id="Rest" value="Reset">
        </div></td>
        </tr>
    </table>
	</form>	</td>
  </tr>
</table>


<!--#include file="Footer.asp" -->