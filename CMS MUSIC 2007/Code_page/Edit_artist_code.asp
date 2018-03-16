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

'Dim orginal page
Dim bolFound
Dim intID
	
intID = Request.Form("ID_artist")
'Check Form And Add Record
if (Request.Form("name_artist") = "" ) then 
Response.Redirect("../Edit_artist.asp?ID="& intID &"&ER="& strTXTInputblunk &"")
else	
'----------------------
' Open connection to the database
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
			
'Edite RecordSet
	objRS ("name_artist")= Request.Form("name_artist")
	objRS ("Country_artist")= Request.Form("Country_artist")
	objRS ("style_artist")= Request.Form("style_artist")
	objRS ("Pic_artist")= Request.Form("Pic_artist")
	objRS ("about_artist")= Request.Form("BiografY")
	objRS.update
		
		
' Close Connection
objRS.Close 
Set objRS = Nothing
objconn.close	
set objconn = nothing	
end if 
'redirect page
response.Redirect("../Manegment_artist.asp")
%>



