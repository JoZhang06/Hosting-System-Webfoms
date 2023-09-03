<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreacionHabitacion.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.CreacionHabitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2 class="minititulo">Crear Habitación</h2>
  <div class="cuadro">
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblhotel" CssClass="labels" runat="server" Font-Bold="true" Text="Hotel"></asp:Label><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlhotel" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="Reqhotel" ControlToValidate="ddlhotel" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        <br />
        <br />
    </div>
 <div>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblnumha" CssClass="labels" runat="server" Text="Número De Habitación"></asp:Label><br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtnumha" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="Reqnumha" ControlToValidate="txtnumha" runat="server" ForeColor="#cc0000"
             Font-Size="Small" Display="Dynamic" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
  </div>
     
     <div>
      &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="lblcapmax" CssClass="labels" runat="server" Text="Capaxidad Máxima"></asp:Label><br>
      &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox ID="txtcapmax" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="Reqcapmax" ControlToValidate="txtcapmax" runat="server" ForeColor="#cc0000"
             Font-Size="Small" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
         <asp:RangeValidator ID="Rgcapmax" Type="Integer" Display="Dynamic" MinimumValue="1" MaximumValue="8" ControlToValidate="txtcapmax" runat="server" ErrorMessage="El valor mínimo es de 1 y el máximo de 8" ForeColor="#cc0000"
             Font-Size="Small"></asp:RangeValidator>
  </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Label ID="lblmensaje" runat="server" ForeColor="#cc0000" Text="El número de Habitación ya exíste" Visible="false"></asp:Label>
      <br>
     <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lbldesc" CssClass="labels" runat="server" Text="Descripción"></asp:Label><br>
         <asp:TextBox ID="txtdesc" MaxLength="500" runat="server" Height="120px" Width="244px" style="margin-left: 29px"></asp:TextBox>
  </div>
    <br>
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnguardar" OnClick="btnguardar_Click" runat="server" CssClass="btn btn-primary" Text="Guardar" />
        <asp:Button ID="btnregresar" CausesValidation="false" OnClick="btnregresar_Click" runat="server" CssClass="btn btn-default" Text="Regresar" />

    </div>
    </div>
        
</asp:Content>
