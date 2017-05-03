using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugTracker.bugtracker.com.admin
{
    public partial class registrarproject : System.Web.UI.Page
    {
        consultas.projectos RegistrarProjecto = new consultas.projectos();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Boton_Asignar(object sender, EventArgs e)
        {
            //Pasamos los items seleccionados de listbox1 a listbox2
            while (UsuariosTotales.GetSelectedIndices().Length > 0)
            {
                UsuariosRegistrados.Items.Add(UsuariosTotales.SelectedItem);
                UsuariosTotales.Items.Remove(UsuariosTotales.SelectedItem);
            }
        }
        protected void Boton_Regresar(object sender, EventArgs e)
        {
            //Pasamos los items seleccionados de listbox1 a listbox2
            while (UsuariosRegistrados.GetSelectedIndices().Length > 0)
            {
                UsuariosTotales.Items.Add(UsuariosRegistrados.SelectedItem);
                UsuariosRegistrados.Items.Remove(UsuariosRegistrados.SelectedItem);
            }
        }
        protected void Boton_Registrar(object sender, EventArgs e)
        {
            String stg_nombre = tbx_nombre.Text;
            String stg_costo = tbx_monto.Text;
            String stg_inicio = tbx_inicio.Text;
            String stg_final = tbx_final.Text;

            if (stg_nombre.Equals("") || stg_costo.Equals("") || stg_final.Equals("") || stg_inicio.Equals(""))
            {
                Response.Redirect("registerproject.aspx?msg=1", false);
            }
            else if(stg_inicio.Length < 2 || stg_final.Length < 2)
            {
                Response.Redirect("registerproject.aspx?msg=2", false);
            }else
            {
                double db_monto = double.Parse(stg_costo);
                DateTime dt_inicio = Convert.ToDateTime(stg_inicio, new CultureInfo("en-CA"));
                DateTime dt_final = Convert.ToDateTime(stg_final, new CultureInfo("en-CA"));
                if(dt_final < dt_inicio)
                {
                    Response.Redirect("registerproject.aspx?msg=3", false);
                }else if(RegistrarProjecto.RegistrarCurso(stg_nombre, db_monto, dt_inicio, dt_final))
                {
                    Response.Redirect("registerproject.aspx?msg=4", false);
                }
            }
        }
    }
}