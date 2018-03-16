<% 
'set Timeout of CMS 
server.ScriptTimeout = 90
session.Timeout = 20 

'Set the date time format to your own if you are getting a CDATE error
Session.LCID = 1033

'Dim Orginal for Web Page
Dim objconn				'Holds Connect to Database
Dim objRS				'Holds Recordset 
Dim strSQL				'Holds Sql Qurey For database

'Conect To database
	set objconn = server.CreateObject("ADODB.CONNECTION")
	objconn.connectionstring="Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("../_DB/_Music.mdb") 
	objconn.open
'----------------------------------------
'Database connection info and driver (if this driver does not work then comment it out and use one of the alternative drivers)
'objconn = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("_DB/_Music.mdb")

'Database driver for Brinkster
'objconn = "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("_DB/_Music.mdb") 'This one is for Brinkster users place your Brinster username where you see USERNAME

'Alternative drivers faster than the generic access one above
'objconn = "Provider=Microsoft.Jet.OLEDB.3.51; Data Source=" & Server.MapPath("_DB/_Music.mdb") 'This one is if you convert the database to Access 97
'objconn= "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("_DB/_Music.mdb")  'This one is for Access 2000/2002

'If you wish to use DSN then comment out the driver above and uncomment the line below (DSN is slower than the above drivers)
'objconn = "DSN = DSN_NAME" 'Place the DSN where you see DSN_NAME
'----------------------------------------
%>
<!--#include file="../includes/adovbs.inc"-->
<!--#include file="../language_files/language_file_inc.asp" -->