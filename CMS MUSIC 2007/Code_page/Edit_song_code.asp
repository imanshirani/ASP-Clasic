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



	Dim bolFound
	Dim intID
	Dim int_ID_artist
	
	intID = Request.Form("ID_song")
	int_ID_artist = Request.Form("ID_artist")
	
	'----------------------
	' Open connection to the database
	Set objRS= server.CreateObject("ADODB.recordset")
	objRS.open  "tbl_song",objconn, ,adLockoptimistic ,adcmdtable
	bolFound = false
	
	'Try to find User Entry
	Do Until objRS.EOF Or bolFound
	if (StrComp(objRS.fields("ID_song"),intID,vbTextCompare) = 0 )then
		bolFound = True
		Else 
		objRs.Movenext
		End if 
		Loop
		

	
	'Edite RecordSet
		objRS ("name_Song")= Request.Form("name_Song")
		objRS ("link_128_Song")= Request.Form("link_128_Song")
		objRS ("link_64_Song")= Request.Form("link_64_Song")
		objRS ("size_Song")= Request.Form("size_Song")
		objRS ("time_Song")= Request.Form("time_Song")
		objRS.update
		
		
	' Close Connection
	objRS.Close 
	Set objRS = Nothing
	objconn.close	
	set objconn = nothing	
	'redirect page
	response.Redirect("../Manegment_album.asp?ID="& int_ID_artist &"")
%>



