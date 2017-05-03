<%@ Page Title="" Language="C#" MasterPageFile="~/bugtracker.com/plantilladefault/plantilla2.Master" AutoEventWireup="true" CodeBehind="registeruser.aspx.cs" Inherits="BugTracker.bugtracker.com.admin.registeruser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/jquery-ui.css" rel="stylesheet" />
    <script src="../js/SoloNumeros.js"></script>
    <script src="../js/jquery-1.12.4.js"></script>
    <script src="../js/jquery-ui.js"></script>
    <link href="../css/register.css" rel="stylesheet" />
    <script>
        $.datepicker.setDefaults($.datepicker.regional['es']);
        $(function () {
            $("#ContentPlaceHolder1_tbx_nacimiento").datepicker({
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
                minDate: "-100Y",
                maxDate: "-17Y",
                showOn: "button",
                buttonImage: "../img/icone-calendario.png",
                buttonImageOnly: true,
                buttonText: "Select date"
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2><span class="icon-user-new"></span>Registrar Usuario</h2>
    <p class="obligatorio">(*) Son Campos Obligatorios</p>

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
                    Response.Write("<div class=\"error\"><p class=\"icon-icon-error\"></p><p class=\"mensaje\">Campos Obligatorios Vacios</p></div><br />");
                    break;
                case 2:
                    Response.Write("<div class=\"error\"><p class=\"icon-icon-error\"></p><p class=\"mensaje\">Este Email ya esta registrado</p></div><br />");
                    break;
                case 3:
                    int id = 0;
                    if (Request.QueryString.Get("id") != null)
                    {
                        id = Int32.Parse(Request.QueryString.Get("id"));
                    }
                    Response.Write("<div class=\"checked\"><p class=\"icon-checked\"></p><p class=\"mensaje\">Usuario Creado Correctamente <br /><a href=\"../usuario/perfil.aspx?id=" + id + "\">Ver Perfil</a></p></div><br />");
                    break;
                case 4:
                    Response.Write("<div class=\"checked\"><p class=\"icon-checked\"></p><p class=\"mensaje\">Usuario Creado Correctamente <br /></p></div><br />"); ;
                    break;
            }
        }
    %>

    <div class="user">
        <div class="titulo">
            <span class="icon-user"></span>
            <h3>Cuenta de Usuario</h3>
        </div>
        <div class="info">
            <div class="nombre">
                <p>Nombre:</p>
                <asp:TextBox runat="server" ID="tbx_nombre" CssClass="textbox" MaxLength="60" Placeholder="NOMBRE" onKeyUp="this.value=this.value.toUpperCase();"></asp:TextBox>
                <asp:TextBox runat="server" ID="tbx_apellido" CssClass="textbox" MaxLength="60" Placeholder="APELLIDO" onKeyUp="this.value=this.value.toUpperCase();"></asp:TextBox>
            </div>
            <div class="dato">
                <p>E-mail:</p>
                <asp:TextBox runat="server" ID="tbx_email" CssClass="textbox" MaxLength="60" onKeyUp="this.value=this.value.toUpperCase();"></asp:TextBox>
            </div>
            <div class="dato">
                <p>Contraseña:</p>
                <asp:TextBox runat="server" ID="tbx_password" CssClass="textbox" MaxLength="18" Type="Password"></asp:TextBox>
            </div>
            <div class="dato">
                <p>Puesto:</p>

                <%
                    if (Session["Usuario"] != null)
                    {
                        String[] usuario = (String[])Session["Usuario"];
                        int rol = Int32.Parse(usuario[3]);

                        if (rol == 1)
                        {
                %>
                <asp:DropDownList runat="server" ID="cargo" DataSourceID="BuscarCargo" DataTextField="Nombre" DataValueField="idRol" CssClass="textbox"></asp:DropDownList>
                <asp:SqlDataSource ID="BuscarCargo" runat="server" ConnectionString="Data Source=STORMTK-PC;Initial Catalog=BUGTRACKER;Integrated Security=True" SelectCommand="SELECT [idRol], [Nombre] FROM [ROL] WHERE [idRol] > 1 ORDER BY [idRol] "></asp:SqlDataSource>
                <%
                    }
                    if (rol == 2)
                    {
                %>
                <asp:DropDownList runat="server" ID="cargo2" DataSourceID="BuscarCargo2" DataTextField="Nombre" DataValueField="idRol" CssClass="textbox"></asp:DropDownList>
                <asp:SqlDataSource ID="BuscarCargo2" runat="server" ConnectionString="Data Source=STORMTK-PC;Initial Catalog=BUGTRACKER;Integrated Security=True" SelectCommand="SELECT [idRol], [Nombre] FROM [ROL] WHERE [idRol] > 2 ORDER BY [idRol] "></asp:SqlDataSource>
                <%
                        }

                    }
                %>
            </div>
        </div>
    </div>

    <div class="user">
        <div class="titulo">
            <h3>Informacion del Usuario</h3>
        </div>
        <div class="info">
            <div class="dato">
                <p>Direccion:</p>
                <asp:TextBox runat="server" ID="tbx_direccion" CssClass="textbox " MaxLength="80" onKeyUp="this.value=this.value.toUpperCase();"></asp:TextBox>
            </div>

            <div class="dato">
                <p>Fecha de Nacimiento: </p>
                <asp:TextBox runat="server" ID="tbx_nacimiento" CssClass="textbox" MaxLength="1" ></asp:TextBox>
            </div>
            <div class="dato">
                <p>Telefono:</p>
                <asp:TextBox runat="server" ID="tbx_telefono" CssClass="textbox" MaxLength="8" onkeydown="return numeros(event);"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="botones">
        <asp:Button runat="server" Text="Limpiar Campos" CssClass="Boton_Register" OnClick="Boton_Limpiar" />
        <asp:Button runat="server" Text="Registrar" CssClass="Boton_Register" OnClick="Boton_Registrar" />
    </div>

</asp:Content>
