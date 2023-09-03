<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaHabitaciones.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.ListaHabitaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2 class="titulos">Lista De Habitaciones</h2>
    <a href="CreacionHabitacion.aspx" class="btn btn-info" >Crear Habitación</a><br />
     <br>
    <div class="panel">
    <asp:GridView ID="grdlistahab" AutoGenerateColumns="false" runat="server" CssClass="table table-striped" HeaderStyle-CssClass="listacciones" RowStyle-CssClass="rows">
        <Columns>
            <asp:BoundField DataField="idHabitacion" HeaderText="ID" ItemStyle-Width="70px" HeaderStyle-CssClass="text text-center" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="nombre" HeaderText="Hotel" ItemStyle-Width="250px"/>
            <asp:BoundField DataField="numeroHabitacion" HeaderText="Número Habitación" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25px" HeaderStyle-CssClass="text text-center"/>
            <asp:BoundField DataField="capacidadMaxima" HeaderText="Capacidad Máxima" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25px" HeaderStyle-CssClass="text text-center"/>
            <asp:BoundField DataField="estado" HeaderText="Estado" ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text text-center"/>
            <asp:TemplateField HeaderText="⬇⬇⬇⬇⬇⬇⬇⬇" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" HeaderStyle-CssClass="text text-center">
                <ItemTemplate>
                    <a class="btn btn-default" href="EdicionHabitacion.aspx?id=<%# Eval("idHabitacion") %>">Modificar</a>
                 </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView></div>
</asp:Content>
