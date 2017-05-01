<%@ Page Title="" Language="C#" MasterPageFile="~/bugtracker.com/plantilla.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BugTracker.bugtracker.com.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/jquery-ui.css" rel="stylesheet" />
    <link href="css/index.css" rel="stylesheet" />
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script>
        $(function () {
            var icons = {
                header: "ui-icon-circle-arrow-e",
                activeHeader: "ui-icon-circle-arrow-s"
            };
            $(".panel").accordion({
                heightStyle: "content",
                collapsible: true,
                icons: icons
            });
            $("#toggle").button().on("click", function () {
                if ($(".panel").accordion("option", "icons")) {
                    $(".panel").accordion("option", "icons", null);
                } else {
                    $(".panel").accordion("option", "icons", icons);
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel">
        <h3>Panel de Control</h3>
        <div>
            <div class="boton">
                <a href="admin/registeruser.aspx">
                    <p><span class="icon-user-new-color"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span></span></p>
                    <p>Crear Usuario</p>
                </a>
            </div>
            <div class="boton">
                <a href="admin/registerproject.aspx">
                   <p><span class="icon-file-new-color"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span><span class="path5"></span><span class="path6"></span><span class="path7"></span><span class="path8"></span><span class="path9"></span></span></p>
                    <p>Crear Proyecto</p>
                </a>
            </div>
        </div>
    </div>

    <div class="panel">
        <h3>Mis Proyectos</h3>
        <div>
            <p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
        </div>
    </div>

    <div class="panel">
        <h3>Mis Casos</h3>
        <div>
            <p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
        </div>
    </div>

</asp:Content>
