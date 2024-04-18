<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VentaWeb.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>ControlStock!</h1>
    <h2>Bienvenido a nuestra web de control de stock y ventas</h2>
    <!-- INICIO CARDS HEADER -->
        <div class="row row-cols-1 row-cols-md-3 g-4">
        <% foreach(dominio.Articulo Art in ListaDeArticulos)
           { 
                %>
                 <div class="col">
                    <div class="card">
                      <img src="<%: Art.ImagenUrl %>"" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title"><%:  Art.Nombre  %></h5>
                        <p class="card-text"><%: Art.Descripcion %></p>
                          <a href="DetallesArticulo.aspx?id=<%: Art.Identificador %>">Ver detalles</a>
                      </div>
                    </div>
                  </div>
          <%
           }
          %>
    </div>
    <!-- FINAL CARDS HEADER -->
    <br />  
    <br />  
    <!-- INICIO FOOTER -->
    <!-- FINAL DE FOOTER -->
</asp:Content>
