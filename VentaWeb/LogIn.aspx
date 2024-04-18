<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="VentaWeb.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form>
        <div class="mb-3">
            <label for="txbUser" class="form-label">Direccion de email</label>
            <asp:TextBox class="form-control" id="txbUser" runat="server" />
            <div id="emailHelp" class="form-text">Nunca te pediremos, ni compartiremos tu mail por otros medios.</div>
        </div>
        <div class="mb-3">
            <label for="txbPassword" class="form-label">Contraseña</label>
            <asp:TextBox class="form-control" id="txbPassword" runat="server" />
            <div id="passwordHelp" class="form-text">Tu contraseña es personal. No la compartas.</div>
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="chkRecuerdame">
            <label class="form-check-label" for="chkRecuerdame">Recuérdame</label>
        </div>       
        <asp:Button id="btnInciarSesion" Text="Iniciar Sesion" class="btn btn-primary" onclick="btnInciarSesion_Click" runat="server" />
        <a href="RecuperarCuenta.aspx" class="btn btn-danger">Olvidé mi contraseña</a>
    </form>
</asp:Content>
