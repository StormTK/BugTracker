using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BugTracker.bugtracker.com.consultas
{
    public class usuario
    {
        SqlConnection Conexion = new SqlConnection("Data Source=STORMTK-PC;Initial Catalog=BUGTRACKER;Integrated Security=True");
        //SqlConnection Conexion = new SqlConnection("Data Source=FELIPEKD-PC;Initial Catalog=BUGTRACKER;Integrated Security=True");
        public Boolean Login(String Email, String Password)
        {
            String stg_sql = "SELECT COUNT(*)FROM USUARIO WHERE Email = @Email AND PWDCOMPARE(@Pass, Contraseña ) = 1";
            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(stg_sql, Conexion);//ejecutamos la instruccion
                cmd.Parameters.AddWithValue("@Email", Email); //enviamos los parametros
                cmd.Parameters.AddWithValue("@Pass", Password); //enviamos los parametros
                int count = Convert.ToInt32(cmd.ExecuteScalar()); //devuelve la fila afectada
                Conexion.Close();
                if (count == 0)
                    return false;
                else
                    return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public String MostrarUsuario(int idusuario)
        {
            String stg_sql = "SELECT ROL.Nombre AS NombreRol, DATENAME(Day, USUARIO.Nacimiento) + ' de ' + DATENAME(month, USUARIO.Nacimiento) + ' de ' + DATENAME(YEAR, USUARIO.Nacimiento) AS Nacimiento, USUARIO.Nombre + ' ' + USUARIO.Apellido As NombreUsuario, USUARIO.Telefono, USUARIO.Direccion, USUARIO.Email FROM ROL INNER JOIN USUARIO ON ROL.idRol = USUARIO.Rol WHERE USUARIO.idUsuario = @idusuario";
            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(stg_sql, Conexion);
                cmd.Parameters.AddWithValue("@idusuario", idusuario);
                SqlDataReader resultado = cmd.ExecuteReader();
                resultado.Read();
                String HTMLUser = "<div class=\"user_header\"> <div class=\"iconoprogramer\"> <span class=\"icon-programmer\"></span> </div> <div class=\"nombre\">";
                String nombre = resultado["NombreUsuario"].ToString();
                String rol = resultado["NombreRol"].ToString();
                HTMLUser += "<h2>" + nombre + "</h2>" + "<p>" + rol + "</p> </div> </div>";

                String email = resultado["Email"].ToString();
                HTMLUser += "<div class=\"informacion\"> <div class=\"dato\"> <p>EMAIL:</p> <p>" + email + "</p></div>";
                String direccion = resultado["Direccion"].ToString();
                HTMLUser += "<div class=\"dato\"> <p>DIRECCION:</p> <p>" + direccion + "</p></div>";
                String telefono = resultado["Telefono"].ToString();
                HTMLUser += "<div class=\"dato\"> <p>TELEFONO:</p> <p>" + telefono + "</p></div>";
                String nacimiento = resultado["Nacimiento"].ToString();
                HTMLUser += "<div class=\"dato\"> <p>FECHA DE NACIMIENTO:</p> <p>" + nacimiento.ToUpper() + "</p></div> </div>";
                Conexion.Close();
                return HTMLUser;
            }
            catch (Exception)
            {
                return "No se encontro este usuario";
            }
        }
        public int ObtenerId(String Email)
        {
            String stg_sql = "SELECT * FROM USUARIO WHERE Email = @Email";
            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(stg_sql, Conexion);
                cmd.Parameters.AddWithValue("@Email", Email);
                SqlDataReader resultado = cmd.ExecuteReader();
                resultado.Read();
                String id = resultado["idUsuario"].ToString();
                int idUsuario = Int32.Parse(id);
                Conexion.Close();
                return idUsuario;
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public Boolean RegistrarCurso(string nombre, string apellido, int rol, string email, string password)
        {
            String stg_sql = "INSERT INTO USUARIO(Nombre, Apellido, Rol, Email, Contraseña) VALUES(@Nombre, @Apellido, @Rol, @Email, PWDENCRYPT( @Contraseña ))";
            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(stg_sql, Conexion);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Apellido", apellido);
                cmd.Parameters.AddWithValue("@Rol", rol);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Contraseña", password);
                cmd.ExecuteNonQuery();
                Conexion.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public Boolean RegistrarCurso(string nombre, string apellido, int rol, string email, string password, string dato, int columna)
        {
            String stg_sql = "";

            switch (columna)
            {
                case 1:
                    stg_sql = "INSERT INTO USUARIO(Nombre, Apellido, Rol, Email, Contraseña, Direccion) VALUES(@Nombre, @Apellido, @Rol, @Email, PWDENCRYPT( @Contraseña ), @dato)";
                    break;
                case 2:
                    stg_sql = "INSERT INTO USUARIO(Nombre, Apellido, Rol, Email, Contraseña, Nacimiento) VALUES(@Nombre, @Apellido, @Rol, @Email, PWDENCRYPT( @Contraseña ), @dato)";
                    break;
                case 3:
                    stg_sql = "INSERT INTO USUARIO(Nombre, Apellido, Rol, Email, Contraseña, Telefono) VALUES(@Nombre, @Apellido, @Rol, @Email, PWDENCRYPT( @Contraseña ), @dato)";
                    break;
            }

            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(stg_sql, Conexion);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Apellido", apellido);
                cmd.Parameters.AddWithValue("@Rol", rol);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Contraseña", password);
                cmd.Parameters.AddWithValue("@dato", dato);
                cmd.ExecuteNonQuery();
                Conexion.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public Boolean RegistrarCurso(string nombre, string apellido, int rol, string email, string password, string dato1, string dato2, int columna)
        {
            String stg_sql = "";

            switch (columna)
            {
                case 1:
                    stg_sql = "INSERT INTO USUARIO(Nombre, Apellido, Rol, Email, Contraseña, Direccion, Nacimiento) VALUES(@Nombre, @Apellido, @Rol, @Email, PWDENCRYPT( @Contraseña ), @dato1, @dato2)";
                    break;
                case 2:
                    stg_sql = "INSERT INTO USUARIO(Nombre, Apellido, Rol, Email, Contraseña, Nacimiento, Telefono) VALUES(@Nombre, @Apellido, @Rol, @Email, PWDENCRYPT( @Contraseña ), @dato1, @dato2)";
                    break;
            }
            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(stg_sql, Conexion);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Apellido", apellido);
                cmd.Parameters.AddWithValue("@Rol", rol);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Contraseña", password);
                cmd.Parameters.AddWithValue("@Ddato1", dato1);
                cmd.Parameters.AddWithValue("@Fdato2", dato2);
                cmd.ExecuteNonQuery();
                Conexion.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public Boolean RegistrarCurso(string nombre, string apellido, int rol, string email, string password, string direccion, string fecha, string telefono)
        {
            String stg_sql = "INSERT INTO USUARIO(Nombre, Apellido, Rol, Email, Contraseña, Direccion, Nacimiento,Telefono) VALUES(@Nombre, @Apellido, @Rol, @Email, PWDENCRYPT( @Contraseña ), @Direccion, @Fecha, @Telefono)";
            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(stg_sql, Conexion);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Apellido", apellido);
                cmd.Parameters.AddWithValue("@Rol", rol);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Contraseña", password);
                cmd.Parameters.AddWithValue("@Direccion", direccion);
                cmd.Parameters.AddWithValue("@Fecha", fecha);
                cmd.Parameters.AddWithValue("@Telefono", telefono);
                cmd.ExecuteNonQuery();
                Conexion.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public String[] SesionUsuario(String Email)
        {
            String stg_sql = "SELECT * FROM USUARIO WHERE Email = @Email";
            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(stg_sql, Conexion);
                cmd.Parameters.AddWithValue("@Email", Email);
                SqlDataReader resultado = cmd.ExecuteReader();
                resultado.Read();
                String id = resultado["idUsuario"].ToString();
                String nombre = resultado["Nombre"].ToString();
                String apellido = resultado["Apellido"].ToString();
                String rol = resultado["Rol"].ToString();
                String email = resultado["Email"].ToString();
                String[] DatosUsuario = { id, nombre, apellido, rol, email };
                Conexion.Close();
                return DatosUsuario;
            }
            catch (Exception)
            {
                return null;
            }
        }
        public Boolean VerificarEmail(String Email)
        {
            String stg_sql = "SELECT COUNT(*)FROM USUARIO WHERE Email = @Email ";
            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(stg_sql, Conexion);//ejecutamos la instruccion
                cmd.Parameters.AddWithValue("@Email", Email); //enviamos los parametros
                int count = Convert.ToInt32(cmd.ExecuteScalar()); //devuelve la fila afectada
                Conexion.Close();
                if (count == 0)
                    return false;
                else
                    return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

    }
}