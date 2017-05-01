using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugTracker.bugtracker.com.admin
{
    public partial class registrarproject : System.Web.UI.Page
    {
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
    }
}