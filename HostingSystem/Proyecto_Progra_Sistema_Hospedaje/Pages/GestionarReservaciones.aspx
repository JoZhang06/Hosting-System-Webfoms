<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionarReservaciones.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.GestionarReservaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2 class="titulos">Gestionar Reservaciones</h2>
    <div>
        <span class="cliente">Seleccione Un Cliente</span><br>
        <asp:DropDownList ID="ddlcliente" Font-Bold="true" ForeColor="#660033" runat="server" Width="200px"></asp:DropDownList>
         <asp:Label ID="lblfiltro" ForeColor="#cc0000" Visible="false" runat="server" Text="No se encontró ningún cliente con los datos ingresados "></asp:Label>
        
        <br />
        <br>
        <asp:TextBox ID="txtfechaentrada" TextMode="Date" placeholder="01/01/2022" Font-Bold="true" ForeColor="#660033" runat="server" Width="162px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvfechaen" runat="server" ForeColor="#cc0000" ControlToValidate="txtfechaentrada" ErrorMessage="Digite una fecha" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cvfecha" runat="server" ErrorMessage="La fecha de entrada no puede ser mayor a la fecha de salida"
             ControlToValidate="txtfechaentrada" OnServerValidate="cvfecha_ServerValidate" ForeColor="#cc0000" Display="Dynamic"></asp:CustomValidator>
       
        <asp:TextBox ID="txtfechasalida" TextMode="Date" placeholder="31/12/2022" Font-Bold="true" ForeColor="#660033" runat="server" Width="162px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvfechasal" runat="server" ForeColor="#cc0000" ControlToValidate="txtfechasalida" ErrorMessage="Digite una fecha" Display="Dynamic"></asp:RequiredFieldValidator>
        
        <asp:Button ID="btnfiltrar" runat="server" Text="Filtrar" CssClass="btn btn-success" ForeColor="#ffffff" Font-Bold="true" Width="100px"  OnClick="btnfiltrar_Click"/>
        <a href="CrearReservacion.aspx" class="btn btn-info">Nueva Reservación</a><br /><br />
       </div><br />
    <div class="panel">
        
        <asp:GridView ID="GrdGestion" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" HeaderStyle-CssClass="listacciones" RowStyle-CssClass="rows">
        <Columns>
            <asp:BoundField DataField="idReservacion" HeaderText="Nº De Reservación" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="nombreCompleto" HeaderText="Cliente" />
            <asp:BoundField DataField="hotel" HeaderText="Hotel" />
            <asp:BoundField DataField="fechaEntrada" HeaderText="Fecha De Entrada" ItemStyle-HorizontalAlign="Center"  DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField DataField="fechaSalida" HeaderText="Fecha De Salida" ItemStyle-HorizontalAlign="Center"  DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField DataField="costoTotal" HeaderText="Costo" DataFormatString="${0:n2}" HeaderStyle-CssClass="text text-right" ItemStyle-HorizontalAlign="Right"/>
            <asp:BoundField DataField="estado" HeaderText="Estado" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="Consultar" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href="Detalle.aspx?id=<%# Eval("idReservacion") %>">Consultar</a>
                </ItemTemplate>
            </asp:TemplateField>
          </Columns> 
        </asp:GridView>
    </div>
</asp:Content>
