<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN//FA" "http://www.w3.org/TR/html4/loose.dtd" "Imanshirani">
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
%>
<!--#include file="language_files/language_file_inc.asp" -->
<link href="Css/Admin.css" rel="stylesheet" type="text/css">
<table width="100%"  border="0">
  <tr>
    <td><!--#include file="template/Header_admin.htm"--></td>
  </tr>
