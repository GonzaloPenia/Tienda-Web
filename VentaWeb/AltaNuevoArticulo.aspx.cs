using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace VentaWeb
{
    public partial class FormNuevoArticulo : System.Web.UI.Page
    {
        public bool ConfirmarEliminacion { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            ConfirmarEliminacion = false;
            try
            {
                //FORMULARIO DE CARGA DEFAULT
                if (!IsPostBack) //El término postback tiene un significado en el cual el cliente solicita un llamado a un servidor a otra página web y esta demora un tiempo considerable de respuesta hacia el cliente.
                                    //En este caso, se usa el !IsPostBack para verificar que es la primera vez que se esta cargando la pantalla
                
                {
                    CategoriaNegocio cat = new CategoriaNegocio();
                    List<Categoria> lista_cat = cat.Listar();
                    ddlCategoria.DataSource = lista_cat;
                    ddlCategoria.DataValueField = "Id";         //  Dato oculto, value
                    ddlCategoria.DataTextField = "Descripcion"; //  Dato visible en pantalla
                    ddlCategoria.DataBind();
                    //
                    MarcaNegocio mar = new MarcaNegocio();
                    List<Marca> lista_mar = mar.Listar();
                    ddlMarca.DataSource = lista_mar;
                    ddlMarca.DataValueField = "Id";             //  Dato oculto, value
                    ddlMarca.DataTextField = "Descripcion";     //  Dato visible en pantalla
                    ddlMarca.DataBind();
                }
                //FORMULARIO DE MODIFICACION DE ARTICULO EXISTENTE
                if (Request.QueryString ["id"] != null && !IsPostBack) //
                {
                    ArticuloNegocio art = new ArticuloNegocio();
                    List <Articulo> lista = art.Listar(Request.QueryString["id"].ToString());
                    Articulo seleccionado = lista[0];
                    //CARGAR LOS CAMPOS
                    txtId.Text= seleccionado.Identificador.ToString();
                    txtCodigo.Text=seleccionado.Codigo;
                    txtNombre.Text= seleccionado.Nombre;
                    txtDescripcion.Text= seleccionado.Descripcion; 
                    ddlMarca.SelectedValue= seleccionado.Marca.Id.ToString();
                    ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                    txtUrlImagen.Text= seleccionado.ImagenUrl;
                    txtPrecio.Text= seleccionado.Precio.ToString();
                    imgArticulo.ImageUrl = txtUrlImagen.Text;
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex); //Guardo el error en sesion
                throw;
                //Redirect
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e) //Boton de "Aceptar" = Agregar nuevo articulo.
        {

            try
            {
                Articulo nuevo = new Articulo(); //Creo un nuevo articulo
                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;

                nuevo.Marca = new Marca();
                nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue); //

                nuevo.Categoria = new Categoria();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

                nuevo.ImagenUrl = txtUrlImagen.Text;
                nuevo.Precio = int.Parse(txtPrecio.Text);
                //
                ArticuloNegocio Negocio = new ArticuloNegocio();

                if (Request.QueryString["id"] != null) 
                {
                    nuevo.id = int.Parse(txtId.Text);
                    Negocio.ModificarConSP(nuevo);
                    Response.Redirect("ArticulosLista.aspx");
                }

                else 
                { 
                    Negocio.AgregarConSP(nuevo);
                    Response.Redirect("ArticulosLista.aspx");
                }

            } 
            catch (Exception ex)
            {
                //Session.Add("Error", ex); //Guardo el error en sesion
                throw ex;
                //Redirect
            }



        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtUrlImagen.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmarEliminacion = true;
        }

        protected void btnConfirmarEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmarEliminacion.Checked) 
                { 
                ArticuloNegocio negocio = new ArticuloNegocio();
                negocio.Eliminar(int.Parse(txtId.Text));
                Response.Redirect("ArticulosLista.aspx");
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        //Si llega con un ID en la Url es porque no deseo ingresar un nuevo Articulo, sino que quiero modificar un existente

    }
}