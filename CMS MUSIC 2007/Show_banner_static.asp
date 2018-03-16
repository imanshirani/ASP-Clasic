<%
'Dimation Orginal Page
Dim Rep_numRows
Dim Rep_index
Dim ObjRS_numRows
Dim Dt_date

Dt_date = Date()

'SQL Conect to datebase 
strSQL = "SELECT * FROM tbl_banner ORDER BY date_exp_banner DESC"
'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn
'Show Database Blunk
if objRS.Eof or objRS.BOF = null then 
response.Write(strTXTNoRecord)
else 
If Bol_Show_banner = True then 

'Show All Banner
ObjRS_numRows = 0
Rep_numRows = intShow_banner
Rep_index = 0
objRS_numRows = objRS_numRows + Rep_numRows
%>
<table width="480"  border="0">
<tr>
<% While ((Rep_numRows <> 0 ) and (not objRS.Eof))%>
<%if objRS("date_exp_banner") => Dt_date then %>
<td width="12"><img src="template/images/advertisment_title.gif" width="12" height="60"></td>
<form action="Code_page/Count_Banner_code.asp" method="post" name="Count_banner" target="_blank">
<td width="468">
<input name="ID_banner" type="hidden" id="ID_banner" value="<%= objRS.fields.item("ID_banner").value %>">
<input name="Count_old" type="hidden" id="Count_old" value="<%= objRS.fields.item("Count").value %>">
<input name="Link_site" type="hidden" id="Link_site" value="<%= objRS.fields.item("link_site_banner").value %>">
<input name="imageField" type="image" src="<%= objRS.fields.item("link_banner").value %>" alt="<%= objRS.fields.item("name_banner").value %>" width="468" height="60" border="0"></td>
</form>
</tr><% End if %>
<%
	'Count Artist
	Rep_index = Rep_index + 1 
	Rep_numRows = Rep_numrows - 1
	objRS.movenext()
	wend	

	end if 
	' Close Recordset
	objRS.close
	set objRS = nothing
%>
</table>
<% end if %>