using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VentaWeb
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Articulo> ListaDeArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();// Declaro un nuevo objeto Articulo
            ListaDeArticulos = negocio.ListarConSp();       // Uso el metodo ListarConSP
        }
    }
}