using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using static ExamenIII.CoEncuesta;

namespace ExamenIII
{
    public class CoEncuesta
    {
        public string NombreDelParticipante { get; set; }
        public int Edad { get; set; }
        public string CorreoElectronico { get; set; }
        public int IDPartidoPolitico { get; set; }


        public void GuardarEncuesta()
        {
            DBCONN db = new DBCONN();
            using (SqlConnection conn = db.ObtenerConexion())
            {

                conn.Open();

            }
        }

        public class DBCONN
    {
        public SqlConnection ObtenerConexion()
        {
            // Aquí va tu cadena de conexión
            string connectionString = "Data Source=(local);Initial Catalog=NombreDeTuBaseDeDatos;Integrated Security=True";

            SqlConnection connection = new SqlConnection(connectionString);

            return connection;
        }
    }

   
        public CoEncuesta() { }

       

        public static int Agregar(string NombreDelParticipante, string CorreoElectronico, int Edad, int IDPartidoPolitico)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBCONN.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AgregarEquipo", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@NombreDelParticipante ", NombreDelParticipante));
                    cmd.Parameters.Add(new SqlParameter("@Edad", Edad));
                    cmd.Parameters.Add(new SqlParameter(" @CorreoElectronico ", CorreoElectronico));
                    cmd.Parameters.Add(new SqlParameter(" @@IDPartidoPolitico ", IDPartidoPolitico)); 


                   retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }

    }

}


