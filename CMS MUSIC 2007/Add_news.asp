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
    <td class="H1"><%= strTXTAddNews %></td>
  </tr>
    <tr><td><%= Response.Write(strER) %></td></tr>
  <tr>
    <td>
<form action="Code_page/Add_news_code.asp" method="post" name="Add_news" id="Add_news">
<table width="100%"  border="0" class="border">
  <tr>
    <td><div align="left">
      <input name="Subject_News" type="text" id="Subject_News" size="100">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTSubjectNews %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <textarea name="PM_MSG_News" cols="95" wrap="VIRTUAL" id="PM_MSG_News"></textarea>
    </div></td>
    <td class="text3"><div align="right"><%= strTXTPMNews %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <textarea name="Full_MSG_News" cols="95" rows="10" wrap="VIRTUAL" id="Full_MSG_News"></textarea>
    </div></td>
    <td class="text3"><div align="right"><%= strTXTFullNews %> </div></td>
  </tr>
  <tr>
    <td colspan="2"><input type="submit" name="Submit" value="<%= strTXTSend %>">
      </td>
  </tr>
</table>
</form>
	</td>
  </tr>
</table>
<!--#include file="Footer.asp" -->
