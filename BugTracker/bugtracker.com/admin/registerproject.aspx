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
                dateFormat: 'yy-mm-dd',
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
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true,
                showOtherMonths: true,
                selectOtherMonths: true,
                minDate: "1D",
                showOn: "button",
                buttonImage: "../img/icone-calendario.png",
                buttonImageOnly: true,
                buttonText: "Select date"
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                <asp:TextBox runat="server" ID="tbx_inicio" CssClass="textbox" MaxLength="10"></asp:TextBox>
            </div>
            <div class="dato">
                <p>Fecha de Finalizacion: </p>
                <asp:TextBox runat="server" ID="tbx_final" CssClass="textbox" MaxLength="10"></asp:TextBox>
            </div>
            <div class="dato">
                <p>Presupuesto: </p>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=FELIPEKD-PC;Initial Catalog=BUGTRACKER;Integrated Security=True" SelectCommand="SELECT  USUARIO.idUsuario, USUARIO.Nombre + ' ' + USUARIO.Apellido + ' - ' + ROL.Nombre AS Participante FROM ROL INNER JOIN USUARIO ON ROL.idRol = USUARIO.Rol WHERE USUARIO.Rol > 2"></asp:SqlDataSource>
            <asp:Button runat="server" Text="<< Quitar Usuarios Asignados" CssClass="Boton_Register" OnClick="Boton_Regresar" />
            <asp:Button runat="server" Text="Asignar Usuarios Seleccionado >>" CssClass="Boton_Register" OnClick="Boton_Asignar" />
            <asp:ListBox ID="UsuariosRegistrados" runat="server" SelectionMode="Multiple"></asp:ListBox>
        </div>
    </div>
</asp:Content>
