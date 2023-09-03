<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resultado.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.Resultado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="alert alert-info">
        <asp:Label ForeColor="Black" Font-Size="Larger" ID="lblResultado" runat="server" CssClass="text-success"></asp:Label>
    </div>
    <br />
    <div>
        <asp:Button ID="btnregresar" OnClick="btnregresar_Click" CssClass="btn btn-alert" runat="server" Text="Regresar ↶" />
    </div>
</asp:Content>
