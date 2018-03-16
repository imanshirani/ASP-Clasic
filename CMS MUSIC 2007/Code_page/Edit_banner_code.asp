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
	
	intID = Request.Form("ID_banner")
	
	
	'----------------------
	' Open connection to the database
	Set objRS= server.CreateObject("ADODB.recordset")
	objRS.open  "tbl_banner",objconn, ,adLockoptimistic ,adcmdtable
	bolFound = false
	
	'Try to find User Entry
	Do Until objRS.EOF Or bolFound
	if (StrComp(objRS.fields("ID_banner"),intID,vbTextCompare) = 0 )then
		bolFound = True
		Else 
		objRs.Movenext
		End if 
		Loop
		

	
	'Edite RecordSet
	objRS("name_banner") = Request.Form("name_banner")
	objRS("link_banner") = Request.Form("link_banner")
	objRS("link_site_banner") = Request.Form("link_site_banner")
	objRS("date_exp_banner") = Request.Form("date_exp_banner")
	objRS.update
		
		
	' Close Connection
	objRS.Close 
	Set objRS = Nothing
	objconn.close	
	set objconn = nothing	
	'redirect page
	response.Redirect("../Manegment_banner.asp")
%>



