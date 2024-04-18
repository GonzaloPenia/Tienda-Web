<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="RecuperarCuenta.aspx.cs" Inherits="VentaWeb.RecuperarCuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>¿Olvidaste tu contraseña? </h1>
    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Ingrese el mail de la cuenta que desea recuperar</label>
        <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
        Si hay un mail registrado te enviaremos un link para continuar con el proceso.
        <br />
        <br />
        <button type="button" class="btn btn-primary">Enviar</button>
    </div>
    <h2>¿Tenés otro problema para iniciar sesion?</h2>
    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Dejanos un email para poder contactarte</label>
        <input type="email" class="form-control" id="exampleFormControlInput2" placeholder="email@ejemplo.com">
    </div>
    <div class="mb-3">
        <label for="exampleFormControlTextarea1" class="form-label">Contanos tu problema... Alguien de soporte se contactará en breves para ayudarte!</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
        <br />
        <button type="button" class="btn btn-primary">Solicitar ayuda</button>
        <button type="button" class="btn btn-secondary">Cancelar</button>
    </div>
</asp:Content>
