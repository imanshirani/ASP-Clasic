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
if (Request.Form("Subject_News") = "" ) then 
Response.Redirect("../Add_news.asp?ER=" & strTXTInput &"")
else
'Open and conction to database
set objRS = Server.CreateObject("ADODB.Recordset")
objRS.locktype = 1
objRS.open "tbl_News",objconn,2,adcmdtable

'Add Record to database
objRS.AddNew
objRS("Subject_News") = Request.Form("Subject_News")
objRS("PM_MSG_News") = Request.Form("PM_MSG_News")
objRS("Full_MSG_News") = Request.Form("Full_MSG_News")
objRS.update

'Close conction and recordset
objRS.close
set objRS = Nothing
objconn.close
set objconn = Nothing
End if
'redirect page

response.Redirect("../Manegment_News.asp")

%>