<table width="768"  border="0" align="center">
  <tr>
    <td colspan="2"><!--#include file="Header.asp"--></td>
  </tr>
  <tr>
	<td colspan="2">
<table width="100%"  border="0">
  <tr>
    <td align="center">
	<table width="80%"  border="0">
 		 <tr>
  		  <td width="80%" valign="middle" class="text"><a href="Song_Show.asp?ID=A">A</a> | <a href="Song_Show.asp?ID=B">B</a> | <a href="Song_Show.asp?ID=C">C</a> | <a href="Song_Show.asp?ID=D">D</a> | <a href="Song_Show.asp?ID=E">E</a> | <a href="Song_Show.asp?ID=F">F</a> | <a href="Song_Show.asp?ID=G">G</a> | <a href="Song_Show.asp?ID=H">H</a> | <a href="Song_Show.asp?ID=I">I</a> | <a href="Song_Show.asp?ID=J">J</a> | <a href="Song_Show.asp?ID=K">K</a> | <a href="Song_Show.asp?ID=L">L</a> | <a href="Song_Show.asp?ID=M">M</a> | <a href="Song_Show.asp?ID=N">N</a> | <a href="Song_Show.asp?ID=O">O</a> | <a href="Song_Show.asp?ID=P">P</a> | <a href="Song_Show.asp?ID=Q">Q</a> | <a href="Song_Show.asp?ID=R">R</a> | <a href="Song_Show.asp?ID=S">S</a> | <a href="Song_Show.asp?ID=T">T</a> | <a href="Song_Show.asp?ID=U">U</a> | <a href="Song_Show.asp?ID=V">V</a> | <a href="Song_Show.asp?ID=W">W</a> | <a href="Song_Show.asp?ID=X">X</a> | <a href="Song_Show.asp?ID=Y">Y</a> | <a href="Song_Show.asp?ID=Z">Z</a> | <a href="Song_Show.asp?ID=All">All</a> </td>
 		  <td width="20%" valign="middle">
<form action="Song_Show.asp" method="get">
<select name="ID">
  <option value="All" selected>All</option>
  <option value="A">A</option>
  <option value="B">B</option>
  <option value="C">C</option>
  <option value="D">D</option>
  <option value="E">E</option>
  <option value="F">F</option>
  <option value="G">G</option>
  <option value="H">H</option>
  <option value="I">I</option>
  <option value="J">J</option>
  <option value="K">K</option>
  <option value="L">L</option>
  <option value="M">M</option>
  <option value="N">N</option>
  <option value="O">O</option>
  <option value="P">P</option>
  <option value="Q">Q</option>
  <option value="R">R</option>
  <option value="S">S</option>
  <option value="T">T</option>
  <option value="U">U</option>
  <option value="V">V</option>
  <option value="W">W</option>
  <option value="X">X</option>
  <option value="Y">Y</option>
  <option value="Z">Z</option>
</select>
<input type="submit" value="Go">
</form>
		  </td>
 		 </tr>
	</table>
	</td>
  </tr>
</table>

<% 
Dim strcase
strcase=request.QueryString("ID")

'SQL Conect to datebase Select case
	strSQL = "SELECT * FROM tbl_Song"
select case strcase
case "ALL"
strSQL = "SELECT * FROM tbl_Song"
case "A"
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'A%'"
case "B" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'B%'"
case "C" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'C%'"
case "D" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'D%'"
case "E"
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'E%'"
case "F" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'F%'"
case "G" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'G%'"
case "H" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'H%'"
case "I"
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'I%'"
case "J" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'J%'"
case "K" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'K%'"
case "L" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'L%'"
case "M"
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'M%'"
case "N" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'N%'"
case "O" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'O%'"
case "P" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'P%'"
case "Q" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'Q%'"
case "R" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'R%'"
case "S" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'S%'"
case "T"
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'T%'"
case "U" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'U%'"
case "V" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'V%'"
case "W" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'W%'"
case "X" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'Z%'"
case "Y" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'Y%'"
case "Z" 
strSQL = "SELECT * FROM tbl_Song WHERE name_Song LIKE 'Z%'"
end select 


'Conect and open Database
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn
%>
<table width="100%">
  <tr>
    <td><div align="center"><span class="text2"><%= strTXTCount %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTSize %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTTime %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTNameSinger %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTNameAlbum %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTLink_64 %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTLink_128 %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTNameSong %></span></div></td>
  </tr>
<%
'Show repet Record
Do While Not objRS.EOF
%>
  <tr>
    <td><div align="center"><span class="text3"><%= objRS("Count")%></span></div></td>
    <td><div align="center"><span class="text3"><%= objRS("size_Song")%></span></div></td>
    <td><div align="center"><span class="text3"><%= objRS("time_Song")%></span></div></td>
    <td><div align="center"><a href="javascript:void(0)"onclick="window.open('Show_artist.asp?ID=<%= objRS.Fields.item("name_artist").value %>','miniwin','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=468,height=500')"><%= objRS.Fields.item("name_artist").value %></a></div></td>
    <td><div align="center"><a href="javascript:void(0)"onclick="window.open('Show_album.asp?album=<%= objRS.Fields.item("name_album").value %>&ID=<%= objRS.Fields.item("name_artist").value %>','miniwin','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=1,width=468,height=500')"><%= objRS.Fields.item("name_album").value %></a></div></td>
    <td><form action="Code_page/Count_song_code.asp" method="post" name="64_download" id="64_download">
              <div align="center">
                <input name="ID_song" type="hidden" id="ID_song" value="<%= objRS.fields.item("ID_song").value %>">
                <input name="Count_old" type="hidden" id="Count_old" value="<%= objRS.fields.item("Count").value %>">            
                <input name="Link_song" type="hidden" id="Link_song" value="<%= objRS.fields.item("link_128_Song").value %>">
                <input name="Download" type="image" id="Download" src="images/Down128.gif" width="20" height="20" border="0">
              </div>
    </form></td>
    <td><form action="Code_page/Count_song_code.asp" method="post" name="128_download" id="128_download">
            <div align="center">
              <input name="ID_song" type="hidden" id="ID_song" value="<%= objRS.fields.item("ID_song").value %>">
              <input name="Count_old" type="hidden" id="Count_old" value="<%= objRS.fields.item("Count").value %>">
              <input name="Link_song" type="hidden" id="Link_song22" value="<%= objRS.fields.item("link_64_Song").value %>">            
              <input name="Download" type="image" id="Download" src="images/Down64.gif" width="20" height="20" border="0">
            </div>
    </form></td>
    <td><div align="center"><span class="text3"><%= objRS("name_Song")%></span></div></td>
  </tr>
<%
'Show loob record
objRS.MoveNext
Loop
' Close Recordset
objRS.close
set objRS = nothing
%>
</table>
  
	</td>
  </tr>
  <tr>
    <td colspan="2"><!--#include file="Footer.asp"--></td>
  </tr>
</table>