<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarReservacion.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.ModificarReservacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <h2 class="minititulo">Modificar Reservación</h2>
  <div class="cuadro2"><div>

      <asp:Label ID="lblho" CssClass="labels"  runat="server" Text="Hotel"></asp:Label><br>
      <asp:TextBox ID="txthotel" Font-Bold="true" Enabled="false" runat="server" Width="202px"></asp:TextBox>
  </div><br>
     <div>
      <asp:Label ID="lblnumha" CssClass="labels"  Enabled="false" runat="server" Text="Número Habitación"></asp:Label><br>
      <asp:TextBox ID="txtnumhabitacion" Font-Bold="true" Enabled="false" Width="202px" runat="server"></asp:TextBox>
  </div><br>
     <div>
      <asp:Label ID="lblclient" CssClass="labels"  Enabled="false" runat="server" Text="Cliente"></asp:Label><br>
      <asp:TextBox ID="txtcliente"  Font-Bold="true" Enabled="false" Width="202px" runat="server"></asp:TextBox>
  </div>
    <br>
    <div>

    <table class="default">
  <tr>
    <td class="labels"><b>Fecha Entrada</td>
    <td class="labels"><b>Fecha Salida</td>
  </tr>
  <tr>
    <td><asp:TextBox ID="txtfechaentrada" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="Reqfechaentrada" Display="Dynamic" ControlToValidate="txtfechaentrada" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="Cvfechen" runat="server" Display="Dynamic" ForeColor="#cc0000"
             Font-Size="Small" ControlToValidate="txtfechaentrada" OnServerValidate="Cvfechen_ServerValidate" ErrorMessage="La fecha debe ser mayor a la fecha actual"></asp:CustomValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
    <td><asp:TextBox ID="txtfechasal" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="Reqfechasal" ControlToValidate="txtfechasal" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="Cvfechsal" runat="server" Display="Dynamic" ForeColor="#cc0000"
             Font-Size="Small" ControlToValidate="txtfechasal" OnServerValidate="Cvfechsal_ServerValidate" ErrorMessage="La fecha de salida no debe ser menor a la fecha de entrada"></asp:CustomValidator>
   </td>
  </tr>
    
    <tr>
    <td class="labels"><b>Número de Niños</td>
    <td class="labels"><b>Número De Adultos</td>

  </tr>
  <tr>
          <td><asp:TextBox ID="txtnuminos" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Reqnumninos" ControlToValidate="txtnuminos" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="Rgnumninos" ForeColor="#cc0000"
             Font-Size="Small"  Type="Integer" runat="server" ControlToValidate="txtnuminos" MinimumValue="0" MaximumValue="8" ErrorMessage="El valor mínimo es de 0"></asp:RangeValidator>
        
    </td>
    <td><asp:TextBox ID="txtnumadultos" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Reqnumadultos" Display="Dynamic" ControlToValidate="txtnumadultos" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="Rgnumadultos" ForeColor="#cc0000"
             Font-Size="Small" Type="Integer" MinimumValue="1" ControlToValidate="txtnumadultos" MaximumValue="8" runat="server" ErrorMessage="El valor mínimo es de 1"></asp:RangeValidator>
    </td>

  </tr>

</table>
 </div>
    <br>
    <div>
        <asp:Button ID="btnguardar" OnClick="btnguardar_Click" runat="server" CssClass="btn btn-primary" Text="Guardar" />
        <asp:Button ID="btnregresar" CausesValidation="false" OnClick="btnregresar_Click" runat="server" CssClass="btn btn-default" Text="Regresar" />

    </div></div>
</asp:Content>
