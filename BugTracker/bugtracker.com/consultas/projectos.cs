using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BugTracker.bugtracker.com.consultas
{
    public class projectos
    {
        SqlConnection Conexion = new SqlConnection("Data Source=STORMTK-PC;Initial Catalog=BUGTRACKER;Integrated Security=True");
        //SqlConnection Conexion = new SqlConnection("Data Source=FELIPEKD-PC;Initial Catalog=BUGTRACKER;Integrated Security=True");
        public Boolean RegistrarCurso(string nombre, double monto, DateTime inicio, DateTime final)
        {
            String stg_sql = "INSERT INTO PROYECTO(Nombre, Costo, FechaInicio, FechaFinal) VALUES(@Nombre, @monto, @Inicio, @Final)";
            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(stg_sql, Conexion);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@monto", monto);
                cmd.Parameters.AddWithValue("@Inicio", inicio);
                cmd.Parameters.AddWithValue("@Final", final);
                cmd.ExecuteNonQuery();
                Conexion.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}