using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Linq.Expressions;
using Microsoft.Win32;
using System.Data;
using System.Configuration;
using System.Net.Sockets;

namespace negocio
{
    public class AccesoDatos
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;
        
        public SqlDataReader Lector
        {
            get { return lector;} 
        }

        public AccesoDatos()
        {
        //conexion = new SqlConnection(ConfigurationManager.AppSettings["cadenaConexion"]) ; // DA ERROR
        //conexion = new SqlConnection("server=.\\SQLEXPRESS; database=CATALOGOWEB2024; integrated security =true"); //LOCAL
        conexion = new SqlConnection("workstation id = CATALOGOWEB2024.mssql.somee.com; packet size = 4096; user id = Kurari_SQLLogin_1; pwd = hjoyhcvm53; data source = CATALOGOWEB2024.mssql.somee.com; persist security info = False; initial catalog = CATALOGOWEB2024; TrustServerCertificate = True");
        comando = new SqlCommand();
        }

        public void SetearConsulta(string consulta)
        { 
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }

        public void SetearParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        public void EjecutarLectura() 
        { 
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex) 
            {
                throw ex;
            }
        }

        public void CerrarConexion()
        { 
            if (lector != null)
                lector.Close();
            conexion.Close();
        }

        public void EjecutarAccion()
        {
            comando.Connection = conexion;
            try 
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }

            catch (Exception ex) 
            { 
                throw ex; 
            }


        }

        public void SetearProcedimiento(string sp)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = sp;
        }
    }
}
