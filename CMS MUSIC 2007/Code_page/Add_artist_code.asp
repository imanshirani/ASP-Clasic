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

'Dim Orginal page
Dim str_style
Dim str_Country
'Check Form And Add Record
if (Request.Form("name_artist") = "" ) then 
Response.Redirect("../Add_artist.asp?ER="& strTXTInput &"")
else
'Open and conction to database
set objRS = Server.CreateObject("ADODB.Recordset")
objRS.locktype = 1
objRS.open "tbl_artist",objconn,2,adcmdtable

'Add Record to database
objRS.AddNew
objRS("name_artist") = Request.Form("name_artist")
objRS("Country_artist") = Request.Form("Country_artist")
objRS("style_artist") = Request.Form("style_artist")
objRS("Pic_artist") = Request.Form("Pic_artist")
objRS("about_artist") = Request.Form("BiografY")
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