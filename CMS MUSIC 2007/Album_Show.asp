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
  		  <td width="80%" valign="middle" class="text"><a href="Album_Show.asp?ID=A">A</a> | <a href="Album_Show.asp?ID=B">B</a> | <a href="Album_Show.asp?ID=C">C</a> | <a href="Album_Show.asp?ID=D">D</a> | <a href="Album_Show.asp?ID=E">E</a> | <a href="Album_Show.asp?ID=F">F</a> | <a href="Album_Show.asp?ID=G">G</a> | <a href="Album_Show.asp?ID=H">H</a> | <a href="Album_Show.asp?ID=I">I</a> | <a href="Album_Show.asp?ID=J">J</a> | <a href="Album_Show.asp?ID=K">K</a> | <a href="Album_Show.asp?ID=L">L</a> | <a href="Album_Show.asp?ID=M">M</a> | <a href="Album_Show.asp?ID=N">N</a> | <a href="Album_Show.asp?ID=O">O</a> | <a href="Album_Show.asp?ID=P">P</a> | <a href="Album_Show.asp?ID=Q">Q</a> | <a href="Album_Show.asp?ID=R">R</a> | <a href="Album_Show.asp?ID=S">S</a> | <a href="Album_Show.asp?ID=T">T</a> | <a href="Album_Show.asp?ID=U">U</a> | <a href="Album_Show.asp?ID=V">V</a> | <a href="Album_Show.asp?ID=W">W</a> | <a href="Album_Show.asp?ID=X">X</a> | <a href="Album_Show.asp?ID=Y">Y</a> | <a href="Album_Show.asp?ID=Z">Z</a> | <a href="Album_Show.asp?ID=All">All</a> </td>
 		  <td width="20%" valign="middle" class="text">
<form action="Album_Show.asp" method="get">
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
	strSQL = "SELECT * FROM tbl_Album"
select case strcase
case "ALL"
strSQL = "SELECT * FROM tbl_Album"
case "A"
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'A%'"
case "B" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'B%'"
case "C" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'C%'"
case "D" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'D%'"
case "E"
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'E%'"
case "F" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'F%'"
case "G" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'G%'"
case "H" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'H%'"
case "I"
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'I%'"
case "J" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'J%'"
case "K" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'K%'"
case "L" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'L%'"
case "M"
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'M%'"
case "N" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'N%'"
case "O" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'O%'"
case "P" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'P%'"
case "Q" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'Q%'"
case "R" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'R%'"
case "S" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'S%'"
case "T"
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'T%'"
case "U" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'U%'"
case "V" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'V%'"
case "W" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'W%'"
case "X" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'Z%'"
case "Y" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'Y%'"
case "Z" 
strSQL = "SELECT * FROM tbl_Album WHERE name_Album LIKE 'Z%'"
end select 


'Conect and open Database
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn
%>
<table width="100%">
  <tr>
    <td><div align="center"><span class="text2"><%= strTXTCountSong %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTDate %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTNameSinger %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTStyle %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTNameAlbum %></span></div></td>
    <td><div align="center"><span class="text2"><%= strTXTPicture %></span></div></td>
  </tr>
<%
'Show repet Record
Do While Not objRS.EOF
%>
  <tr>
    <td><div align="center"><span class="text3"><%= objRS("Count_Song")%></span></div></td>
    <td><div align="center"><span class="text3"><%= objRS("date_album")%></span></div></td>
    <td><div align="center"><a href="javascript:void(0)"onclick="window.open('Show_artist.asp?ID=<%= objRS.Fields.item("name_artist").value %>','miniwin','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=468,height=500')"><%= objRS.Fields.item("name_artist").value %></a></div></td>
    <td><div align="center"><span class="text3"><%= objRS("style_album") %></span></div></td>
    <td><div align="center"><a href="javascript:void(0)"onclick="window.open('Show_album.asp?album=<%= objRS.Fields.item("name_album").value %>&ID=<%= objRS.Fields.item("name_artist").value %>','miniwin','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=1,width=468,height=500')"><%= objRS.Fields.item("name_album").value %></a></div></td>
    <td><div align="center"><a href="<%= objRS("cover_front_album")%>"><img src="<%= objRS("cover_front_album")%>" alt="<%= objRS("name_album")%>" width="50" height="50" border="0" ></a></div></td>
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