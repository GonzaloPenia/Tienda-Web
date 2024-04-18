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
    public partial class DetallesArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null && !IsPostBack) //
            {
                ArticuloNegocio art = new ArticuloNegocio();
                List<Articulo> lista = art.Listar(Request.QueryString["id"].ToString());
                Articulo seleccionado = lista[0];
                //CARGAR LOS CAMPOS
                txtId.Text = seleccionado.Identificador.ToString();
                txtCodigo.Text = seleccionado.Codigo;
                txtNombre.Text = seleccionado.Nombre;
                txtDescripcion.Text = seleccionado.Descripcion;
                txbMarca.Text = seleccionado.Marca.Descripcion.ToString();
                txbCategoria.Text = seleccionado.Categoria.Descripcion.ToString();
                txtUrlImagen.Text = seleccionado.ImagenUrl;
                txtPrecio.Text = seleccionado.Precio.ToString();
                imgArticulo.ImageUrl = txtUrlImagen.Text;
            }
        }
    }
}