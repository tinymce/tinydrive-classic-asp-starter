<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="config.asp" -->
<%
error = ""
username = request.form("username")
password = request.form("password")

If Not IsEmpty(username) And Not IsEmpty(password) Then
  If users.Exists(username) Then
    Set user = users(username)
    userPassword = user("password")
    If password = userPassword Then
      Session("username") = username
      Session("fullname") = user("fullname")
      Response.Redirect "editor.asp"
      Response.End
    Else
      error = "Invalid username/password"
    End If
  Else
    error = "Invalid username/password"
  End If
End If
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Login</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
  <div class="container vh-100 d-flex justify-content-center align-items-center">
    <form method="post" action="default.asp">
      <% If error <> "" Then %>
        <div class="alert alert-danger" role="alert"><%= error %></div>
      <% End if %>

      <h1 class="h3 mb-3">Login</h1>
      <p>Login with the user/passwords available in the <code>config.asp</code> file</p>

      <div class="form-group">
        <label for="username" class="font-weight-bold">User</label>
        <input type="text" class="form-control" id="username" name="username" value="johndoe">
      </div>

      <div class="form-group">
        <label for="password" class="font-weight-bold">Password</label>
        <input type="password" class="form-control" id="password" name="password" value="password">
      </div>

      <div class="form-group">
        <input type="submit" class="btn btn-primary" value="Login">
      </div>
    </form>
  </div>
</body>
</html>
