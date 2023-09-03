<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="titulos">Detalle de Reservación</h2>
       <div>
        <table border="1" class="tabla">
          <tr>
            <th> Nº De Reservación</th>
              <th><asp:TextBox ID="txtnreservacion" runat="server" Enabled="false"></asp:TextBox></th>
          </tr>
          <tr>
              <th>Hotel</th>
              <th><asp:TextBox ID="txthotel" runat="server"  Enabled="false"></asp:TextBox></th>
          </tr>
            <tr>
              <th>Número De Habitación</th>
              <th><asp:TextBox ID="txtnumha" runat="server" Enabled="false"></asp:TextBox></th>
          </tr>
            <tr>
              <th>Cliente</th>
              <th><asp:TextBox ID="txtcliente" runat="server" Enabled="false"></asp:TextBox></th>
          </tr>
            <tr>
              <th>Fecha De Entrada</th>
              <th><asp:TextBox ID="txtfechaen" runat="server" DataFormatString="{0:dd/MM/yyyy}" Enabled="false"></asp:TextBox></th>
          </tr>
            <tr>
              <th>Fecha De Salida</th>
              <th><asp:TextBox ID="txtfechasal" runat="server" DataFormatString="{0:dd/MM/yyyy}" Enabled="false"></asp:TextBox></th>
          </tr>
            <tr>
              <th>Dias De La Reservación</th>
              <th><asp:TextBox ID="txtdiareserva" runat="server" Enabled="false"></asp:TextBox></th>
          </tr>
            <tr>
              <th>Número De Niños</th>
              <th><asp:TextBox ID="txtnumninos" runat="server" Enabled="false"></asp:TextBox></th>
          </tr>
            <tr>
              <th>Número De Adultos</th>
              <th><asp:TextBox ID="txtnumadultos" runat="server" Enabled="false"></asp:TextBox></th>
          </tr>
           <tr>
              <th>Costo Total</th>
              <th><asp:TextBox ID="txtcostototal" runat="server" Enabled="false"></asp:TextBox></th>
          </tr>
        </table> <br>
           <div class="listabotonesdetalle">
            <asp:Button ID="btneditar" runat="server" Visible="false" OnClick="btneditar_Click" Text="Editar ✎" Width="98px" CssClass="btn btn-success" />
            <asp:Button ID="btncancelar" data-toggle="modal" Visible="false" href="#mycancelar" runat="server" OnClick="btncancelar_Click" Text="Cancelar ✖ " Width="106px" CssClass="btn btn-danger" />
           <asp:Button ID="btnregresar" runat="server" OnClick="btnregresar_Click" CssClass="btn btn-default" Text="↶ Regresar " Width="104px" />
           </div>
       </div>
    <br>
    <asp:Panel ID="PaneGrid" Visible="false" runat="server">
    <div >
    
        <h2 class="titulos" >Lista De Acciones realizadas</h2>
        <asp:GridView ID="GrdDetalle" Visible="false" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" HeaderStyle-CssClass="listacciones" RowStyle-CssClass="rows">
        <Columns>
            <asp:BoundField DataField="fechaDeLaAccion" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy HH:mm}"/>
            <asp:BoundField DataField="accionRealizada" HeaderText="Accion" />
            <asp:BoundField DataField="nombreCompleto" HeaderText="Realizada Por" />
        </Columns>
    </asp:GridView>
</div></asp:Panel>
</asp:Content>
