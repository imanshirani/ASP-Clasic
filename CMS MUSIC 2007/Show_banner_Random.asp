<%
response.Buffer = True
	
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

	'Dimation Orginal Page
	dim BannersRecordCount		'Holds BannersRecordCount
	dim RandomNumber
	dim upperbound
	dim lowerbound
	dim intLoop
	Dim Dt_date_1

	Dt_date_1 = Date()

	'SQL Conect to datebase 
	strSQL = "SELECT * FROM tbl_banner ORDER BY date_exp_banner DESC"
			
		Set objRS = Server.CreateObject("ADODB.Recordset")
		objRS.Open strSQL,objconn,3

		If Bol_Show_banner = True then 
						
		BannersRecordCount=objRS.recordcount
			
		randomize()
		
		upperbound = BannersRecordCount
		lowerbound = 1
		
		' Get a random record number between 1 and number of banners available
		RandomNumber = int ((upperbound - lowerbound + 1)  * rnd + lowerbound)
		
		set objRS=Server.CreateObject("adodb.recordset")
		' Open Static RecordSet
		' Equivalent values of adOpenKeyset, adLockPessimistic, adCmdTable
		' from the adovbs.inc file which I haven't included here
	
		objRS.open "tbl_banner", objConn, 1, 2, &H0002
	
		' Move to the first record ready to cycle through them
		objRS.movefirst

		' Cycle through the banners until we've got the n'th one
		' We can't do this with a SELECT statement as the record
		' with an ID matching the RandomNumber may have been delete.
		

		For intLoop = 1 To RandomNumber - 1
 		objRS.movenext
		next 
		end if 
		%>
<%if objRS("date_exp_banner") => Dt_date_1 then %>
<form action="Code_page/Count_Banner_code.asp" method="post" name="Count_banner" target="_blank">
<input name="ID_banner" type="hidden" id="ID_banner" value="<%= objRS.fields.item("ID_banner").value %>">
<input name="Count_old" type="hidden" id="Count_old" value="<%= objRS.fields.item("Count").value %>">
<input name="Link_site" type="hidden" id="Link_site" value="<%= objRS.fields.item("link_site_banner").value %>">
<input name="imageField" type="image" src="<%= objRS.fields.item("link_banner").value %>" alt="<%= objRS.fields.item("name_banner").value %>" width="460" height="60" border="0">
</form>
<% End if %>




