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

'Open and conction to database
set objRS = Server.CreateObject("ADODB.Recordset")
objRS.locktype = 1
objRS.open "tbl_gallery",objconn,2,adcmdtable

'Add Record to database
objRS.AddNew
objRS("name_artist") = Request.Form("name_artist")
objRS("link_gallery") = Request.Form("link_gallery")
objRS("size_gallery") = Request.Form("size_gallery")
objRS.update

'Close conction and recordset
objRS.close
set objRS = Nothing
objconn.close
set objconn = Nothing

'redirect page

response.Redirect("../Manegment_gallery.asp")

%>