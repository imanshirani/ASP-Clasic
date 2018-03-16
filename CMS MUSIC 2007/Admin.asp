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
<link href="Css/Admin.css" rel="stylesheet" type="text/css">
<table width="100%"  border="0">
  <tr>
    <td>
<form action="Code_page/Login.asp" method="post">
	<table width="100%"  border="0">
  <tr>
    <td class="text">Username</td>
    <td><input name="Username" type="text" id="Username"></td>
  </tr>
  <tr>
    <td class="text">Passworld</td>
    <td><input name="Password" type="password" id="Password"></td>
  </tr>
  <tr>
    <td colspan="2"><input name="Login" type="submit" id="Login" value="Login"></td>
    </tr>
  <tr>
    <td colspan="2"><%= Session("MSG") %></td>
  </tr>
</table>
</form>
	</td>
  </tr>
</table>
