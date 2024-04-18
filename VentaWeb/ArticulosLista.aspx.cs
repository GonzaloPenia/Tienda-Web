using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;
using System.Web.SessionState;
using System.Collections;

namespace VentaWeb
{
    public partial class ArticulosLista : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        public List<Articulo> ListaDeArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            if (!IsPostBack) //Primera vez que carga la pagina
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("listaArticulos", negocio.ListarConSp());
                dgvArticulos.DataSource = Session["listaArticulos"];
                dgvArticulos.DataBind();
            }

        }

        protected void dgvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("AltaNuevoArticulo.aspx?id=" + id);
        }

        protected void dgvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)   //PAGINADOR
        {

            if (txtFiltro.Text != "")
            {
                dgvArticulos.DataSource = (List<Articulo>)Session["listaFiltrada"];
                dgvArticulos.PageIndex = e.NewPageIndex;
                dgvArticulos.DataBind();
            }

            else if (txtFiltroAvanzado.Text != "")
            {
                dgvArticulos.DataSource = (List<Articulo>)Session["listaFiltradaAvanzada"];
                dgvArticulos.PageIndex = e.NewPageIndex;
                dgvArticulos.DataBind();
            }
            else
            {
                dgvArticulos.DataSource = (List<Articulo>)Session["listaArticulos"];
                dgvArticulos.PageIndex = e.NewPageIndex;
                dgvArticulos.DataBind();
            }
        }

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e) //FILTRO AVANZANDO CHECKBOX
        {
            try
            {
                FiltroAvanzado = chkAvanzado.Checked;
                lblFiltro.Visible = !FiltroAvanzado;
                txtFiltro.Visible = !FiltroAvanzado;
                btnBuscar.Visible = !FiltroAvanzado;
                btnLimpiarFiltro.Visible = !FiltroAvanzado;
                //
                txtFiltroAvanzado.Text = "";
                txtFiltro.Text = "";
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnBuscarAvanzado_Click(object sender, EventArgs e) //FILTRO AVANZANDO
        {
            try
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("listaFiltradaAvanzada", negocio.Filtrar(ddlCampo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString(), txtFiltroAvanzado.Text));
                dgvArticulos.DataSource = (List<Articulo>)Session["listaFiltradaAvanzada"];
                dgvArticulos.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlCriterio.Items.Clear();
                if (ddlCampo.SelectedItem.ToString() == "Codigo")
                {
                    ddlCriterio.Items.Add("Ingrese el codigo");
                }

                else if (ddlCampo.SelectedItem.ToString() == "Precio")
                {

                    ddlCriterio.Items.Add("Igual a");
                    ddlCriterio.Items.Add("Mayor a");
                    ddlCriterio.Items.Add("Menor a");
                }

                else if (ddlCampo.SelectedItem.ToString() == "Nombre")
                {
                    ddlCriterio.Items.Clear();
                    ddlCriterio.Items.Add("Comienza con");
                    ddlCriterio.Items.Add("Termina con");
                    ddlCriterio.Items.Add("Contiene");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnLimpiarFiltro_Click(object sender, EventArgs e)
        {
            try
            {
                txtFiltroAvanzado.Text = "";
                txtFiltro.Text = "";
                dgvArticulos.DataSource = Session["listaArticulos"];
                dgvArticulos.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                //List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
                //List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
                Session.Add("listaFiltrada", negocio.Filtrar("Nombre", "Contiene", txtFiltro.Text));
                dgvArticulos.DataSource = (List<Articulo>)Session["listaFiltrada"];
                dgvArticulos.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}