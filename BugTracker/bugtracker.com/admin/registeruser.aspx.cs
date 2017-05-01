using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugTracker.bugtracker.com.admin
{
    public partial class registeruser : System.Web.UI.Page
    {
        consultas.usuario Registrar = new consultas.usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Boton_Limpiar(object sender, EventArgs e)
        {
            tbx_nombre.Text = "";
            tbx_apellido.Text = "";
            tbx_email.Text = "";
            tbx_password.Text = "";
            tbx_direccion.Text = "";
            tbx_telefono.Text = "";
            tbx_nacimiento.Text = "";
        }
        protected void Boton_Registrar(object sender, EventArgs e)
        {
            String stg_nombre = tbx_nombre.Text;
            String stg_apellido = tbx_apellido.Text;
            String stg_email = tbx_email.Text;
            String stg_password = tbx_password.Text;
            String stg_direccion = tbx_direccion.Text;
            String stg_nacimiento = tbx_nacimiento.Text;
            String stg_telefono = tbx_telefono.Text;
            Boolean bln_direccion = true;
            Boolean bln_nacimiento = true;
            Boolean bln_telefono = true;
            int stg_puesto = Int32.Parse(cargo.SelectedValue.ToString());

            if (stg_nombre.Equals("") || stg_password.Equals("") || stg_email.Equals("") || stg_password.Equals(""))
            {
                Response.Redirect("registeruser.aspx?msg=1", false);
            }
            else if (Registrar.VerificarEmail(stg_email))
            {
                Response.Redirect("registeruser.aspx?msg=2", false);
            }
            else
            {
                if (stg_direccion == null || stg_direccion.Equals(""))
                {
                    bln_direccion = false;
                }
                if (stg_nacimiento == null || stg_nacimiento.Equals(""))
                {
                    bln_nacimiento = false;
                }
                if (stg_telefono == null || stg_telefono.Equals(""))
                {
                    bln_telefono = false;
                }

                if (bln_direccion == false && bln_nacimiento == false && bln_telefono == false)
                {
                    if (Registrar.RegistrarCurso(stg_nombre, stg_apellido, stg_puesto, stg_email, stg_password))
                    {
                        int idUser = Registrar.ObtenerId(stg_email);
                        if (idUser != 0)
                        {
                            Response.Redirect("registeruser.aspx?msg=3&id=" + idUser, false);
                        }
                        else
                        {
                            Response.Redirect("registeruser.aspx?msg=4", false);
                        }
                    }
                }
                else if (bln_direccion == true && bln_nacimiento == false && bln_telefono == false)
                {
                    if (Registrar.RegistrarCurso(stg_nombre, stg_apellido, stg_puesto, stg_email, stg_password, stg_direccion, 1))
                    {
                        int idUser = Registrar.ObtenerId(stg_email);
                        if (idUser != 0)
                        {
                            Response.Redirect("registeruser.aspx?msg=3&id=" + idUser, false);
                        }
                        else
                        {
                            Response.Redirect("registeruser.aspx?msg=4", false);
                        }
                    }
                }
                else if (bln_direccion == false && bln_nacimiento == true && bln_telefono == false)
                {
                    if (Registrar.RegistrarCurso(stg_nombre, stg_apellido, stg_puesto, stg_email, stg_password, stg_direccion, 2))
                    {
                        int idUser = Registrar.ObtenerId(stg_email);
                        if (idUser != 0)
                        {
                            Response.Redirect("registeruser.aspx?msg=3&id=" + idUser, false);
                        }
                        else
                        {
                            Response.Redirect("registeruser.aspx?msg=4", false);
                        }
                    }
                }
                else if (bln_direccion == false && bln_nacimiento == false && bln_telefono == true)
                {
                    if (Registrar.RegistrarCurso(stg_nombre, stg_apellido, stg_puesto, stg_email, stg_password, stg_direccion, 3))
                    {
                        int idUser = Registrar.ObtenerId(stg_email);
                        if (idUser != 0)
                        {
                            Response.Redirect("registeruser.aspx?msg=3&id=" + idUser, false);
                        }
                        else
                        {
                            Response.Redirect("registeruser.aspx?msg=4", false);
                        }
                    }
                }
                else if (bln_direccion == true && bln_nacimiento == true && bln_telefono == false)
                {
                    if (Registrar.RegistrarCurso(stg_nombre, stg_apellido, stg_puesto, stg_email, stg_password, stg_direccion, stg_nacimiento, 1))
                    {
                        int idUser = Registrar.ObtenerId(stg_email);
                        if (idUser != 0)
                        {
                            Response.Redirect("registeruser.aspx?msg=3&id=" + idUser, false);
                        }
                        else
                        {
                            Response.Redirect("registeruser.aspx?msg=4", false);
                        }
                    }
                }
                else if (bln_direccion == false && bln_nacimiento == true && bln_telefono == true)
                {
                    if (Registrar.RegistrarCurso(stg_nombre, stg_apellido, stg_puesto, stg_email, stg_password, stg_direccion, stg_nacimiento, 2))
                    {
                        int idUser = Registrar.ObtenerId(stg_email);
                        if (idUser != 0)
                        {
                            Response.Redirect("registeruser.aspx?msg=3&id=" + idUser, false);
                        }
                        else
                        {
                            Response.Redirect("registeruser.aspx?msg=4", false);
                        }
                    }
                }
                else if (bln_direccion == true && bln_nacimiento == true && bln_telefono == true)
                {
                    if (Registrar.RegistrarCurso(stg_nombre, stg_apellido, stg_puesto, stg_email, stg_password, stg_direccion, stg_nacimiento, stg_telefono))
                    {
                        int idUser = Registrar.ObtenerId(stg_email);
                        if (idUser != 0)
                        {
                            Response.Redirect("registeruser.aspx?msg=3&id=" + idUser, false);
                        }
                        else
                        {
                            Response.Redirect("registeruser.aspx?msg=4", false);
                        }
                    }
                }
            }
        }

    }
}