using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugTracker.bugtracker.com.usuario
{
    public partial class perfil : System.Web.UI.Page
    {
        consultas.usuario PerfilConsulta = new consultas.usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       public string MostrarHTML(int idUser)
        {
            return PerfilConsulta.MostrarUsuario(idUser);
        }
    }
}