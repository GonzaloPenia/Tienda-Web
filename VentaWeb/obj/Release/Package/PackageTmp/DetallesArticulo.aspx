<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="DetallesArticulo.aspx.cs" Inherits="VentaWeb.DetallesArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h1>Detalles articulo:</h1>
    <br />

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Codigo</label>
                <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripcion</label>
                <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label for="txtMarca" class="form-label">Marca</label>
                <asp:TextBox ID="txbMarca" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtCategoria" class="form-label">Categoria</label>             
                <asp:TextBox ID="txbCategoria" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtPrecio" class="form-label">Precio</label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
            </div>
            <div class="mb-3">
                
                <a href="Default.aspx" class="btn btn-secondary">Volver</a>

            </div>

          
        </div>
        <!-- COLUMNA DERECHA -->
        <div class="col-6">

            <div class="mb-3">
                <label for="txtUrlImagen" class="form-label">Imagen</label>
                <asp:TextBox runat="server" ID="txtUrlImagen" CssClass="form-control" AutoPostBack="true" />
            </div>
            <div class="mb-3">
                <asp:Image ImageUrl="https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png"
                    ID="imgArticulo" runat="server" Width="60%" />
            </div>


        </div>
        <!-- COLUMNA DERECHA -->

    </div>

</asp:Content>
