<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="ArticulosLista.aspx.cs" Inherits="VentaWeb.ArticulosLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Lista de Articulos</h1>
    <h2>Para acceder a la lista de articulos debes estar logeado.</h2>

        <%
        if (Session["usuario"] != null )  
    
            { %>
    <!-- Filtro basico -->
    <div class="row">
        <div class="col-6">
                <asp:Label Text="Busqueda simple por nombre de Articulo" ID="lblFiltro" runat="server" />
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <asp:TextBox ID="txtFiltro" CssClass="form-control" AutoPostBack="true" runat="server" />
                <asp:Button Text="Buscar" ID="btnBuscar" runat="server" class="btn btn-primary "  OnClick ="btnBuscar_Click" />
                <asp:Button Text="Limpiar filtro" ID="btnLimpiarFiltro" runat="server" class="btn btn-secondary" OnClick="btnLimpiarFiltro_Click" />
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:CheckBox Text="¿Busqueda avanzada?" CssClass="" ID="chkAvanzado" AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged" runat="server" />
            </div>
        </div>
    </div>
    <!-- Filtro basico -->

    <!-- Filtro avanzado -->
    <% if (FiltroAvanzado)
        { %>
    <div class="row">
        <!-- CAMPO -->
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Busqueda avanzada:" ID="lblFiltroAvanzado" runat="server" />
                <asp:Label Text="Campo" runat="server" />
                <asp:DropDownList ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Nombre" />
                    <asp:ListItem Text="Codigo" />
                    <asp:ListItem Text="Precio" />
                </asp:DropDownList>
            </div>
        </div>
        <!-- CAMPO -->

        <!-- CRITERIO -->
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Criterio" runat="server" />
                <asp:DropDownList ID="ddlCriterio" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Empieza con" />
                    <asp:ListItem Text="Termina con" />
                    <asp:ListItem Text="Contiene" />
                </asp:DropDownList>
            </div>
        </div>
        <!-- CRITERIO -->

        <!-- FILTRO -->
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Filtro" runat="server" />
                <asp:TextBox ID="txtFiltroAvanzado" CssClass="form-control" runat="server" />
            </div>
        </div>
        <!-- FILTRO -->
        <div class="col-3">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <asp:Button Text="Buscar" class="btn btn-primary" runat="server" OnClick="btnBuscarAvanzado_Click" />
                <asp:Button Text="Limpiar filtro" class="btn btn-secondary" runat="server" OnClick="btnLimpiarFiltro_Click" />
            </div>
        </div>

    </div>

    <% }%>
    <asp:GridView ID="dgvArticulos" CssClass="table" runat="server" DataKeyNames="Identificador" AutoGenerateColumns="false"
        AllowPaging="true" PageSize="3" OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" OnPageIndexChanging="dgvArticulos_PageIndexChanging">
        <Columns>
            <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Marca" DataField="Marca" />
            <asp:BoundField HeaderText="Categoria" DataField="Categoria" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" />
            <asp:CommandField HeaderText="Modificar/Eliminar" ShowSelectButton="true" SelectText="📝" />
        </Columns>
    </asp:GridView>
    <a href="AltaNuevoArticulo.aspx" class="btn btn-primary">Nuevo Articulo</a>
     <% }%>

</asp:Content>
