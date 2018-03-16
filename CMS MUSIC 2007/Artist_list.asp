<!--#include file="DB.asp" -->
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

		'Dimation 
		Dim Rep_numRows
		Dim Rep_index
		Dim ObjRS_numRows
		
		
		'SQL Conect to datebase
		strSQL = "SELECT * FROM tbl_artist ORDER BY name_artist ASC"
		
		
		Set objRS = Server.CreateObject("ADODB.Recordset")

		objRS.Open strSQL,objconn
		
		'Show All user name
		
			
			ObjRS_numRows = 0
	
			Rep_numRows = -1
			Rep_index = 0
	
			objRS_numRows = objRS_numRows + Rep_numRows
	%>
<option selected>--- Select Artist ---</option>
<% While ((Rep_numRows <> 0 ) and (not objRS.Eof))%>
<option value="<%= objRS.fields.item("name_artist").value %>"><%= objRS.fields.item("name_artist").value%></option>
<%
	Rep_index = Rep_index + 1 
	Rep_numRows = Rep_numrows - 1
	objRS.movenext()
	wend	
	objRS.close
	set objRS = nothing
	objconn.close
	Set objconn= nothing
%>
