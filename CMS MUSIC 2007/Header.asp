<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN//FA" "http://www.w3.org/TR/html4/loose.dtd" "Imanshirani">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="fa">
<link href="Css/Defulte.css" rel="stylesheet" type="text/css">
<%
response.Buffer = True

'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"
%>
<!--#include file="DB.asp" -->
<!--#include file="Counter.asp"-->
<!--#include file="Config.asp" -->
<!--#include file="language_files/language_file_inc.asp" -->
<title> <%= StrSitname %> </title>
<table width="100%"  border="0">
  <tr>
    <td colspan="2"><!--#include file="template/Header.htm"--></td>
  </tr>
  <tr>
    <td colspan="2"><!--#include file="Meno.asp"--></td>
  </tr>
</table>
