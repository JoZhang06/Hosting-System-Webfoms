<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.Error1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div CssClass="cuadro" >
    <div>
        <asp:Label ID="Lblresultado" CssClass="label label-warning" Font-Size="Larger" runat="server" Text="Al parecer algo ha salido mal :("></asp:Label>
    </div>  <br /><br />
    <div >
        &nbsp;<asp:Button ID="Btnregresar" OnClick="Btnregresar_Click" CssClass="btn btn-danger" runat="server" Text="Regresar" />
   </div>
          <div class="foot">

    </div>
       </div>
</asp:Content>
