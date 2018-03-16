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
	
	int_id = Request.Form("ID_news")
	
	
	'----------------------
	' Open connection to the database
	Set objRS= server.CreateObject("ADODB.recordset")
	objRS.open  "tbl_news",objconn, ,adLockoptimistic ,adcmdtable
	bolFound = false
	
	'Try to find User Entry
	Do While Not (objRS.EOF Or bolFound)
	if (StrComp(objRS.fields("ID_news"),int_id,vbTextCompare) = 0 )then
		bolFound = True
		Else 
		objRs.Movenext
		End if 
		Loop
		
	
	'Delet RecordSet
	objRS.Delete
		
	' Close Connection
	objRS.Close 
	Set objRS = Nothing
	objconn.close	
	set objconn = nothing	
	
	'redirect page
	Response.Redirect("../Manegment_news.asp")

%>



