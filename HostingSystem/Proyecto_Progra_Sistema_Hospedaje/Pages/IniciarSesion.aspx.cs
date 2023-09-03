using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto_Progra_Sistema_Hospedaje.Classes;
using Proyecto_Progra_Sistema_Hospedaje.Data;

namespace Proyecto_Progra_Sistema_Hospedaje.Pages
{
    public partial class IniciarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btningresar_Click(object sender, EventArgs e)
        {
            bool Empleado = false, Cliente = false; //booleanos para saber si es empleado o no

                    using (HostingEntities db = new HostingEntities())
                    {
                    try
                    {
                    var login = db.spLogin(txtemail.Text, txtcontrasena.Text).FirstOrDefault();

                        if (login != null) // el procedimiento llama a sus dos parametros y si la variabl login es correcta hace lo demas
                        {

                            if (login.esEmpleado == true) 
                            {
                                Logueo objempleado = new Logueo();
                                objempleado.Idusuario = login.idPersona;
                                objempleado.NombreUsuario = login.nombreCompleto;
                                Session["Empleado"] = objempleado;
                                Empleado = true; 
                                
                            }

                            else if(login.esEmpleado == false)
                            {
                                Logueo objcliente = new Logueo();
                                objcliente.Idusuario = login.idPersona;
                                objcliente.NombreUsuario = login.nombreCompleto;
                                Session["Cliente"] = objcliente;
                                Cliente = true; 
                            }
                        if (Empleado == true) //redireccionamientos d los booleanos
                        {
                            Response.Redirect("~/Pages/GestionarReservaciones.aspx");// ya que es empleado se envia a gestionar
                        }
                        else if (Cliente == true)
                        {
                            Response.Redirect("~/Pages/MisReservaciones.aspx");//de otro modo cliente
                        }
                    }
                        else 
                        {
                            labelIngreso.Visible = true;
                        }
                    }
                    catch
                    {
                        labelIngreso.Visible = true;
                    }
               
            }
        }
    }
}