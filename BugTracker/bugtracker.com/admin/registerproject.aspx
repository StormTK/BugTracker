<%@ Page Title="" Language="C#" MasterPageFile="~/bugtracker.com/plantilladefault/plantilla2.Master" AutoEventWireup="true" CodeBehind="registerproject.aspx.cs" Inherits="BugTracker.bugtracker.com.admin.registrarproject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/register.css" rel="stylesheet" />
    <link href="../css/jquery-ui.css" rel="stylesheet" />
    <script src="../js/jquery-1.12.4.js"></script>
    <script src="../js/jquery-ui.js"></script>
    <script src="../js/Monto.js"></script>
    <script>
        $.datepicker.setDefaults($.datepicker.regional['es']);
        $(function () {
            $("#ContentPlaceHolder1_tbx_inicio").datepicker({
                showButtonPanel: true,
                closeText: 'Cerrar',
                prevText: "< Ant",
                nextText: 'Sig >',
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                showOtherMonths: true,
                selectOtherMonths: true,
                minDate: 0,
                showOn: "button",
                buttonImage: "../img/icone-calendario.png",
                buttonImageOnly: true,
                buttonText: "Select date"
            });
            $("#ContentPlaceHolder1_tbx_final").datepicker({
                showButtonPanel: true,
                closeText: 'Cerrar',
                prevText: "< Ant",
                nextText: 'Sig >',
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                showOtherMonths: true,
                selectOtherMonths: true,
                minDate: "1D",
                maxDate: "5Y", 
                showOn: "button",
                buttonImage: "../img/icone-calendario.png",
                buttonImageOnly: true,
                buttonText: "Select date"
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        if (Session["Usuario"] != null)
        {
            String[] usuario = (String[])Session["Usuario"];
            int rol = Int32.Parse(usuario[3]);
            if (rol > 2)
            {
                Response.Redirect("../blockedaccess.aspx", false);
            }
        }
        else
        {
            Response.Redirect("../login.aspx?msg=3", false);
        }

        if (Request.QueryString.Get("msg") != null)
        {
            int msg = Int32.Parse(Request.QueryString.Get("msg"));
            switch (msg)
            {
                case 1:
                    Response.Write("<div class=\"error\"><p class=\"icon-error\"></p><p class=\"mensaje\">Campos Obligatorios Vacios</p></div><br />");
                    break;
                case 2:
                    Response.Write("<div class=\"error\"><p class=\"icon-error\"></p><p class=\"mensaje\">La Fecha ingresada es invalida</p></div><br />");
                    break;
                case 3:
                    Response.Write("<div class=\"warning\"><p class=\"icon-warning\"><p class=\"mensaje\">La Fecha Final es menor <br /> que la Fecha de Inicio</p></div><br />");
                    break;
                case 4:
                    Response.Write("<div class=\"checked\"><p class=\"icon-checked\"></p><p class=\"mensaje\"> Proyecto Creado <br /></p></div><br />"); ;
                    break;
            }
        }
    %>
    <h2><span class="icon-file-new"></span>Crear un Nuevo Proyecto</h2>
    <div class="user">
        <div class="titulo">
            <span class="icon-file-new"></span>
            <h3>Informacion del Proyecto</h3>
        </div>
        <div class="info">
            <div class="dato">
                <p class="Proyectotitulo">Proyecto:</p>
                <asp:TextBox runat="server" ID="tbx_nombre" CssClass="textbox Proyecto" MaxLength="60" onKeyUp="this.value=this.value.toUpperCase();"></asp:TextBox>
            </div>
            <div class="dato">
                <p>Fecha de Inicio: </p>
                <asp:TextBox runat="server" ID="tbx_inicio" CssClass="textbox" MaxLength="1"></asp:TextBox>
            </div>
            <div class="dato">
                <p>Fecha de Finalizacion: </p>
                <asp:TextBox runat="server" ID="tbx_final" CssClass="textbox" MaxLength="1"></asp:TextBox>
            </div>
            <div class="dato">
                <p class="presupuesto">Presupuesto: Q</p>
                <asp:TextBox runat="server" ID="tbx_monto" CssClass="textbox" MaxLength="12" onkeydown="return numeros(event);"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="user">
        <div class="titulo">
            <span class="icon-file-new"></span>
            <h3>Participantes del Proyecto</h3>
        </div>
        <div class="info">
            <asp:ListBox runat="server" ID="UsuariosTotales" CssClass="textbox" SelectionMode="Multiple" DataSourceID="SqlDataSource1" DataTextField="Participante" DataValueField="idUsuario"></asp:ListBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=STORMTK-PC;Initial Catalog=BUGTRACKER;Integrated Security=True" SelectCommand="SELECT  USUARIO.idUsuario, USUARIO.Nombre + ' ' + USUARIO.Apellido + ' - ' + ROL.Nombre AS Participante FROM ROL INNER JOIN USUARIO ON ROL.idRol = USUARIO.Rol WHERE USUARIO.Rol > 2"></asp:SqlDataSource>
            <asp:Button runat="server" Text="<< Quitar Usuarios Asignados" CssClass="Boton_Register" OnClick="Boton_Regresar" />
            <asp:Button runat="server" Text="Asignar Usuarios Seleccionado >>" CssClass="Boton_Register" OnClick="Boton_Asignar" />
            <asp:ListBox ID="UsuariosRegistrados" runat="server" SelectionMode="Multiple"></asp:ListBox>
        </div>
    </div>
    <div class="botones">
        
        <asp:Button runat="server" Text="Registrar" CssClass="Boton_Register" OnClick="Boton_Registrar" />
    </div>
</asp:Content>
