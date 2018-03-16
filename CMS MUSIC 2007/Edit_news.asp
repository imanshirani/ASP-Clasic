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


'Dim Profile Page

Dim strID
Dim intGroupsid
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables
Dim objRS_total
Dim objRS_first
Dim objRS_last

Dim OBJRS_paramName 
' *** Move To Record and Go To Record: declare variables

Dim OBJRS_rs
Dim OBJRS_rsCount
Dim OBJRS_size
Dim OBJRS_uniqueCol
Dim OBJRS_offset
Dim OBJRS_atTotal
Dim OBJRS_paramIsDefined

Dim OBJRS_param
Dim OBJRS_index

Dim objRS_numRows


'SQL Conect to datebase
	strSQL = "SELECT * FROM tbl_news"
	
Set objRS = Server.CreateObject("ADODB.Recordset")
objRS.Open strSQL,objconn

objRS_numRows = 0




' set the record count
objRS_total = objRS.RecordCount

' set the number of rows displayed on this page
If (objRS_numRows < 0) Then
  objRS_numRows = objRS_total
Elseif (objRS_numRows = 0) Then
  objRS_numRows = 1
End If

' set the first and last displayed record
objRS_first = 1
objRS_last  = objRS_first + objRS_numRows - 1

' if we have the correct record count, check the other stats
If (objRS_total <> -1) Then
  If (objRS_first > objRS_total) Then
    objRS_first = objRS_total
  End If
  If (objRS_last > objRS_total) Then
    objRS_last = objRS_total
  End If
  If (objRS_numRows > objRS_total) Then
    objRS_numRows = objRS_total
  End If
End If

Set OBJRS_rs    = objRS
OBJRS_rsCount   = objRS_total
OBJRS_size      = objRS_numRows
OBJRS_uniqueCol = "ID_news"
OBJRS_paramName = "ID"
OBJRS_offset = 0
OBJRS_atTotal = false
OBJRS_paramIsDefined = false
If (OBJRS_paramName <> "") Then
  OBJRS_paramIsDefined = (Request.QueryString(OBJRS_paramName) <> "")
End If

' *** Move To Specific Record: handle detail parameter

If (OBJRS_paramIsDefined And OBJRS_rsCount <> 0) Then

  ' get the value of the parameter
  OBJRS_param = Request.QueryString(OBJRS_paramName)

  ' find the record with the unique column value equal to the parameter value
  OBJRS_offset = 0
  Do While (Not OBJRS_rs.EOF)
    If (CStr(OBJRS_rs.Fields.Item(OBJRS_uniqueCol).Value) = OBJRS_param) Then
      Exit Do
    End If
    OBJRS_offset = OBJRS_offset + 1
    OBJRS_rs.MoveNext
  Loop

  ' if not found, set the number of records and reset the cursor
  If (OBJRS_rs.EOF) Then
    If (OBJRS_rsCount < 0) Then
      OBJRS_rsCount = OBJRS_offset
    End If
    If (OBJRS_size < 0 Or OBJRS_size > OBJRS_offset) Then
      OBJRS_size = OBJRS_offset
    End If
    OBJRS_offset = 0

    ' reset the cursor to the beginning
    If (OBJRS_rs.CursorType > 0) Then
      OBJRS_rs.MoveFirst
    Else
      OBJRS_rs.Close
      OBJRS_rs.Open
    End If
  End If

End If

' *** Move To Record: if we dont know the record count, check the display range

If (OBJRS_rsCount = -1) Then

  ' walk to the end of the display range for this page
  OBJRS_index = OBJRS_offset
  While (Not OBJRS_rs.EOF And (OBJRS_size < 0 Or OBJRS_index < OBJRS_offset + OBJRS_size))
    OBJRS_rs.MoveNext
    OBJRS_index = OBJRS_index + 1
  Wend

  ' if we walked off the end of the recordset, set OBJRS_rsCount and OBJRS_size
  If (OBJRS_rs.EOF) Then
    OBJRS_rsCount = OBJRS_index
    If (OBJRS_size < 0 Or OBJRS_size > OBJRS_rsCount) Then
      OBJRS_size = OBJRS_rsCount
    End If
  End If

  ' if we walked off the end, set the offset based on page size
  If (OBJRS_rs.EOF And Not OBJRS_paramIsDefined) Then
    If (OBJRS_offset > OBJRS_rsCount - OBJRS_size Or OBJRS_offset = -1) Then
      If ((OBJRS_rsCount Mod OBJRS_size) > 0) Then
        OBJRS_offset = OBJRS_rsCount - (OBJRS_rsCount Mod OBJRS_size)
      Else
        OBJRS_offset = OBJRS_rsCount - OBJRS_size
      End If
    End If
  End If

  ' reset the cursor to the beginning
  If (OBJRS_rs.CursorType > 0) Then
    OBJRS_rs.MoveFirst
  Else
    OBJRS_rs.Requery
  End If

  ' move the cursor to the selected record
  OBJRS_index = 0
  While (Not OBJRS_rs.EOF And OBJRS_index < OBJRS_offset)
    OBJRS_rs.MoveNext
    OBJRS_index = OBJRS_index + 1
  Wend
End If

' *** Move To Record: update recordset stats

' set the first and last displayed record
objRS_first = OBJRS_offset + 1
objRS_last  = OBJRS_offset + OBJRS_size

If (OBJRS_rsCount <> -1) Then
  If (objRS_first > OBJRS_rsCount) Then
    objRS_first = OBJRS_rsCount
  End If
  If (objRS_last > OBJRS_rsCount) Then
    objRS_last = OBJRS_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
OBJRS_atTotal = (OBJRS_rsCount <> -1 And OBJRS_offset + OBJRS_size >= OBJRS_rsCount)

'Filter Record Set 
strID = request.QueryString("ID")
if strID <> "" then 


%>
<table width="100%"  border="0">
  <tr>
    <td class="H1"><%= strTXTEditNews %></td>
  </tr>
  <tr>
    <td>
<form action="Code_page/Edit_news_code.asp" method="post" name="Add_news" id="Add_news">
<table width="100%"  border="0" class="border">
<tr><td colspan="2">
<input name="ID_news" type="hidden" id="ID_news" value="<%= objRS.fields.item("ID_news").value %>">
</td></tr>
  <tr>
    <td><div align="left">
      <input name="Subject_News" type="text" id="Subject_News" value="<%= objRS.fields.item("Subject_News").value %>"" size="100">
    </div></td>
    <td class="text3"><div align="right"><%= strTXTSubjectNews %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <textarea name="PM_MSG_News" cols="95" wrap="VIRTUAL" id="PM_MSG_News"><%= objRS.fields.item("PM_MSG_News").value %></textarea>
    </div></td>
    <td class="text3"><div align="right"><%= strTXTPMNews %></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <textarea name="Full_MSG_News" cols="95" rows="10" wrap="VIRTUAL" id="Full_MSG_News"><%= objRS.fields.item("Full_MSG_News").value %>"</textarea>
    </div></td>
    <td class="text3"><div align="right"><%= strTXTFullNews %> </div></td>
  </tr>
  <tr>
    <td colspan="2"><input type="submit" name="Submit" value="<%= strTXTSend %>">
      <input name="Rest" type="reset" id="Rest" value="<%= strTXTRest %>"></td>
  </tr>
</table>
</form>
	</td>
  </tr>
</table>

	<% End if %>

<%
objRS.Close()
Set objRS = Nothing
%>
<!--#include file="Footer.asp" -->