<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="Proyecto_Progra_Sistema_Hospedaje.Pages.IniciarSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../Css/InicioSesion.css" rel="stylesheet" type="text/css"/>
    <title>Iniciar Sesión</title>
</head>
<body>
  <h2 class="titulo">✈ Bienvenido a Despegar ✈ </h2>
    <form id="form1" runat="server" method="post">
    <section class="Formulario">
        <h4 class="etiquetalogin">Iniciar Sesión</h4>
        <asp:Label ID="lblemail" Font-Size="Large" CssClass="labels" runat="server" Text="Correo :"></asp:Label>
        <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="Campo Requerido" Display="Dynamic"
           ControlToValidate="txtemail" Font-Italic="True" Font-Size="Medium"></asp:RequiredFieldValidator> 
         <asp:TextBox ID="txtemail" placeholder="Email@hotmail.com" CssClass="texbox" runat="server"></asp:TextBox>
            
        <asp:Label ID="lblcontrasena" Font-Size="Large" CssClass="labels" runat="server" Text="Contraseña :"></asp:Label>
        <asp:RequiredFieldValidator ID="rfvcontrasena" runat="server" ErrorMessage="Campo Requerido" Display="Dynamic"
          ControlToValidate="txtcontrasena" Font-Italic="True" Font-Size="Medium"></asp:RequiredFieldValidator>
         <asp:TextBox ID="txtcontrasena" TextMode="Password" placeholder="Contraseña" CssClass="texbox" runat="server"></asp:TextBox>
         
            <asp:Label ID="labelIngreso" Visible="false" ForeColor="#cc3300" Font-Italic="True" Font-Size="Medium" runat="server" Text="El usuario o la contraseña tiene datos incorrectos"></asp:Label><br/>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Button ID="btningresar" OnClick="btningresar_Click" CssClass="boton" runat="server" Text="☛ Entrar ☚" /><br />
        
        <footer class="parteinferior"></footer>
    </section>
    </form>
    
</body>
</html>
