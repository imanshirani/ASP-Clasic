<!--#include file="DB.asp" -->
<%
Response.Buffer= true


'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

'Dim For User Login Page
	Dim strusername    			'Holds the User Name
	Dim strpassword 			'Holds the Password
	
'Read in the users details from the form	
	strusername = Replace(Request("Username"),"'","")
	strpassword = Replace(Request("Password"),"'","")
	
	
		'Filter ""
 		if strusername <> "" then


' Rade To deta base
	strSQL = "SELECT * FROM tbl_configortion WHERE [Username] = '" & (strusername) & "' "
	
	
'Recordset Open and Query the database
	SET objRS = server.CreateObject("ADODB.Recordset")
	objRS.open  strSQL,objconn
	
'Show Record
	'If the database has returned a record then run next bit
		
		Do while not objRS.Eof
		IF Not objRS.EOF AND objRS.BOF then 
			Session("PASSWORDACCESS") = "No"
			
			Else
		
			Session("PASSWORDACCESS") = "Yes"
		'Read in the WEBSITE details from the recordset	
			Session("Username") = objRS ("Username")
			Session("Password") = objRS ("Password")
		
		end if 
		
	objRS.Movenext
	Loop
	

		'Login Check 
		If (Session("Username") = strusername) AND (Session("Password") = strpassword)  Then
			Session ("PASSWORDACCESS") = "YES"
			Response.Redirect("../Manegment.asp")
		Else
			Session("PASSWORDACCESS") = "No"
			Session("MSG") = (strTXTCheckadmin)
			Response.Redirect("../Admin.asp")
			Response.End
		End If

	Else
		Response.Redirect("../Manegment_artist.asp")
	End if 
'Reset Server Objects
	
	objconn.close
	SET objconn = nothing 

%>