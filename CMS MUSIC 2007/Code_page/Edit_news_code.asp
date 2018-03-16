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
	
	intID = Request.Form("ID_news")
	
	
	'----------------------
	' Open connection to the database
	Set objRS= server.CreateObject("ADODB.recordset")
	objRS.open  "tbl_news",objconn, ,adLockoptimistic ,adcmdtable
	bolFound = false
	
	'Try to find User Entry
	Do Until objRS.EOF Or bolFound
	if (StrComp(objRS.fields("ID_news"),intID,vbTextCompare) = 0 )then
		bolFound = True
		Else 
		objRs.Movenext
		End if 
		Loop
		

	
	'Edite RecordSet
	objRS("Subject_News") = Request.Form("Subject_News")
	objRS("PM_MSG_News") = Request.Form("PM_MSG_News")
	objRS("Full_MSG_News") = Request.Form("Full_MSG_News")
	objRS.update
		
		
	' Close Connection
	objRS.Close 
	Set objRS = Nothing
	objconn.close	
	set objconn = nothing	
	'redirect page
	response.Redirect("../Manegment_news.asp")
%>



