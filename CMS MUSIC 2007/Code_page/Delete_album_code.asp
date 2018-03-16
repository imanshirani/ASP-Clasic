<% @ Language=VBScript %>
<% Option Explicit %>
<!--#include file="DB.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="fa">
<%
response.Buffer = True
	
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"



	Dim bolFound
	Dim int_id
	Dim int_id_artist
	Dim intid
	
	int_id = Request.Form("ID_album")
	int_id_artist = Request.Form("ID_artist")

	'----------------------
	' Open connection to the database
	Set objRS= server.CreateObject("ADODB.recordset")
	objRS.open  "tbl_album",objconn, ,adLockoptimistic ,adcmdtable
	bolFound = false
	
	'Try to find User Entry
	Do While Not (objRS.EOF Or bolFound)
	if (StrComp(objRS.fields("ID_album"),int_id,vbTextCompare) = 0 )then
		bolFound = True
		Else 
		objRs.Movenext
		End if 
		Loop
		
	'Check Count album and song
	if objRS("Count_Song")<> 0  then 
	'redirect page
	Response.Redirect("../Manegment_album.asp?ID="& int_id_artist &"&ER="&strTXTDeletealbum&"")
	else 
	'Delet RecordSet
	objRS.Delete
		
	' Close Connection
	objRS.Close 
	Set objRS = Nothing

	end if 
	
	'Delete album Count
	' Open connection to the database (For Edite Artist)
	Set objRS= server.CreateObject("ADODB.recordset")
	objRS.open  "tbl_artist",objconn, ,adLockoptimistic ,adcmdtable
	bolFound = false
	
	'Try to find User Entry
	Do Until objRS.EOF Or bolFound
	if (StrComp(objRS.fields("ID_artist"),int_id_artist,vbTextCompare) = 0 )then
		bolFound = True
		Else 
		objRs.Movenext
		End if 
		Loop
	'Edite Recordset
	objRS("Count_album")= objRS("Count_album") - 1
	objRS.update

'Close conction and recordset
objRS.close
set objRS = Nothing
objconn.close
set objconn = Nothing
'redirect page
Response.Redirect("../Manegment_album.asp?ID="& int_id_artist &"")

%>



