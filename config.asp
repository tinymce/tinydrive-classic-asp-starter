<%
' Replace this with your api key from the "API Key Manager" at the tiny.cloud account page
Dim apiKey: apiKey = "your-api-key"

' Replace the contents of the private.key file with the one from the "JWT Key Manager" at the tiny.cloud account page
' Warning: You should in a production enviroment hide this key outside the wwwroot so that it's not publically accessible
Dim privateKeyFile: privateKeyFile = "./private.key"

' This is the fake database that the login authenticates against
Dim users: Set users = CreateObject("Scripting.Dictionary")

Set johnDoe = CreateObject("Scripting.Dictionary")
johnDoe.Add "password", "password"
johnDoe.Add "fullname", "John Doe"
users.Add "johndoe", johnDoe

Set janeDoe = CreateObject("Scripting.Dictionary")
janeDoe.Add "password", "password"
janeDoe.Add "fullname", "Jane Doe"
users.Add "janedoe", janeDoe

' If this is enabled the root of Tiny Drive will be within a directory named as the user login
Dim scopeUser: scopeUser = false
%>