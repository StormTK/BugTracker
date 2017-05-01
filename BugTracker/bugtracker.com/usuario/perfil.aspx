<%@ Page Title="" Language="C#" MasterPageFile="~/bugtracker.com/plantilladefault/plantilla2.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="BugTracker.bugtracker.com.usuario.perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/perfil.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="usuario">
        <%
            if (Request.QueryString.Get("id") != null)
            {
                int idUsuario = Int32.Parse(Request.QueryString.Get("id"));
                Response.Write(MostrarHTML(idUsuario));
            }
    %>
    </div>
</asp:Content>
