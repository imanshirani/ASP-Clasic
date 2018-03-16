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
	
	intID = Request.Form("ID_album")
	int_ID_artist = Request.Form("ID_artist")
	
	'----------------------
	' Open connection to the database
	Set objRS= server.CreateObject("ADODB.recordset")
	objRS.open  "tbl_album",objconn, ,adLockoptimistic ,adcmdtable
	bolFound = false
	
	'Try to find User Entry
	Do Until objRS.EOF Or bolFound
	if (StrComp(objRS.fields("ID_album"),intID,vbTextCompare) = 0 )then
		bolFound = True
		Else 
		objRs.Movenext
		End if 
		Loop
		

	
	'Edite RecordSet
		objRS ("name_album")= Request.Form("name_album")
		objRS ("style_album")= Request.Form("style_album")
		objRS ("date_album")= Request.Form("date_album")
		objRS ("cover_front_album")= Request.Form("cover_front_album")
		objRS ("cover_back_album")= Request.Form("cover_back_album")
		objRS.update
		
		
	' Close Connection
	objRS.Close 
	Set objRS = Nothing
	objconn.close	
	set objconn = nothing	
	'redirect page
	response.Redirect("../Manegment_album.asp?ID="& int_ID_artist &"")
%>



