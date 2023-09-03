<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EdicionHabitacion.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.EdicionHabitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="minititulo">Editar Habitación</h2>
   <div class="cuadro2"> <div>
         <asp:HiddenField ID="hdnidhabit" runat="server" />

      <asp:Label ID="lblho" CssClass="labels" runat="server" Text="Hotel"></asp:Label><br>
      <asp:TextBox ID="txthotel" Enabled="false" runat="server"></asp:TextBox>
         
  </div><br> 
    <div>
      <asp:Label ID="lblnumha" CssClass="labels" runat="server" Text="Número Habitación"></asp:Label><br>
      <asp:TextBox ID="txtnumhabitacion" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Reqnumha" ControlToValidate="txtnumhabitacion" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
  </div>
       <asp:Label ID="lblmensaje" runat="server" ForeColor="#cc0000" Text="El número de Habitación ya exíste" Visible="false"></asp:Label>
       <br>
     <div>
      <asp:Label ID="lblcapmax" CssClass="labels"  runat="server" Text="Capacidad Máxima"></asp:Label><br>
      <asp:TextBox ID="txtcapacidadmax" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="reqcapmax" ControlToValidate="txtcapacidadmax" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
          <asp:RangeValidator ID="Rgcapmax" MinimumValue="1" Display="Dynamic" MaximumValue="8" Type="Integer" ControlToValidate="txtcapacidadmax" runat="server" ErrorMessage="El valor mínimo es de 1 y el máximo de 8" ForeColor="#cc0000"
             Font-Size="Small"></asp:RangeValidator>
  </div>
       <br>
     <div>
         <asp:Label ID="lbldesc" CssClass="labels"  runat="server" Text="Descripción"></asp:Label><br>
         <asp:TextBox ID="txtdescripcion" MaxLength="500" runat="server" Height="120px" Width="444px"></asp:TextBox>
  </div>
    <br>
    <div>
        <asp:Button ID="btnguardar" OnClick="btnguardar_Click" runat="server" CssClass="btn btn-primary" Text="Guardar" />
        <asp:Button ID="btninactivar" OnClick="btninactivar_Click" runat="server" CssClass="btn btn-danger" Text="Inactivar" />
        <asp:Button ID="btnregresar" OnClick="btnregresar_Click" CausesValidation="false" runat="server" CssClass="btn btn-default" Text="Regresar" />


    </div></div> 
</asp:Content>
