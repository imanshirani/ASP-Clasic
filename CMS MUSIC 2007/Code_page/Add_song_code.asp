<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="DB.asp" -->
<%
response.Buffer = True
	
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

'Dim orginal Page
Dim strartist			'Holds Artist
Dim intcountalbum		'Holds Album number
Dim intSong				'Holds Song add
Dim bolFound
Dim intID
Dim intID_song

'set dim 
set strartist = Request.Form("name_artist")
set intcountalbum = Request.Form("count_album")
set intID = Request.Form("ID_artist")
set intID_song= Request.Form("ID_album")

'Open and conction to database
set objRS = Server.CreateObject("ADODB.Recordset")
objRS.locktype = 1
objRS.open "tbl_song",objconn,2,adcmdtable

'Add Record to database
objRS.AddNew
objRS("name_Song") = Request.Form("name_song")
objRS("link_128_Song") = Request.Form("link_128_song")
objRS("link_64_Song") = Request.Form("link_64_song")
objRS("size_Song") = Request.Form("size_song")
objRS("time_Song") = Request.Form("time_song")
objRS("name_artist") = Request.Form("name_artist")
objRS("name_album") = Request.Form("name_album")
objRS("ID_artist") = intID
objRS("ID_album") = intID_song
objRS.update

'Close conction and recordset
objRS.close
set objRS = Nothing


' Open connection to the database (For Edite Album)
	Set objRS= server.CreateObject("ADODB.recordset")
	objRS.open  "tbl_album",objconn, ,adLockoptimistic ,adcmdtable
	bolFound = false
	
	'Try to find User Entry
	Do Until objRS.EOF Or bolFound
	if (StrComp(objRS.fields("ID_album"),intID_song,vbTextCompare) = 0 )then
		bolFound = True
		Else 
		objRs.Movenext
		End if 
		Loop
'Edite Recordset
objRS("Count_Song")= objRS("Count_Song") + 1
objRS.update

'Close conction and recordset
objRS.close
set objRS = Nothing

' Open connection to the database (For Edite Artist)
	Set objRS= server.CreateObject("ADODB.recordset")
	objRS.open  "tbl_artist",objconn, ,adLockoptimistic ,adcmdtable
	bolFound = false
	
	'Try to find User Entry
	Do Until objRS.EOF Or bolFound
	if (StrComp(objRS.fields("ID_artist"),intID,vbTextCompare) = 0 )then
		bolFound = True
		Else 
		objRs.Movenext
		End if 
		Loop
'Edite Recordset
objRS("Count_song")= objRS("Count_song") + 1
objRS.update

'Close conction and recordset
objRS.close
set objRS = Nothing
objconn.close
set objconn = Nothing

'redirect page
response.Redirect("../Manegment_album.asp?ID="& intID &"")

%>