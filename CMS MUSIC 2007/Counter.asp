<%

response.Buffer = True
	
'Make sure this page is not cached
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"

'Dim orginal page
Dim objRS_Counter
Dim strSQL_Counter
Dim strTO
Dim strWE
Dim strMON 
Dim counter_total
Dim counter_mon
Dim counter_week
Dim counter_day
'SQL Conect to datebase 
strSQL_Counter = "SELECT * FROM tbl_countor"

set objRS_Counter = Server.CreateObject("ADODB.Recordset")
objRS_counter.open strSQL_Counter,objconn,2,2

strTO = Day(Now)
strWE = Weekday(Now)
strMON = Month(Now)

counter_total = clng(objRS_counter.fields.item("total").value) + 1
counter_mon	  = clng(objRS_counter.fields.item("month").value) + 1
counter_Week  = clng(objRS_counter.fields.item("week").value) + 1
counter_Day	  = clng(objRS_counter.fields.item("today").value) + 1

if cstr(objRS_counter.fields("mon").value) = cstr(strMON) then
counter_mon	  = (objRS_counter.fields("month").value) + 1
else
counter_mon = 1
end if

if cstr(strWE) = "7"  then
if cstr(objRS_counter.fields("we").value) = "7" then
counter_Week  = (objRS_counter.fields("week").value) + 1
else
counter_Week = 1
end if
else
counter_Week  = clng(objRS_counter.fields("week").value) + 1
end if

if cstr(objRS_counter.fields("to").value) = cstr(strto) then
counter_Day	  = (objRS_counter.fields("today").value) + 1
else
counter_Day = 1
end if

'Update Recorde
objRS_counter("total").value = counter_total
objRS_counter("today").value = counter_Day
objRS_counter("week").value = counter_Week
objRS_counter("month").value = counter_mon
objRS_counter("mon").value = strmon
objRS_counter("we").value = strwe
objRS_counter("to").value = strto
objRS_counter.update()
objRS_counter.close()
%>
