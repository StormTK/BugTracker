<%@ Page Title="" Language="C#" MasterPageFile="~/bugtracker.com/home.Master" AutoEventWireup="true" CodeBehind="blockedaccess.aspx.cs" Inherits="BugTracker.bugtracker.com.blockedaccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/blockedaccess.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="msg">
        <h2>403 Forbidden</h2>
        <p id="triste">:(</p>
        <p>No tiene permisos para acceder a esta pagina...</p>
    </div>


</asp:Content>
