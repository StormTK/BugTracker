using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugTracker.bugtracker.com
{
    public partial class login : System.Web.UI.Page
    {
        consultas.usuario Loguearse = new consultas.usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_Login(object sender, EventArgs e)
        {
            String stg_usuario = tbx_usuario.Text;
            String stg_contraseña = tbx_contraseña.Text;

            if (stg_usuario == null || stg_contraseña == null)
            {
                Response.Redirect("login.aspx?msg=1", false);
            }
            else if (stg_usuario.Equals("") || stg_contraseña.Equals(""))
            {
                Response.Redirect("login.aspx?msg=1", false);
            }
            else if (Loguearse.Login(stg_usuario, stg_contraseña))
            {
                if (Session["Usuario"] == null)
                {
                    Session["Usuario"] = Loguearse.SesionUsuario(stg_usuario);
                    Response.Redirect("index.aspx", false);
                }
                else
                {
                    Session.Abandon();
                    Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                    Session["Usuario"] = Loguearse.SesionUsuario(stg_usuario);
                    Response.Redirect("index.aspx", false);
                }
            }
            else
            {
                Response.Redirect("login.aspx?msg=2", false);
            }
        }
    }
}