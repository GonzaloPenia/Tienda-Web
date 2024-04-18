<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="AltaNuevoArticulo.aspx.cs" Inherits="VentaWeb.FormNuevoArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Ingreso nuevo articulo</h1>
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
                <!-- DropDownList (Samsung, Motorola, Xiaomi ó Apple) -->
                <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label for="txtCategoria" class="form-label">Categoria</label>
                <!-- DropDownList () -->
                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label for="txtPrecio" class="form-label">Precio</label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <a href="ArticulosLista.aspx" class="btn btn-secondary">Cancelar</a>

            </div>

            <!-- ELIMINACION -->
            <asp:ScriptManager ID="aa" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" runat="server" />
                    </div>
                    <%if (ConfirmarEliminacion)
                        { %>
                    <div class="mb-3">
                        <asp:CheckBox Text="¿Está seguro? Marque la casilla" ID="chkConfirmarEliminacion" CssClass="btn btn-outline-warning" runat="server" />

                        <asp:Button Text="Confirmar eliminar" ID="btnConfirmarEliminar" OnClick="btnConfirmarEliminar_Click" CssClass="btn btn-danger" runat="server" />
                    </div>
                    <%} %>
                </ContentTemplate>
            </asp:UpdatePanel>
            <!-- ELIMINACION -->
        </div>
        <!-- COLUMNA DERECHA -->
        <div class="col-6">

            <div class="mb-3">
                <label for="txtUrlImagen" class="form-label">Imagen</label>
                <asp:TextBox runat="server" ID="txtUrlImagen" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtUrlImagen_TextChanged" />
            </div>
            <div class="mb-3">
                <asp:Image ImageUrl="https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png"
                    ID="imgArticulo" runat="server" Width="60%" />
            </div>


        </div>
        <!-- COLUMNA DERECHA -->

    </div>
</asp:Content>
