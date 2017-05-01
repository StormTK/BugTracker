<%@ Page Title="" Language="C#" MasterPageFile="~/bugtracker.com/home.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BugTracker.bugtracker.com.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        if (Request.QueryString.Get("msg") != null)
        {
            int msg = Int32.Parse(Request.QueryString.Get("msg"));
            switch (msg)
            {
                case 1:
                    Response.Write("<div class=\"error\"><p class=\"icon-close\"></p><p class=\"mensaje\">Email/Password esta vacío</p></div><br />");
                    break;
                case 2:
                    Response.Write("<div class=\"error\"><p class=\"icon-close\"></p><p class=\"mensaje\">Email/Password Incorrecto</p></div><br />");
                    break;
                case 3:
                    Response.Write("<div class=\"warning\"><p class=\"icon-warning\"></p><p class=\"mensaje\">Sesión Caducada! <br />Ingrese de nuevo.</p></div><br />");
                    break;
            }
        }
    %>
    <div class="login">
        <h2>Login</h2>
        <p>Email:</p>
        <asp:TextBox runat="server" ID="tbx_usuario" CssClass="textbox" onKeyUp="this.value=this.value.toUpperCase();"></asp:TextBox>
        <p>Password:</p>
        <asp:TextBox runat="server" ID="tbx_contraseña" CssClass="textbox" Type="Password"></asp:TextBox>
        <asp:Button runat="server" CssClass="Button icon-enter" Text="  Iniciar Sesión " OnClick="btn_Login" />
    </div>
    <a href="forgetpass.aspx">
        <p>¿Se te olvido la contraseña?</p>
    </a>
</asp:Content>
