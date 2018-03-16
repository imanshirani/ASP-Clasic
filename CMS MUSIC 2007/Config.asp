<% 
'Dim Orginal Page
Dim StrSitname					'Holds Name Site
Dim StrLinksite					'Holds Link SIte
Dim StrEmailsite				'Holds Email Site
Dim intShow_banner				'Holds Show Banner Number
Dim intShow_news				'Holds Show News Number
Dim intShow_album				'Holds Show News album
Dim Bol_Show_album				'Holds Show album
Dim Bol_Show_banner				'Holds Show banner
Dim Bol_Show_news				'Holds Show News
Dim Bol_show_Artist_meno
Dim Bol_show_Album_meno
Dim Bol_show_song_meno
Dim Bol_show_Country_meno

'SQL Conect to datebase 
strSQL = "SELECT * FROM tbl_configortion"
'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn
StrSitname = objRS("name_site")
StrLinksite = objRS("link_site")
StrEmailsite = objRS("email_site")
intShow_banner = objRS("Show_banner_number")
intShow_news = objRS("Show_news_number")
intShow_album = objRS("Show_album_number")
Bol_Show_banner = objRS("Show_banner")
Bol_Show_news  = objRS("Show_news")
Bol_Show_album = objRS("Show_album")
Bol_show_Artist_meno = objRS("show_Artist_meno")
Bol_show_Album_meno = objRS("show_Album_meno")
Bol_show_song_meno = objRS("show_song_meno")
Bol_show_Country_meno = objRS("show_Country_meno")
%>
