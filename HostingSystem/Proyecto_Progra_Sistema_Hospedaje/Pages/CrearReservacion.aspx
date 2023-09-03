<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearReservacion.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.CrearReservacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="minititulo">Crear Reservación</h2>
  <div class="cuadro2">
    <div>
        <asp:Label ID="lblcliente" CssClass="labels" runat="server" Font-Bold="true" Text="Cliente"></asp:Label><br>
        <asp:DropDownList ID="ddlcliente" Enabled="false" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="Reqcliente" Display="Dynamic" ControlToValidate="ddlcliente" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
    </div><br />
    <div>
        <asp:Label ID="lblhotel" CssClass="labels" runat="server" Font-Bold="true" Text="Hotel"></asp:Label><br>
        <asp:DropDownList ID="ddlhotel" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="Reqhotel" Display="Dynamic" ControlToValidate="ddlhotel" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
    </div>
    <br>
  <div>  
    <table class="default" style="width: 396px">
  <tr>
    <td class="labels" style="height: 20px"><b>Fecha De Entrada</b></td>
    <td class="labels" style="height: 20px"><b>Fecha De Salida</b></td>
  </tr>
  <tr>
    <td><asp:TextBox ID="txtfechaentrada" TextMode="DateTime" placeholder="01/01/2022" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Reqfechaentrada" Display="Dynamic" ControlToValidate="txtfechaentrada" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="Cvfechen" runat="server" Display="Dynamic" ForeColor="#cc0000"
             Font-Size="Small" ControlToValidate="txtfechaentrada" OnServerValidate="Cvfechen_ServerValidate" ErrorMessage="La fecha debe ser mayor a la fecha actual"></asp:CustomValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    </td>
    <td><asp:TextBox ID="txtfechasal" TextMode="DateTime" placeholder="31/01/2022" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Reqfechasal" ControlToValidate="txtfechasal" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="Cvfechsal" runat="server" Display="Dynamic" ForeColor="#cc0000"
             Font-Size="Small" ControlToValidate="txtfechasal" OnServerValidate="Cvfechsal_ServerValidate" ErrorMessage="La fecha de salida no debe ser menor a la fecha de entrada"></asp:CustomValidator>
    </td>
  </tr>
    
    <tr>
    <td class="labels"><b>Número De Adultos</td>
    <td class="labels"><b>Número De Niños</td>
  </tr>
  <tr>
    <td><asp:TextBox ID="txtnumadultos" TextMode="Number" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="Reqnumadultos" Display="Dynamic" ControlToValidate="txtnumadultos" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="Rgnumadultos" ControlToValidate="txtnumadultos" Type="Integer" ForeColor="#cc0000"
             Font-Size="Small" MinimumValue="1" MaximumValue="8" Display="Dynamic" runat="server" ErrorMessage="El valor mínimo es de 1"></asp:RangeValidator>
   
     </td><br>
    <td><asp:TextBox ID="txtnuminos" TextMode="Number" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="Reqnumninos" ControlToValidate="txtnuminos" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="Rgnumninos" ForeColor="#cc0000"
             Font-Size="Small" Type="Integer" runat="server" Display="Dynamic" ControlToValidate="txtnuminos" MinimumValue="0" MaximumValue="8" ErrorMessage="El valor mínimo es de 0"></asp:RangeValidator> 
        </td>
  </tr>

</table>
 </div>
      <div>
          <asp:HiddenField ID="hdfidhabitacion" Value="idHabitacion" runat="server" />
      </div>
    <br>
    <div>
        <asp:Button ID="btnguardar" OnClick="btnguardar_Click" runat="server" CssClass="btn btn-primary" Text="Guardar" />
        <asp:Label ID="lblmensaje" Visible="false" runat="server" Text="text-danger" CssClass=""></asp:Label>
        <asp:Button ID="btnregresar" OnClick="btnregresar_Click" CausesValidation="false" runat="server" CssClass="btn btn-default" Text="Regresar" />

    </div>
</div>
</asp:Content>
