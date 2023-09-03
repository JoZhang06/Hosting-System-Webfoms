<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisReservaciones.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.MisReservaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="titulos">Mis reservaciones</h2>
    
        <asp:Button ID="btnnuevo" CssClass="btn btn-info" OnClick="btnnuevo_Click" runat="server" Text="Nueva Reservación" /><br />
        <br />

    <div class="panel">
        <asp:GridView ID="grdMisRervaciones" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" HeaderStyle-CssClass="listacciones" RowStyle-CssClass="rows">
         <columns>
                    <asp:BoundField DataField="idReservacion" HeaderText="Nº De Reservacion"/>

                     <asp:BoundField DataField="Hotel" HeaderText="Hotel"/>
                   
                     <asp:BoundField DataField="fechaEntrada" HeaderText="Fecha entrada" DataFormatString=" {0:dd/MM/yyyy } "/> 
             
                     <asp:BoundField DataField="fechaSalida" HeaderText="Fecha salida" DataFormatString="{0:dd/MM/yyyy } " />

                    <asp:BoundField DataField="costoTotal" HeaderText="Costo"  DataFormatString="${0:n2}"/>

                     <asp:BoundField DataField="estado" HeaderText="Estado"/>

                <asp:TemplateField HeaderText="Consultar" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate> 
                    <a href="Detalle.aspx?id=<%# Eval("idReservacion") %>">Consultar</a> </ItemTemplate>
            </asp:TemplateField>

         </columns>

    </asp:GridView>
    </div>
</asp:Content>
