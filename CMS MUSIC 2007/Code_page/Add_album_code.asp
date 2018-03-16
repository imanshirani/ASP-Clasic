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

'Check Form And Add Record
if (Request.Form("name_album") = "" ) then 
Response.Redirect("../Manegment_artist.asp")
else
'Dim orginal Page
Dim strartist			'Holds Artist
Dim intcountalbum		'Holds Album number
Dim bolFound
Dim intID

'set dim 
set strartist = Request.Form("name_artist")
set intcountalbum = Request.Form("count_album")
set intID = Request.Form("ID_artist")

'Open and conction to database
set objRS = Server.CreateObject("ADODB.Recordset")
objRS.locktype = 1
objRS.open "tbl_album",objconn,2,adcmdtable

'Add Record to database
objRS.AddNew
objRS("name_album") = Request.Form("name_album")
objRS("date_album") = Request.Form("date_album")
objRS("style_album") = Request.Form("Style_album")
objRS("cover_front_album") = Request.Form("Cover_front_album")
objRS("cover_back_album") = Request.Form("Cover_back_album")
objRS("name_artist") = Request.Form("name_artist")
objRS("ID_artist") = intID
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
objRS("Count_album")= intcountalbum + 1
objRS.update

'Close conction and recordset
objRS.close
set objRS = Nothing
objconn.close
set objconn = Nothing
end if 
'redirect page
response.Redirect("../Manegment_artist.asp")

%>