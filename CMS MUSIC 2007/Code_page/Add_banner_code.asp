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
if (Request.Form("name_banner") = "" ) then 
Response.Redirect("../Add_banner.asp?ER= Please Ceck Form and Input * Box .")
else
'Dim orginal page
Dim dtdate
Dim int_date
Dim dt_total
'set
int_date = Request.Form("date_exp_banner")
dtdate = Date()
dt_total = dtdate + int_date
'Open and conction to database
set objRS = Server.CreateObject("ADODB.Recordset")
objRS.locktype = 1
objRS.open "tbl_banner",objconn,2,adcmdtable

'Add Record to database
objRS.AddNew
objRS("name_banner") = Request.Form("name_banner")
objRS("link_banner") = Request.Form("link_banner")
objRS("link_site_banner") = Request.Form("link_site_banner")
objRS("date_exp_banner") = dt_total
objRS.update

'Close conction and recordset
objRS.close
set objRS = Nothing
objconn.close
set objconn = Nothing
End if 
'redirect page

response.Redirect("../Manegment_banner.asp")

%>