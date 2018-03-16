<% 
Session.Timeout = 30

Response.Buffer = True
 
Response.expires = 0
Response.expiresabsolute = Now() - 1
Response.addHeader "pragma", "no-cache"
Response.addHeader "cache-control", "private"
Response.addHeader "cache-control", "no-cache"
Response.addHeader "cache-control", "no-store"
Response.CacheControl = "no-cache"

Session.Abandon

Response.redirect "default.asp"

%>