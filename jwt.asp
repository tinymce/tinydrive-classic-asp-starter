<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="lib/jwt.all.asp" -->
<!--#include file="lib/json.encoder.asp" -->
<!--#include file="lib/time.asp" -->
<!--#include file="config.asp" -->
<%
response.ContentType = "application/json"

username = Session("username")
fullname = Session("fullname")

If IsEmpty(username) Or IsEmpty(fullname) Then
    Response.Status = "401 Unauthorized"
    Response.End
End If

Dim payload: Set payload = jsObject()

' Unique user id string
payload("sub") = username

' Full name of user
payload("name") = fullname

' 10 minutes expiration
payload("exp") = timeInSeconds() + (60 * 10)

' Issued at
payload("iat") = timeInSeconds()

' When this is set the user will only be able to manage and see files in the specified root
' directory. This makes it possible to have a dedicated home directory for each user.
If scopeUser Then
    payload("https://claims.tiny.cloud/drive/root") = "/" & username
End If

Dim fs: Set fs = Server.CreateObject("Scripting.FileSystemObject")
Set stream = fs.OpenTextFile(Server.MapPath("private.key"), 1, false)
privateKey = stream.ReadAll
stream.close

' Sign the json payload and generate a jwt token
token = signJwtToken(payload.jsString, privateKey, "RS256")

' Generate json response
Dim jsonResponse: Set jsonResponse = jsObject()

jsonResponse("token") = token

Response.Write jsonResponse.jsString
%>