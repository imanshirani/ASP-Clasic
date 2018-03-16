<link href="Css/Defulte.css" rel="stylesheet" type="text/css">
<table width="100%"  border="0" class="text">
  <tr>
	<% 'show Artist meno
		if Bol_show_Artist_meno = true then %>
    <td align="left" width="50" class="text"><a href="Artist_Show.asp?ID=All"><%= strTXTNameSinger %></a></td>
  	<td align="center"><a href="Artist_Show.asp?ID=A">A</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=B">B</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=C">C</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=D">D</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=E">E</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=F">F</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=G">G</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=H">H</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=I">I</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=J">J</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=K">K</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=L">L</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=M">M</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=N">N</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=O">O</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=P">P</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=Q">Q</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=R">R</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=S">S</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=T">T</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=U">U</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=V">V</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=W">W</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=X">X</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=Y">Y</a></td>
    <td align="center"><a href="Artist_Show.asp?ID=Z">Z</a></td>
	<% end if %>
  </tr>
  <tr>
	<% 'show album meno
		if Bol_show_Album_meno = true then %>
    <td align="left" width="50" class="atext_meno_Category"><a href="Album_Show.asp?ID=All"><%= strTXTNameAlbum %></a></td>
  	<td align="center"><a href="Album_Show.asp?ID=A">A</a></td>
    <td align="center"><a href="Album_Show.asp?ID=B">B</a></td>
    <td align="center"><a href="Album_Show.asp?ID=C">C</a></td>
    <td align="center"><a href="Album_Show.asp?ID=D">D</a></td>
    <td align="center"><a href="Album_Show.asp?ID=E">E</a></td>
    <td align="center"><a href="Album_Show.asp?ID=F">F</a></td>
    <td align="center"><a href="Album_Show.asp?ID=G">G</a></td>
    <td align="center"><a href="Album_Show.asp?ID=H">H</a></td>
    <td align="center"><a href="Album_Show.asp?ID=I">I</a></td>
    <td align="center"><a href="Album_Show.asp?ID=J">J</a></td>
    <td align="center"><a href="Album_Show.asp?ID=K">K</a></td>
    <td align="center"><a href="Album_Show.asp?ID=L">L</a></td>
    <td align="center"><a href="Album_Show.asp?ID=M">M</a></td>
    <td align="center"><a href="Album_Show.asp?ID=N">N</a></td>
    <td align="center"><a href="Album_Show.asp?ID=O">O</a></td>
    <td align="center"><a href="Album_Show.asp?ID=P">P</a></td>
    <td align="center"><a href="Album_Show.asp?ID=Q">Q</a></td>
    <td align="center"><a href="Album_Show.asp?ID=R">R</a></td>
    <td align="center"><a href="Album_Show.asp?ID=S">S</a></td>
    <td align="center"><a href="Album_Show.asp?ID=T">T</a></td>
    <td align="center"><a href="Album_Show.asp?ID=U">U</a></td>
    <td align="center"><a href="Album_Show.asp?ID=V">V</a></td>
    <td align="center"><a href="Album_Show.asp?ID=W">W</a></td>
    <td align="center"><a href="Album_Show.asp?ID=X">X</a></td>
    <td align="center"><a href="Album_Show.asp?ID=Y">Y</a></td>
    <td align="center"><a href="Album_Show.asp?ID=Z">Z</a></td>
	<% end if %>
  </tr>
  <tr>
	<% 'show song meno
		if Bol_show_song_meno = true then %>
    <td align="left" width="50" class="atext_meno_Category"><a href="Song_Show.asp?ID=All"><%= strTXTNameSong %></a> </td>
  	<td align="center"><a href="Song_Show.asp?ID=A">A</a></td>
    <td align="center"><a href="Song_Show.asp?ID=B">B</a></td>
    <td align="center"><a href="Song_Show.asp?ID=C">C</a></td>
    <td align="center"><a href="Song_Show.asp?ID=D">D</a></td>
    <td align="center"><a href="Song_Show.asp?ID=E">E</a></td>
    <td align="center"><a href="Song_Show.asp?ID=F">F</a></td>
    <td align="center"><a href="Song_Show.asp?ID=G">G</a></td>
    <td align="center"><a href="Song_Show.asp?ID=H">H</a></td>
    <td align="center"><a href="Song_Show.asp?ID=I">I</a></td>
    <td align="center"><a href="Song_Show.asp?ID=J">J</a></td>
    <td align="center"><a href="Song_Show.asp?ID=K">K</a></td>
    <td align="center"><a href="Song_Show.asp?ID=L">L</a></td>
    <td align="center"><a href="Song_Show.asp?ID=M">M</a></td>
    <td align="center"><a href="Song_Show.asp?ID=N">N</a></td>
    <td align="center"><a href="Song_Show.asp?ID=O">O</a></td>
    <td align="center"><a href="Song_Show.asp?ID=P">P</a></td>
    <td align="center"><a href="Song_Show.asp?ID=Q">Q</a></td>
    <td align="center"><a href="Song_Show.asp?ID=R">R</a></td>
    <td align="center"><a href="Song_Show.asp?ID=S">S</a></td>
    <td align="center"><a href="Song_Show.asp?ID=T">T</a></td>
    <td align="center"><a href="Song_Show.asp?ID=U">U</a></td>
    <td align="center"><a href="Song_Show.asp?ID=V">V</a></td>
    <td align="center"><a href="Song_Show.asp?ID=W">W</a></td>
    <td align="center"><a href="Song_Show.asp?ID=X">X</a></td>
    <td align="center"><a href="Song_Show.asp?ID=Y">Y</a></td>
    <td align="center"><a href="Song_Show.asp?ID=Z">Z</a></td>
	<% end if %>
  </tr>
    <tr>
	<% 'show Country meno
		if Bol_show_Country_meno = true then %>
    <td align="left" width="50"><a href="Country_Show.asp?ID=All"><%= strTXTCountry %></a></td>
  	<td align="center"><a href="Country_Show.asp?ID=A">A</a></td>
    <td align="center"><a href="Country_Show.asp?ID=B">B</a></td>
    <td align="center"><a href="Country_Show.asp?ID=C">C</a></td>
    <td align="center"><a href="Country_Show.asp?ID=D">D</a></td>
    <td align="center"><a href="Country_Show.asp?ID=E">E</a></td>
    <td align="center"><a href="Country_Show.asp?ID=F">F</a></td>
    <td align="center"><a href="Country_Show.asp?ID=G">G</a></td>
    <td align="center"><a href="Country_Show.asp?ID=H">H</a></td>
    <td align="center"><a href="Country_Show.asp?ID=I">I</a></td>
    <td align="center"><a href="Country_Show.asp?ID=J">J</a></td>
    <td align="center"><a href="Country_Show.asp?ID=K">K</a></td>
    <td align="center"><a href="Country_Show.asp?ID=L">L</a></td>
    <td align="center"><a href="Country_Show.asp?ID=M">M</a></td>
    <td align="center"><a href="Country_Show.asp?ID=N">N</a></td>
    <td align="center"><a href="Country_Show.asp?ID=O">O</a></td>
    <td align="center"><a href="Country_Show.asp?ID=P">P</a></td>
    <td align="center"><a href="Country_Show.asp?ID=Q">Q</a></td>
    <td align="center"><a href="Country_Show.asp?ID=R">R</a></td>
    <td align="center"><a href="Country_Show.asp?ID=S">S</a></td>
    <td align="center"><a href="Country_Show.asp?ID=T">T</a></td>
    <td align="center"><a href="Country_Show.asp?ID=U">U</a></td>
    <td align="center"><a href="Country_Show.asp?ID=V">V</a></td>
    <td align="center"><a href="Country_Show.asp?ID=W">W</a></td>
    <td align="center"><a href="Country_Show.asp?ID=X">X</a></td>
    <td align="center"><a href="Country_Show.asp?ID=Y">Y</a></td>
    <td align="center"><a href="Country_Show.asp?ID=Z">Z</a></td>
	<% end if %>
  </tr>
</table>
