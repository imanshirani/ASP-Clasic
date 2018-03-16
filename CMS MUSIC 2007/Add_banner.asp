<!--#include file="DB.asp" -->
<!--#include file="Header_admin.asp" -->
<%

response.Buffer = True
	
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"
'Dim roginal page
Dim strER
'Set query
strER = Request.QueryString("ER")
%>
<table width="100%"  border="0">
  <tr>
    <td class="H1"><%= strTXTAddBanner %></td>
  </tr>
 <tr><td><%= Response.Write(strER) %></td></tr> 
  <tr>
    <td>
<form action="code_page/Add_banner_code.asp" method="post" name="Add_banner">
	<table width="100%"  border="0" class="border">
  <tr>
    <td><div align="left">
          <input name="name_banner" type="text" id="name_banner"> 
      * </div></td>
    <td class="text3"><div align="right"><%= strTXTNameBanner %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="link_site_banner" type="text" id="link_site_banner">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTlinksite %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="link_banner" type="text" id="link_banner">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTlinkBanner %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="date_exp_banner" type="text" id="date_exp_banner" value="365" size="3" maxlength="3">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTEXP %></div></td>
  </tr>
  <tr>
    <td colspan="2"><input type="submit" name="Submit" value="<%= strTXTSend %>"></td>
    </tr>
</table>
</form>
	</td>
  </tr>
</table>
<!--#include file="Footer.asp" -->