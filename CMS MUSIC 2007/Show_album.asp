<% Option Explicit %>
<!--#include file="DB.asp" -->
<!--#include File="config.asp"-->
<!--#include file="language_files/language_file_inc.asp" -->
<%
response.Buffer = True
	
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

'Dimation Orginal Page
Dim Max_Number_show				'Holds number Show View
Dim int_Number_Show  			'Holds Number For
'Dim Profile Page
Dim strID
Dim stralbum
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
strSQL = "SELECT * FROM tbl_album"
	
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
OBJRS_uniqueCol = "name_album"
OBJRS_paramName = "album"
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
stralbum = request.QueryString("album")
if stralbum <> "" then 
%>
<title> <%= objRS("name_artist") %> : <%= objRS("name_album") %></title>
<link href="Css/Defulte.css" rel="stylesheet" type="text/css">
<table width="400" border="0" class="border">
  <tr>
    <td>
<table width="100%"  border="0">
  <tr>
    <td class="H1"><%= strTXTNameAlbum %></td>
  </tr>
  <tr>
    <td>
	<table width="100%"  border="0">
      <tr>
        <td width="41%" rowspan="3"><div align="center"><a href="<%= objRS("cover_front_album") %>" target="_blank"><img src="<%= objRS("cover_front_album") %>" alt="<%= objRS("name_album") %>" width="50" height="50" border="0"></a></div></td>
        <td width="59%" class="text3"><%= strTXTNameAlbum %> : <%= objRS("name_album") %></td>
      </tr>
      <tr>
        <td class="text3"><%= strTXTNameSinger %> : <%= objRS("name_artist") %></td>
      </tr>
      <tr>
        <td class="text3"><%= strTXTStyle %> : <%= objRS("style_album") %></td>
      </tr>
      <tr>
        <td rowspan="3"><div align="center"><a href="<%= objRS("cover_back_album") %>" target="_blank"><img src="<%= objRS("cover_back_album") %>" alt="<%= objRS("name_album") %>" width="50" height="50" border="0"></a></div></td>
        <td class="text3"><%= strTXTDate %> : <%= objRS("date_album") %></td>
      </tr>
      <tr>
        <td class="text3"><%= strTXTDateAdd %> : <%= objRS("date_add_album") %></td>
      </tr>
      <tr>
        <td class="text3"><%= strTXTCountSong %> : <%= objRS("Count_Song") %></td>
      </tr>
    </table>
<% End if 
objRS.Close()
Set objRS = Nothing
%>
	</td>
  </tr>
  <tr>
    <td><hr></td>
  </tr>
  <tr>
    <td>
<span class="H1">
<% 'Show Song
'Last Show View Topic
Max_Number_show = 30 
strID = Request.QueryString("ID")
'SQL Conect to datebase 
strSQL = "SELECT * FROM tbl_song"

'Open Recordset
set objRS = server.CreateObject("ADODB.Recordset")
objRS.open strSQL,objconn
%>
</span>
<table width="100%"  border="0" align="left">
        <tr class="text2">
          <td><div align="center"><%= strTXTCount %></div></td>
          <td><div align="center"><%= strTXTTime %></div></td>
          <td><div align="center"><%= strTXTSize %></div></td>
          <td><div align="center"><%= strTXTLink_64 %></div></td>
          <td><div align="center"><%= strTXTLink_128 %></div></td>
          <td><div align="center"><%= strTXTNameSong %></div></td>
        </tr>
<% 
'Show Recorde 
for int_Number_Show = 1 To Max_Number_show
if objRS.EOF then exit For 
if (objRS.fields.item("name_album").value = stralbum ) and (objRS.fields.item("name_artist").value = strID )then
%>
        <tr class="text3">
          <td><div align="center"><%= objRS.fields.item("Count").value %></div></td>
          <td><div align="center"><%= objRS.fields.item("time_Song").value %></div></td>
          <td><div align="center"><%= objRS.fields.item("size_Song").value %></div></td>
          <td><form action="Code_page/Count_song_code.asp" method="post" name="128_download" id="128_download">
            <div align="center">
              <input name="ID_song" type="hidden" id="ID_song" value="<%= objRS.fields.item("ID_song").value %>">
              <input name="Count_old" type="hidden" id="Count_old" value="<%= objRS.fields.item("Count").value %>">
              <input name="Link_song" type="hidden" id="Link_song22" value="<%= objRS.fields.item("link_64_Song").value %>">            
              <input name="Download" type="image" id="Download" src="images/Down64.gif" width="20" height="20" border="0">
            </div>
          </form></td>
          <td>
            <form action="Code_page/Count_song_code.asp" method="post" name="64_download" id="64_download">
              <div align="center">
                <input name="ID_song" type="hidden" id="ID_song" value="<%= objRS.fields.item("ID_song").value %>">
                <input name="Count_old" type="hidden" id="Count_old" value="<%= objRS.fields.item("Count").value %>">            
                <input name="Link_song" type="hidden" id="Link_song" value="<%= objRS.fields.item("link_128_Song").value %>">
                <input name="Download" type="image" id="Download" src="images/Down128.gif" width="20" height="20" border="0">
              </div>
            </form></td>
          <td><div align="center"><%= objRS.fields.item("name_Song").value %></div></td>
        </tr>
<%
end if 
'Move next record
objRS.movenext()
Next
%>
      </table>
	 </td>
  </tr>
</table>
<table width="100%"  border="0">
  <tr>
    <td><!--#include File="Show_banner_random.asp"--></td>
  </tr>
</table>
	</td>
  </tr>
</table>




