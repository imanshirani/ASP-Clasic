<!--#include file="Header_admin.asp" -->
<%

response.Buffer = True
	
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

%><table width="100%"  border="0">
  <tr>
    <td>Add_gallery</td>
  </tr>
  <tr>
    <td>
<form action="Code_page/Add_gallery_code.asp" method="post" name="Add_gallery" id="Add_gallery">
<table width="100%"  border="0" class="border">
  <tr>
    <td><div align="left">
      <select name="name_artist" id="name_artist">
		    <!-- Include Artist include file -->
            <!-- #include file="Artist_list.asp" -->
         </select>
    </div></td>
    <td>name_artist</td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="link_gallery" type="text" id="link_gallery">
    </div></td>
    <td>link_gallery</td>
  </tr>
  <tr>
    <td><div align="left">
      <input name="size_gallery" type="text" id="size_gallery" value="1">
    </div></td>
    <td>size_gallery</td>
  </tr>
  <tr>
    <td colspan="2"><input type="submit" name="Submit" value="Submit">
      <input name="Rest" type="reset" id="Rest" value="Reset"></td>
    </tr>
</table>
</form>
	</td>
  </tr>
</table>
<!--#include file="Footer.asp" -->