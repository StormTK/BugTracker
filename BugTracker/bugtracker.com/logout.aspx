<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="BugTracker.bugtracker.com.logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    Cerrando Sesion... Redireccionando al Login...
    <%
        Session.Abandon();
        Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
        Response.Redirect("login.aspx",false);
    %>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
